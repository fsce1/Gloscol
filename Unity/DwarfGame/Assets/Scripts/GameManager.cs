using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using Newtonsoft.Json;


public class GameManager : MonoBehaviour
{
    public static GameManager GM;
    private void Awake()
    {
        if (GM != null && GM != this) Destroy(this);
        else GM = this;
    }
    #region VARS
    [Header("Settings")]
    [Header("Cursor")]
    public bool CursorSmoothing;
    [Tooltip("Smaller Number = Greater Smoothing!")]
    public float CursorSmoothingAmount;
    [Header("Camera Speeds")]
    public float rotateSpeed = 100;
    public float panSpeed = 10;
    public float zoomIncrement = 0.1f;
    #endregion
    void Start()
    {
        Cursor.lockState = CursorLockMode.None;
        PawnsInScene = GameObject.FindObjectsOfType<Pawn>();
    }
    #region SERIALIZATION

    public Pawn[] PawnsInScene;

    public void SerializeAllPawns()
    {
        foreach (Pawn pawn in PawnsInScene)
        {
            SerializeThisPawn(pawn);
        }
    }
    public void SerializeThisPawn(Pawn p)
    {
        string output = JsonConvert.SerializeObject(p,
                new JsonSerializerSettings()
                { ReferenceLoopHandling = ReferenceLoopHandling.Ignore });
        //JSONConvert really wants to serialize the entire object(including the MonoBehaviour) so it throws a rigidbody error
        //This is why i have used the [JsonProperty] tags
        WriteToFile(output, p);
        Debug.Log(output);
    }
    public void WriteToFile(string data, Pawn p)
    {
        string dir = Path.Combine(Application.persistentDataPath + "/Pawns/");

        if (!Directory.Exists(dir)) Directory.CreateDirectory(dir);

        using (StreamWriter sw = new StreamWriter(dir + p.firstName + p.lastName + ".txt"))
        {
            Debug.Log("Writing!");
            sw.WriteLine(data);
        }
    }

    #endregion
}
