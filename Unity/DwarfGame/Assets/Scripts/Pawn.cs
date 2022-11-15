using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

//[JsonObject(MemberSerialization.OptIn)]

[Serializable]
public class PawnSaveData
{
    public string firstName = "Jeremy";
    public string lastName = "Hunt";
    public bool hasTarget = false;
    public Vector3 targetPos(Pawn p)
    {
        Vector3 targetPos = p.cursorPos;
        return targetPos;
    }
}

public class Pawn : MonoBehaviour
{
    //[JsonProperty]
    public WorldSpaceCursor cursor;
    public PawnSaveData saveData;
    MeshRenderer mesh;
    public MeshRenderer ghost;
    public bool isHighlighted = false;
    public bool isDragging = false;
    public Vector3 cursorPos;
    private Rigidbody rb;

    void Start()
    {
        mesh = GetComponentInChildren<MeshRenderer>();
        rb = GetComponent<Rigidbody>();
    }

    void Update()
    {
        if (Input.GetMouseButtonUp(0)) isDragging = false; saveData.hasTarget = true;
        Vector3 meshPos = new Vector3(mesh.transform.position.x, mesh.transform.position.y, mesh.transform.position.z);
        cursorPos = new Vector3(cursor.transform.position.x, cursor.transform.position.y + 1, cursor.transform.position.z);
        Vector3 targetPos = saveData.targetPos(this);
        //turn into switch
        if (saveData.hasTarget)
        {
            ghost.transform.position = cursorPos;
            ghost.enabled = true;
            cursor.mesh.enabled = true;
            rb.AddForce(targetPos - transform.position);
        }
        else if(transform.position == targetPos)
        {
            saveData.hasTarget = false;
        }
        else if (isHighlighted)
        {
            ghost.transform.position = meshPos;
            ghost.enabled = true;
            cursor.mesh.enabled = false;
        }
        else if (isDragging)
        {
            ghost.transform.position = cursorPos;
            ghost.enabled = true;
            cursor.mesh.enabled = false;
        }
        else
        {
            ghost.enabled = false;
            ghost.transform.position = meshPos;
            cursor.mesh.enabled = true;
        }


    }


}
