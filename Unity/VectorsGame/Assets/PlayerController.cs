using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{

    public float force = 100f;
    public Vector3 target = Vector3.zero;
    Rigidbody2D rb;
    void Start() { rb = GetComponent<Rigidbody2D>(); }
    void Update()
    {
        if (Input.GetButtonDown("Fire1"))
        {
            rb.velocity = Vector3.zero;
            rb.angularVelocity = 0;
            Vector3 mousePos = Camera.main.ScreenToWorldPoint(Input.mousePosition);
            target = new Vector3(mousePos.x, mousePos.y, 0);
            Vector3 direction = (target - transform.position).normalized;
            rb.AddForce(direction * force, ForceMode2D.Force);
        }
    }
}
