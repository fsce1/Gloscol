using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class PlayerController : MonoBehaviour
{
    public static PlayerController Player;
    private void Awake()
    {
        if (Player != null && Player != this) Destroy(this);
        else Player = this;
    }


    private Rigidbody2D rb;
    private SpriteRenderer sr;

    //public Sprite[] idleSprites;
    public Animator anim;
    public float animMult;

    private Vector3 curVelocity = Vector3.zero;

    //public float frameTime = 0.5f;
    [Header("Movement")]
    public float moveSpeed = 10;
    public float frictionAmount = 5;
    public float knockbackAmount = 2;
    public float terminalVel = 10;
    public float gravityPower = 2;
    //public float initVel = 50f;


    public float jumpUpForce = 5f;
    float horizontalMove = 0f;


    private void Start()
    {
        sr = GetComponent<SpriteRenderer>();
        rb = GetComponent<Rigidbody2D>();

        anim = GetComponent<Animator>();

    }

    private void Update()
    {




        float moveVel; //seems to work
        if (GameManager.GM.controlsAreVertical)
        {
            moveVel = Mathf.Lerp(0, 1, Mathf.Abs(rb.velocity.y / moveSpeed));
        }
        else moveVel = Mathf.Lerp(0, 1, Mathf.Abs(rb.velocity.x / moveSpeed));
        //Experimental Anim Stuff
        if (moveVel > 0.01f && IsGrounded())
        {
            anim.speed = moveVel * animMult;
            //Debug.Log(moveVel);
            //foreach (AnimationState state in anim) state.speed = curVelocity.x * animAccelSpeed;
            anim.Play("Base Layer.Walk");

        }




        else
        {
            anim.Play("Base Layer.Idle");
        }


        horizontalMove = Input.GetAxisRaw("Horizontal");
        if (Input.GetKeyDown(KeyCode.Space)) Jump();
    }

    //public float AbsoluteVel()
    //{
    //    if (GameManager.GM.controlsAreVertical) return rb.velocity.y;
    //    return rb.velocity.x;
    //}


    private void FixedUpdate()
    {
        rb.AddForce(GameManager.GM.curGravity * 9.81f * gravityPower);
        //rb.velocity -= targetVel / decelSpeed;




        //LOOK AT THIS!!!!!!!!!!!!!!!!!!!! PLEASE!!!!!

        ////if (GameManager.GM.controlsAreVertical) //new code i wrote while drunk-ish, for some reason only works if i jump, not at fall at start of level
        ////{
        ////    if (rb.velocity.x > terminalVel) rb.velocity += new Vector2(terminalVel, 0) - new Vector2(rb.velocity.x, 0);
        ////}
        ////else if (rb.velocity.y > terminalVel) rb.velocity -= new Vector2(0, rb.velocity.y) - new Vector2(0, terminalVel);



        Move(horizontalMove);

        if (Input.GetKey(KeyCode.Space) && !IsGrounded())
        {
            rb.AddForce(-GameManager.GM.curGravity * jumpUpForce);
        }


        //if (GameManager.GM.controlsAreVertical)
        //{
        //    Mathf.Clamp(rb.velocity.y, 0, maxSpeed);
        //    //if (absVel > maxSpeed) rb.velocity -= new Vector2(0, absVel-maxSpeed);
        //}
        //else
        //{
        //    Mathf.Clamp(rb.velocity.x, 0, maxSpeed);
        //    //if (absVel > maxSpeed) rb.velocity -= new Vector2(absVel-maxSpeed - absVel, 0);

        //}


    }

    public bool IsGrounded()
    {
        RaycastHit2D[] hits = Physics2D.RaycastAll(transform.position, GameManager.GM.curGravity, 1f); //!!!!more tipsy code, i think this works tho.
        bool isGrounded = false;
        foreach (RaycastHit2D hit in hits)
        {
            if (hit.collider.CompareTag("Floor"))
            {
                isGrounded = true;
            }
        }
        return isGrounded;
    }
    public float jumpHeight;


    //private void OnCollisionStay2D(Collision2D col)
    //{
    //    Debug.Log(col.gameObject.tag);
    //    if (col.gameObject.CompareTag("Floor")) isGrounded = true;
    //}

    public void Jump()
    {

        if (!IsGrounded()) return;

        Debug.Log("Jump" + -GameManager.GM.curGravity);
        rb.AddForce(-GameManager.GM.curGravity * jumpHeight * 4);

        //RaycastHit2D[] hit = Physics2D.RaycastAll(transform.position, grav.v2);
        //for (int i = 0; i < hit.Length; i++)
        //{
        //    if (hit[i].collider.tag.Equals("Floor"))
        //    {
        //        if (hit[i].distance <= 1.7f)
        //        {
        //            Debug.Log("Jump" + grav.v2);
        //            rb.AddForce(grav.v2 * 10);
        //        }
        //    }
        //}
    }
    //Vector2 targetVel;
    private void Move(float move)
    {

        var curRbMovement = rb.velocity;


        if (GameManager.GM.controlsAreVertical)
        {
            rb.AddForce(new Vector2(0, move * moveSpeed * frictionAmount));
            rb.AddForce(new Vector2(0, -curRbMovement.y * frictionAmount));
        }
        else
        {
            rb.AddForce(new Vector2(move * moveSpeed * frictionAmount, 0));
            rb.AddForce(new Vector2(-curRbMovement.x * frictionAmount, 0));

        }


        //if (GameManager.GM.controlsAreVertical)
        //{
        //    targetVel = new Vector2(0, move * Time.deltaTime * accelSpeed);

        //}
        //else
        //{
        //    targetVel = new Vector2(move * Time.deltaTime * accelSpeed, 0);

        //}


        //rb.velocity += targetVel;
        //float absVel = AbsoluteVel(); //!!!! none of this works. not even AbsoluteVel();
        //Debug.Log(absVel);




        //rb.velocity = Vector3.SmoothDamp(rb.velocity, targetVel, ref curVelocity, 0.1f);
        //if (jump && isGrounded)
        //{
        //    //rb.AddForce(new Vector3(0f, 400f));
        //    rb.AddForce(-grav.v2 * 10);
        //}




        if (move > 0)
        {
            sr.flipX = false;
        }
        else if (move < 0)
        {
            sr.flipX = true;
        }
    }
    public void Die()
    {

    }
    private void OnTriggerEnter2D(Collider2D col)
    {
        Debug.Log(col.gameObject.name);

        int curHealth = GameManager.GM.curHealth;
        int score = GameManager.GM.score;

        if (col.CompareTag("GravTrigger")) return;
        switch (col.gameObject.tag)
        {
            case "Coin":
                Destroy(col.gameObject);
                score++;
                break;
            case "HealthPack":
                Destroy(col.gameObject);
                curHealth += 10;
                break;
            case "DamagePack":
                rb.velocity -= rb.velocity * knockbackAmount;
                curHealth -= 10;
                break;
            case "Enemy":
                rb.velocity -= rb.velocity * knockbackAmount;

                //ContactPoint2D contact = collision.contacts[0];



                //rb.velocity -= rb.velocity * knockbackAmount;
                break;

        }
        GameManager.GM.curHealth = curHealth;
        GameManager.GM.score = score;
        //IEnumerator idle()
        //{
        //    for (int i = 0; i < idleSprites.Length; i++)
        //    {
        //        sr.sprite = idleSprites[i];
        //        i++;
        //        yield return new WaitForSeconds(frameTime);
        //        yield return 0;
        //    }
        //    StartCoroutine(idle());
        //}
    }
}