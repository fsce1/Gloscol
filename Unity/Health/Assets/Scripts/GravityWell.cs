using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GravityWell : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        PlayerController player = GameManager.GM.player;
        GameManager.GM.ChangeGravDir(transform.position - player.transform.position);
    }



    private void OnTriggerStay2D(Collider2D col)
    {
        
    }
}
