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

    bool isGrounded = true;

    private Rigidbody2D rb;
    private SpriteRenderer sr;

    //public Sprite[] idleSprites;
    public Animator anim;
    public float animAccelSpeed;

    private Vector3 curVelocity = Vector3.zero;

    //public float frameTime = 0.5f;
    [Header("Movement")]
    public float moveSpeed = 10;
    public float frictionAmount = 5;
    public float knockbackAmount = 2;
    //public float initVel = 50f;


    public float jumpDownForce = 2f;
    float horizontalMove = 0f;


    private void Start()
    {
        sr = GetComponent<SpriteRenderer>();
        rb = GetComponent<Rigidbody2D>();

        anim = GetComponent<Animator>();

    }

    private void Update()
    {
        float anyVelocity = Mathf.Clamp(Mathf.Abs((curVelocity.x + 1 * curVelocity.y + 1) - 1) / 25, 0, 1);
        //Experimental Anim Stuff
        if (isGrounded && anyVelocity > 0.01f)
        {
            anim.speed = anyVelocity;
            Debug.Log(anyVelocity);
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
    public Vector2 gravityDir;

    public float AbsoluteVel()
    {
        if (GameManager.GM.controlsAreVertical) return rb.velocity.y;
        return rb.velocity.x;
    }


    private void FixedUpdate()
    {
        rb.AddForce(gravityDir * 9.81f);
        //rb.velocity -= targetVel / decelSpeed;


        Move(horizontalMove);

        if (!Input.GetKey(KeyCode.Space))
        {
            rb.AddForce(gravityDir * jumpDownForce);
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
    public float jumpHeight;


    private void OnCollisionEnter2D(Collision2D col)//!!!!make cleaner
    {
        if (col.gameObject.CompareTag("Floor")) isGrounded = true;
    }
    private void OnCollisionExit2D(Collision2D col)
    {
        if (col.gameObject.CompareTag("Floor")) isGrounded = false;
    }

    public void Jump()
    {
        if (!isGrounded) return;
        Debug.Log("Jump" + -gravityDir);
        rb.AddForce(-gravityDir * jumpHeight * 4);

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
    Vector2 targetVel;
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


    private void OnCollisionEnter2D(Collision collision) //fix
    {
        switch (collision.gameObject.tag)
        {
            case "Enemy":

                ContactPoint contact = collision.contacts[0];
                rb.AddForce(collision.transform.position - contact.point * knockbackAmount);

                //ContactPoint2D contact = collision.contacts[0];



                //rb.velocity -= rb.velocity * knockbackAmount;
                break;
        }
    }
    private void OnTriggerEnter2D(Collider2D col)
    {
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