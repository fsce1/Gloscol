using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Trail : MonoBehaviour
{

    public Ball ball;
    Rigidbody2D rb;

    // Start is called before the first frame update
    void Start()
    {
        rb = ball.GetComponent<Rigidbody2D>();
    }

    // Update is called once per frame
    void Update()
    {

        transform.localScale = new Vector3 (Mathf.Lerp(0, 10, rb.velocity.x/100), transform.localScale.y, transform.localScale.z);
    }
}
