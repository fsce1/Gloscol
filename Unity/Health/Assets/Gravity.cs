using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Gravity : MonoBehaviour
{
    public Vector2 v2;
    public Rigidbody2D playerRb;
    void FixedUpdate()
    {
        playerRb.AddForce(v2 * 9.81f);
    }
}
