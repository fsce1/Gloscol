using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;
using UnityEngine.Rendering.PostProcessing;

public class GameManager : MonoBehaviour
{
    public static GameManager GM;
    private void Awake()
    {
        if (GM != null && GM != this) Destroy(this);
        else GM = this;
    }
    public PlayerController player;
    public Transform directionArrow;
    public Texture2D arrowGraphic;
    public Vector2 curGravity;

    public float timeScale;

    //public int cameraDistortionAmount;
    //public PostProcessVolume ppv;

    public int score = 0;

    public TextMeshProUGUI scoreText;


    public bool controlsAreVertical = false;


    public void ChangeGravDir(Vector2 v2)
    {
        StartCoroutine(RotateVisual(v2));
        curGravity = v2;
        //player.RotateChar(v2);
        //player.transform.up = -v2;
    }

    public IEnumerator RotateVisual(Vector2 v2)
    {
        float rotTime = 0;
        //transform.up = -v2;//!!!!Make this Gradual Rotation
        Vector3 initialValue = transform.up;
        Texture2D newGraphic = arrowGraphic;
        newGraphic.filterMode = FilterMode.Point;

        while (rotTime <= 1)
        {
            directionArrow.transform.up = player.transform.up;
            player.transform.up = Vector2.Lerp(initialValue, -v2, rotTime);
            yield return new WaitForSeconds(0.01f);
            rotTime += 0.05f;
        }
        transform.up = -v2;
        directionArrow.transform.up = -v2;
    }

    void Start()
    {
        curGravity = new Vector2(0, -1);
    }

    //public Vector3 getPlayerPos()
    //{
    //    return PlayerController.Player.transform.position;
    //}
    // Update is called once per frame
    void Update()
    {
        //ppv.GetComponent<LensDistortion>().intensity.value = Mathf.Lerp(0, 1, cameraDistortionAmount / 40f);
        Time.timeScale = timeScale;


        if (curGravity.y < 0) controlsAreVertical = false;
        else controlsAreVertical = true;


        scoreText.text = "Score: " + score;
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
