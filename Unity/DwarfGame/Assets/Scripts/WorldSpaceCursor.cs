using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WorldSpaceCursor : MonoBehaviour
{
    public bool BlockUpdate;
    private MeshRenderer mesh;
    public void Start()
    {
        mesh = GetComponent<MeshRenderer>();
    }
    public void Update()
    {
        if (BlockUpdate) return;

        Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit;
        Vector3 CursorTargetPos = new Vector3(0, 0);

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

        if (GameManager.GM.CursorSmoothing) transform.position += CursorTargetPos * Time.deltaTime * GameManager.GM.CursorSmoothingAmount;
        else transform.position += CursorTargetPos;
    }
}
