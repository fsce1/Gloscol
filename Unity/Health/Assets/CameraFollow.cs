using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraFollow : MonoBehaviour
{
    public float camMoveSpeed = 5;
    public Vector2 CameraLimits;
    public bool isntFollowing;
    //public Vector3[] CamXposToMoveYAmount;
    //private float OriginalCameraY;

    void FixedUpdate()
    {
        //Vector2 leftBound = 
        if (isntFollowing)
        {
            transform.position = Camera.main.transform.position;
            return;
        }
        Vector2 dirToMove = GameManager.GM.player.transform.position - transform.position;
        transform.position += new Vector3(dirToMove.x * Time.deltaTime * camMoveSpeed, dirToMove.y * Time.deltaTime * camMoveSpeed);
        //Mathf.Clamp(transform.position.x, CameraLimits.x, CameraLimits.y);
        Vector3 trans = transform.position;
        trans.x = Mathf.Clamp(trans.x, CameraLimits.x, CameraLimits.y);
        transform.position = trans;

        //if (Player.transform.position.x >= transform.position.x)
        //{
        //    float dirToMoveX = Player.transform.position.x - transform.position.x;
        //    transform.position += new Vector3(dirToMoveX * Time.deltaTime, 0);
        //    transform.position = new Vector3(Mathf.Clamp(transform.position.x, 0, CameraEndXPos), transform.position.y, transform.position.z);
        //    //if (transform.position.x >= CameraEndXPos) transform.position = new Vector3(CameraEndXPos, transform.position.y);
        //}
        //foreach (Vector3 v3 in CamXposToMoveYAmount)
        //{

        //    float dirToMoveY = v3.y - transform.position.y;
        //    if (transform.position.x > v3.z)
        //    {
        //        //MoveY(transform.position.y - v3.y);
        //        //float dirToMoveY = 0f;
        //        //transform.position += new Vector3(0, dirToMoveY * Time.deltaTime);
        //        transform.position -= new Vector3(0, dirToMoveY * Time.deltaTime);
        //        transform.position = new Vector3(transform.position.x, Mathf.Clamp(transform.position.y, v3.y, OriginalCameraY), transform.position.z);
        //    }
        //    else if (transform.position.x > v3.x)
        //    {
        //        //MoveY(v3.y - transform.position.y);
        //        //float dirToMoveY = v3.y - transform.position.y;
        //        transform.position += new Vector3(0, dirToMoveY * Time.deltaTime);
        //        transform.position = new Vector3(transform.position.x, Mathf.Clamp(transform.position.y, v3.y, OriginalCameraY), transform.position.z);
        //    }
        //}
    }
    //void MoveY(float dirToMoveY)
    //{
    //    transform.position += new Vector3(0, dirToMoveY * Time.deltaTime);
    //    transform.position = new Vector3(transform.position.x, Mathf.Clamp(transform.position.y, dirToMoveY, 100), transform.position.z);
    //}
}