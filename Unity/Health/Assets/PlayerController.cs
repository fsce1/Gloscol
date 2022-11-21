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
    [Header("Movement")]
    public float accelSpeed = 50f;
    public float decelSpeed = 50f;
    //public float initVel = 50f;
    public float maxSpeed = 50f;

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
        rb.velocity -= targetVel / decelSpeed;


        move(horizontalMove);

        if (!Input.GetKey(KeyCode.Space))
        {
            rb.AddForce(gravityDir * jumpDownForce);
        }

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

    public void RotateChar(Vector2 v2)
    {
        transform.up = -v2;//!!!!Gradual Rotation
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
    private void move(float move)
    {
        if (GameManager.GM.controlsAreVertical)
        {
            targetVel = new Vector2(0, move * Time.deltaTime * accelSpeed);

        }
        else
        {
            targetVel = new Vector2(move * Time.deltaTime * accelSpeed, 0);

        }


        rb.velocity += targetVel;
        float absVel = AbsoluteVel(); //!!!! none of this works. not even AbsoluteVel();



        if (GameManager.GM.controlsAreVertical)
        {
            Mathf.Clamp(rb.velocity.y, 0, absVel);
            //if (absVel > maxSpeed) rb.velocity -= new Vector2(0, absVel-maxSpeed);
        }
        else
        {
            Mathf.Clamp(rb.velocity.x, 0, absVel);
            //if (absVel > maxSpeed) rb.velocity -= new Vector2(absVel-maxSpeed - absVel, 0);

        }


        //rb.velocity = Vector3.SmoothDamp(rb.velocity, targetVel, ref curVelocity, 0.1f);
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