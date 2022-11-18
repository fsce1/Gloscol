using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public static GameManager GM;
    private void Awake()
    {
        if (GM != null && GM != this) Destroy(this);
        else GM = this;
    }
    public PlayerController player;
    public GravDir curGravDir = GravDir.Down;
    public enum GravDir
    {
        Up,
        Down,
        Left,
        Right
    }
    public Gravity playerForce;
    public bool controlsAreVertical = false;

    public void RotateChar(Vector2 v2)
    {

    }
    public void ChangeGravDir(Vector2 v2)
    {
        playerForce.v2 = v2;
        RotateChar(v2);
        player.transform.up = -v2;
    }
    void Start()
    {
        playerForce = PlayerController.Player.GetComponent<Gravity>();
    }

    //public Vector3 getPlayerPos()
    //{
    //    return PlayerController.Player.transform.position;
    //}
    // Update is called once per frame
    void Update()
    {
        if (playerForce.v2.y != 0) controlsAreVertical = false;
        else controlsAreVertical = true;
        //objToRotateAround.transform.position = lastPlayerPos;
        //if (objToRotateAround.localEulerAngles.z == targetZRot)
        //{
        //    //objToRotate.Rotate(PlayerController.Player.transform.position, targetZRot * Time.deltaTime);
        //    //envToRotate.SetParent(objToRotateAround, true);
        //    //StartCoroutine(RotateScene());
        //    //objToRotateAround.localEulerAngles += new Vector3 (0,0, targetZRot * Time.deltaTime/2);
        //    envToRotate.SetParent(null, true);
        //}
    }


    //public void ChangeGravity(GravDir gravDir)
    //{

    //    //actually change gravity
    //    Debug.Log("Changing Gravity");
    //    //switch (gravDir)
    //    //{
    //    //    case GravDir.Down:
    //    //        targetZRot = 0;
    //    //        break;
    //    //    case GravDir.Right:
    //    //        targetZRot = 90;
    //    //        break;
    //    //    case GravDir.Up:
    //    //        targetZRot = 180;
    //    //        break;
    //    //    case GravDir.Left:
    //    //        targetZRot = -90;
    //    //        break;
    //    //}

    //    //envToRotate.SetParent(objToRotateAround, true);
    //    //if(!isRunning) StartCoroutine(RotateScene());


    //    //objToRotate.localEulerAngles = gravDir;

    //    //switch (objToRotate.localEulerAngles.z)
    //    //{
    //    //    //case Vector2.down:
    //    //    case 0:
    //    //        curGravDir = GravDir.Down;
    //    //        break;
    //    //    case 90:
    //    //        curGravDir = GravDir.Right;
    //    //        break;
    //    //    case 180:
    //    //        curGravDir = GravDir.Up;
    //    //        break;
    //    //    case 270:
    //    //        curGravDir = GravDir.Left;
    //    //        break;
    //    //}
    //}
    //bool isRunning = false;
    //IEnumerator RotateScene ()
    //{
    //    isRunning = true;
    //    float time = 0;
    //    while(time<=1)
    //    {
    //        objToRotateAround.localEulerAngles = Vector3.Lerp(objToRotateAround.localEulerAngles, new Vector3(0, 0, targetZRot), time);
    //        time += 0.05f;
    //        yield return new WaitForSeconds(0.1f);
    //    }
    //    isRunning = false;
    //}
}
