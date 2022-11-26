using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GravTrigger : MonoBehaviour
{
    public Vector2 dirToChangeTo;

    void Start()
    {
    }

    void Update()
    {
    }
    public void OnTriggerEnter2D(Collider2D col)
    {
        if (!col.gameObject.CompareTag("Player")) return;
        Debug.Log("Changing Gravity to "+dirToChangeTo);
        GameManager.GM.ChangeGravDir(dirToChangeTo);
    }

}
