using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class WorldSpaceCursor : MonoBehaviour
{
    public static WorldSpaceCursor C;
    private void Awake()
    {
        if (C != null && C != this) Destroy(this);
        else C = this;
    }
    public bool BlockUpdate;
    public MeshRenderer mesh;
    public Pawn lastPawn;
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
            if (hit.collider.CompareTag("Pawn"))
            {
                lastPawn = hit.transform.gameObject.GetComponent<Pawn>();

                lastPawn.isHighlighted = true;
                if (Input.GetMouseButtonDown(0)) lastPawn.isDragging = true;
            }
            else if (lastPawn != null)
            {
                lastPawn.isHighlighted = false;
            }
            CursorTargetPos = hit.point - transform.position;
        }

        if (GameManager.GM.CursorSmoothing) transform.position += CursorTargetPos * Time.deltaTime * GameManager.GM.CursorSmoothingAmount;
        else transform.position += CursorTargetPos;
    }
}
