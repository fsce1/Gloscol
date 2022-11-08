using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraController : MonoBehaviour
{
    public WorldSpaceCursor cursor;
    public Vector2 MouseMovement;
    public bool rotLocked = false;
    public bool panLocked = false;
    public bool zoomLocked = false;
    void Update()
    {
        MouseMovement = new Vector3(Input.GetAxis("Mouse X"), Input.GetAxis("Mouse Y"));
        float distFromCursor = Vector3.Distance(transform.position, cursor.transform.position);
        if (Input.GetMouseButton(1) || Input.GetMouseButton(2)){
            cursor.BlockUpdate = true;
        }
        else cursor.BlockUpdate = false;
        if (!rotLocked)
        {
            float rotateSpeed = GameManager.GM.rotateSpeed;
            if (Input.GetKeyDown(KeyCode.Mouse1))
            {
                transform.SetParent(cursor.transform, true);
            }
            //else if (Input.GetKeyUp(KeyCode.Mouse2) && MouseMovement == new Vector2 (0, 0))
            else if (Input.GetKeyUp(KeyCode.Mouse1))
            {
                transform.SetParent(null, true);
            }
            if (Input.GetMouseButton(1))
            {
                //Vector3 originalEulers = cursor.FunctionalCursor.localRotation.eulerAngles;
                Vector3 newEulers = new Vector3(
                    MouseMovement.y * -1 * Time.deltaTime * 10 * rotateSpeed,
                    MouseMovement.x * Time.deltaTime * 10 * rotateSpeed,
                    0);

                //cursor.FunctionalCursor.Rotate(newEulers, Space.Self);
                cursor.transform.localEulerAngles += newEulers;
            }
        }
        if (!panLocked)
        {
            float panSpeed = GameManager.GM.panSpeed;
            if (Input.GetMouseButton(2))
            {
                Camera.main.transform.Translate(MouseMovement * Time.deltaTime * panSpeed * -1 * (distFromCursor / 10), Space.Self);
            }
            
        }
        if (!zoomLocked)
        {
            float zoomIncrement = GameManager.GM.zoomIncrement;
            if (Input.mouseScrollDelta.y > 0) transform.position += transform.forward * zoomIncrement * (distFromCursor / 10); //should be distance to cursor + work on panning
            else if (Input.mouseScrollDelta.y < 0) transform.position -= transform.forward * zoomIncrement * (distFromCursor / 10);
        }
    }
    public void LockUnlockCameraRot()
    {
        rotLocked = !rotLocked;
    }
    public void LockUnlockCameraPan()
    {
        panLocked = !panLocked;
    }
    public void LockUnlockCameraZoom()
    {
        zoomLocked = !zoomLocked;
    }
}