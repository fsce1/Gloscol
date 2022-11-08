using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WorldSpaceCursor : MonoBehaviour
{
    public Vector3 CursorTargetPos;
    public Vector3 CursorPosSmoothed;
    public bool BlockUpdate;
    public Camera cam;
    private MeshRenderer mesh;
    public void Start()
    {
        mesh = GetComponent<MeshRenderer>();
    }
    public void Update()
    {
        if (BlockUpdate) return;

        Ray ray = cam.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;

        // Find the direction to move in
        if (Physics.Raycast(ray, out hit))
        {
            if (hit.collider.CompareTag("Interactable"))
            {
                this.mesh.enabled = false;
            }
            else this.mesh.enabled = true;

            CursorTargetPos = hit.point - transform.position;
        }
        else CursorTargetPos = new Vector3(0, 0);

        //CursorPosSmoothed = CursorPos * Time.deltaTime * GameManager.GM.CursorSmoothingAmount;

        if (GameManager.GM.CursorSmoothing) transform.position += CursorTargetPos * Time.deltaTime * GameManager.GM.CursorSmoothingAmount;
        else transform.position += CursorTargetPos;
    }
}
