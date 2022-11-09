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

    private void OnCollisionEnter(Collision col)
    {

    }
    void Update()
    {
        //maybe clamp X and Y rot to 90 and -90 somehow
        MouseMovement = new Vector3(Input.GetAxis("Mouse X"), Input.GetAxis("Mouse Y"));
        float distFromCursor = Vector3.Distance(transform.position, cursor.transform.position);

        //if (!rotLocked && Input.GetMouseButton(1) || !panLocked && Input.GetMouseButton(2))
        //if (!rotLocked && Input.GetMouseButton(1))

        //{
        //    cursor.BlockUpdate = true;
        //    transform.SetParent(cursor.transform, true);

        //}
        //else
        //{
        //    cursor.BlockUpdate = false;
        //    transform.SetParent(null, true);
        //}

        if (!rotLocked)
        {
            float rotateSpeed = GameManager.GM.rotateSpeed;
            //if (Input.GetKeyDown(KeyCode.Mouse1))
            //{
            //    transform.SetParent(cursor.transform, true);
            //}
            //else if (Input.GetKeyUp(KeyCode.Mouse1))
            //{
            //    transform.SetParent(null, true);
            //}
            if (Input.GetMouseButton(1))
            {
                Vector3 newEulers = new Vector3(
                    MouseMovement.y * -1 * Time.deltaTime * 10 * rotateSpeed,
                    MouseMovement.x * Time.deltaTime * 10 * rotateSpeed,
                    0);
                cursor.transform.localEulerAngles += newEulers;

                cursor.BlockUpdate = true;
                transform.SetParent(cursor.transform, true);
            }
            else
            {
                cursor.BlockUpdate = false;
                transform.SetParent(null, true);
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
            Vector3 zoomDir = Time.deltaTime * transform.forward * zoomIncrement * (distFromCursor / 10);

            if (Input.mouseScrollDelta.y > 0) transform.position += zoomDir;
            else if (Input.mouseScrollDelta.y < 0) transform.position -= zoomDir;
        }
    }
    public void LockUnlock(int TranslateToLock)
    {
        switch (TranslateToLock)
        {
            case 0: rotLocked = !rotLocked; break;
            case 1: panLocked = !panLocked; break;
            case 2: zoomLocked = !zoomLocked; break;
        }

    }
}