using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TeleportPipe : MonoBehaviour
{
    public GameObject Player;
    public bool isUp = false;


    public void OnTriggerEnter2D(Collider2D col)
    {
        if (col.gameObject.layer == 9)
        {
            while (isUp && Player.transform.position != transform.position) //gets stuck because its never EXACTLY the same position. maybe a second collider
            {
                Player.transform.position += Player.transform.position - transform.position * Time.deltaTime;
            }
        }
    }
}