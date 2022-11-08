using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    bool facingRight = true;
    bool jump = false;
    bool isGrounded = true;

    private Rigidbody2D rb;
    private SpriteRenderer sr;

    public Sprite[] idleSprites;

    private Vector3 curVelocity = Vector3.zero;

    public float frameTime = 0.5f;
    public float runSpeed = 20f;
    public float jumpDownForce = 10f;
    public float jumpHeldInAirMultiplier = 20f;
    float horizontalMove = 0f;
    private void Start()
    {
        sr = GetComponent<SpriteRenderer>();
        rb = GetComponent<Rigidbody2D>();
        StartCoroutine("idle");
    }
    private void Update()
    {
        horizontalMove = Input.GetAxisRaw("Horizontal") * runSpeed;
        if (Input.GetKeyDown(KeyCode.Space))
        {
            jump = true;
        }
        transform.rotation = Quaternion.Euler(Vector3.zero);
    }
    private void FixedUpdate()
    {
        RaycastHit2D[] hit = Physics2D.RaycastAll(transform.position, -Vector2.up);
        for (int i = 0; i < hit.Length; i++)
        {
            if (hit[i].collider.tag.Equals("Floor"))
            {
                if (hit[i].distance <= 1.7f)
                {
                    isGrounded = true;
                }
                else isGrounded = false;
            }
        }

        move(horizontalMove * Time.fixedDeltaTime, jump);
        jump = false;


        //!isGrounded &&
        if (rb.velocity.y < 0f)
        {
            rb.AddForce(new Vector3(0f, -jumpDownForce));
        }
        if (!Input.GetKey(KeyCode.Space) && rb.velocity.y > 0f)
        {
            rb.AddForce(new Vector3(0f, -jumpHeldInAirMultiplier));
        }

    }
    private void move(float move, bool jump)
    {
        Vector3 targetVel = new Vector3(move * 10f, rb.velocity.y);
        rb.velocity = Vector3.SmoothDamp(rb.velocity, targetVel, ref curVelocity, 0.05f);
        if (jump && isGrounded)
        {
            rb.AddForce(new Vector3(0f, 400f));
        }
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
    IEnumerator idle()
    {
        for (int i = 0; i < idleSprites.Length; i++)
        {
            sr.sprite = idleSprites[i];
            i++;
            yield return new WaitForSeconds(frameTime);
            yield return 0;
        }
        StartCoroutine(idle());
    }
}
