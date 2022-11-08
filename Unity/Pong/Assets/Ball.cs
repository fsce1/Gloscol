using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ball : MonoBehaviour
{
    Vector3 startPos;
    Rigidbody2D rb;
    public bool curTravelDir;


    private void FixedUpdate()
    {
        if (!curTravelDir)
        {
            rb.AddForce(Vector2.left * Time.deltaTime * 10);
        }
        else
        {
            rb.AddForce(Vector2.right * Time.deltaTime * 10);
        }
    }
    void Start()
    {
        startPos = transform.position;
        rb = GetComponent<Rigidbody2D>();
    }
    public void ResetPosition()
    {
        rb.velocity = Vector2.zero;
        transform.position = startPos;
    }
    public void FireBall()
    {
        float rand = Random.Range(0, 2);
        if (rand < 1)
        {
            rb.AddForce(new Vector2(20, -15));
            curTravelDir = true;
        }
        else
        {
            rb.AddForce(new Vector2(-20, -15));
            curTravelDir = false;
        }
    }
    void OnCollisionEnter2D(Collision2D col)
    {
        if (col.collider.CompareTag("Player"))
        {
            Vector2 vel;
            vel.x = rb.velocity.x;
            vel.y = (rb.velocity.y / 2) + (col.collider.attachedRigidbody.velocity.y / 3) + Random.Range(-8, 8);
            rb.velocity = vel;

            curTravelDir = !curTravelDir;
        }

    }
}
