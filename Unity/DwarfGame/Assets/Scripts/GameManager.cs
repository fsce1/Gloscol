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

    [Header("Settings")]

    [Header("Cursor")]
    public bool CursorSmoothing;
    [Tooltip("Smaller Number = Greater Smoothing!")]
    public float CursorSmoothingAmount;
    [Header("Builder Camera Speed")]
    public float rotateSpeed = 100;
    public float panSpeed = 10;
    public float zoomIncrement = 0.1f;

    void Start()
    {
        Cursor.lockState = CursorLockMode.None;
    }
    public void InvertBool(bool b)
    {
        b = !b;
    }
}
