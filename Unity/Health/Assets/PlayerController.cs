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

    bool facingRight = true;
    bool isGrounded = true;

    private Rigidbody2D rb;
    private SpriteRenderer sr;

    //public Sprite[] idleSprites;
    public Animator anim;
    public float animAccelSpeed;

    private Vector3 curVelocity = Vector3.zero;

    //public float frameTime = 0.5f;
    public float runSpeed = 50f;
    public float jumpDownForce = 2f;
    float horizontalMove = 0f;


    private void Start()
    {
        sr = GetComponent<SpriteRenderer>();
        rb = GetComponent<Rigidbody2D>();

        anim = GetComponent<Animator>();
        grav = GetComponent<Gravity>();

    }

    private void Update()
    {

        //Experimental Anim Stuff
        if (isGrounded && Mathf.Abs(curVelocity.x) > 0.1f)
        {
            //foreach (AnimationState state in anim) state.speed = curVelocity.x * animAccelSpeed;
            //anim.Play(BaseLayer.Walk);
            anim.Play("Base Layer.Walk");
        }
        else
        {
            anim.Play("Base Layer.Idle");
        }


        horizontalMove = Input.GetAxisRaw("Horizontal") * runSpeed;
        if (Input.GetKeyDown(KeyCode.Space)) Jump();
    }
    private void FixedUpdate()
    {
        move(horizontalMove);

        if (!Input.GetKey(KeyCode.Space))
        {
            rb.AddForce(grav.v2 * jumpDownForce);
        }

    }
    Gravity grav;

    private void OnCollisionEnter2D(Collision2D col)
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
        Debug.Log("Jump" + -grav.v2);
        rb.AddForce(-grav.v2 * 400);


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
    private void move(float move)
    {
        Vector3 targetVel;
        if (GameManager.GM.controlsAreVertical) targetVel = new Vector3(rb.velocity.x, move * 10f);
        else targetVel = new Vector3(move * 10f, rb.velocity.y);

        rb.velocity = Vector3.SmoothDamp(rb.velocity, targetVel, ref curVelocity, 0.1f);
        //if (jump && isGrounded)
        //{
        //    //rb.AddForce(new Vector3(0f, 400f));
        //    rb.AddForce(-grav.v2 * 10);
        //}




        if (move > 0 && !facingRight)
        {
            flip();
        }
        else if (move < 0 && facingRight)
        {
            flip();
        }
    }
    void flip()
    {
        facingRight = !facingRight;

        Vector3 scale = transform.localScale;
        scale.x *= -1;
        transform.localScale = scale;
    }
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