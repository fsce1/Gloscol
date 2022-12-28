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
    //public Vector3 targetPos(Pawn p)
    //{
    //    Vector3 targetPos = p.cursorPos;
    //    return targetPos;
    //}
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
        //ghostCollider = GetComponentInChildren<Collider>();

    }


    public void UpdateMove(Vector3 targetPos)
    {
        //if (isHighlighted) return;
        //ghost.transform.position = cursorPos;
        //ghost.enabled = true;
        //cursor.mesh.enabled = true;


        //
        //SAMPLE AN ANIMATION CURVE?
        //
        this.transform.position += (targetPos - transform.position) * Time.deltaTime;
    }


    Vector3 targetPos;

    public Collider ghostCollider;
    void Update()
    {

        Vector3 meshPos = new Vector3(mesh.transform.position.x, mesh.transform.position.y, mesh.transform.position.z);
        //Vector3 targetPos = saveData.targetPos(this);

        //if (Input.GetMouseButtonDown(0))
        //{
        //}

        if (GameManager.GM.moveOnGrid)
        {
            cursorPos = new Vector3(
                Mathf.RoundToInt(cursor.transform.position.x)-0.5f,
                Mathf.RoundToInt(cursor.transform.position.y) + 1,
                Mathf.RoundToInt(cursor.transform.position.z) - 0.5f
                );
        }
        else cursorPos = new Vector3(cursor.transform.position.x, cursor.transform.position.y + 1, cursor.transform.position.z);



        //else
        //{
        //    cursor.mesh.enabled = true;
        //    ghost.enabled = false;
        //    ghost.transform.position = targetPos;
        //}
        if (isDragging)
        {
            ghost.enabled = true;


            if (!isHighlighted)
            {
                ghost.transform.position = cursorPos;
            }

            if (Input.GetMouseButtonUp(0))
            {
                isDragging = false;

                targetPos = cursorPos;
                isMovingToTarget = true;
                ghost.transform.position = targetPos;
                ghostCollider.enabled = true;
            }
        }
        else if (isHighlighted)
        {
            //
            //
            //  PAUSE GAME IF HIGHLIGHTED
            //
            //

            ghost.transform.position = meshPos;
            ghost.enabled = true;

            if (Input.GetMouseButtonDown(0))
            {
                //isHighlighted = false;
                isDragging = true;
            }
        }
        else
        {
            ghost.enabled = false;
            ghost.transform.position = targetPos;
        }
        //else
        //{
        //    ghost.enabled = true;
        //    ghost.transform.position = targetPos;
        //    cursor.mesh.enabled = true;
        //}
        UpdateMove(targetPos);

        //if (Input.GetMouseButtonUp(0))
        //{
        //    isDragging = false;
        //    saveData.hasTarget = true;
        //    targetPos = cursorPos;
        //}

        if (transform.position != targetPos)
        {
            ghost.transform.SetParent(null);
        }
        else ghost.transform.SetParent(this.transform);
    }

    void OnTriggerEnter(Collider other)
    {
        switch (other.gameObject.tag)
        {
            case "Ghost":
                StartCoroutine(FixupPos(targetPos));
                //targetPos = transform.position;
                ghostCollider.enabled = false;
                ghost.enabled = false;
                break;
            case "Cursor":
                if (!isMovingToTarget) isHighlighted = true;
                else isHighlighted = false;
                //if (Input.GetMouseButtonDown(0))
                //{
                //    isDragging = true;
                //}
                break;
        }

    }
    public bool isMovingToTarget = false; //just an indicator, not able to be set
    public IEnumerator FixupPos(Vector3 v3)
    {
        int rotTime = 0;
        while (rotTime <= 10)
        {
            transform.position -= (transform.position - v3) / 10;
            //Debug.Log("Fixing up Pos " + rotTime.ToString());

            yield return new WaitForSeconds(0.1f);
            rotTime += 1;
        }
        ghost.enabled = false;
        transform.position = targetPos;
        targetPos = transform.position;
        isMovingToTarget = false;
    }
    void OnTriggerExit(Collider other)
    {
        switch (other.tag)
        {
            case "Cursor":
                isHighlighted = false;
                //if (Input.GetMouseButtonDown(0))
                //{
                //    isDragging = true;
                //}
                break;
        }

    }

}
