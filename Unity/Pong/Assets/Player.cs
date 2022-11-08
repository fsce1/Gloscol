using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Player : MonoBehaviour
{
    public GameManager.Side side;
    float VerticalMoveSpeed = 250f;
    Vector3 startPos;
    Rigidbody2D rb;
    void Start()
    {
        startPos = transform.position;
        rb = GetComponent<Rigidbody2D>();
    }

    void Update()
    {
        if(side == GameManager.Side.Left)
        {
            if(Input.GetKey(KeyCode.W) && transform.position.y < 4)
            {
                rb.MovePosition(transform.position + Vector3.up * VerticalMoveSpeed * Time.deltaTime);
            }
            if (Input.GetKey(KeyCode.S) && transform.position.y > -4)
            {
                rb.MovePosition(transform.position - Vector3.up * VerticalMoveSpeed * Time.deltaTime);
            }
        }
        else if (side == GameManager.Side.Right)
        {
            if (Input.GetKey(KeyCode.UpArrow) && transform.position.y < 4)
            {
                rb.MovePosition(transform.position + Vector3.up * VerticalMoveSpeed * Time.deltaTime);
            }
            if (Input.GetKey(KeyCode.DownArrow) && transform.position.y > -4)
            {
                rb.MovePosition(transform.position - Vector3.up * VerticalMoveSpeed * Time.deltaTime);
            }
        }
    }
    public void ResetPosition()
    {
        transform.position = startPos;
    }
}
