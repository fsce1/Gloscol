using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Goal : MonoBehaviour
{

    public GameManager.Side side;
    private void OnCollisionEnter2D(Collision2D col)
    {
        if (col.gameObject.tag.Equals("Ball"))
        {
            GameObject.FindWithTag("Score").GetComponent<Score>().PlayerScored(side);
        }
    }
}
