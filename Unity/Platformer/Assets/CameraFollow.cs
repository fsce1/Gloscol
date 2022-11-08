using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    public GameObject Player;
    Camera cam;
    public float CameraEndXPos;

    private void Start()
    {
        cam = GetComponent<Camera>();
    }
    void Update()
    {
        if (Player.transform.position.x >= transform.position.x)
        {
            float dirToMoveX = Player.transform.position.x - transform.position.x;
            transform.position += new Vector3(dirToMoveX * Time.deltaTime, 0);
            transform.position = new Vector3(Mathf.Clamp(transform.position.x, 0.5f, CameraEndXPos), transform.position.y, transform.position.z);
            //if (transform.position.x >= CameraEndXPos) transform.position = new Vector3(CameraEndXPos, transform.position.y);
        }
    }
}