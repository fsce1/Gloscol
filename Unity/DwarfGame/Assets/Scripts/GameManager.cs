using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
//using Newtonsoft.Json;


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
        pawnSaveLocation = Path.Combine(Application.persistentDataPath + "/Pawns/");
    }
    #region SERIALIZATION
    public Pawn[] PawnsInScene;
    //JsonSerializerSettings settings = new JsonSerializerSettings() { ReferenceLoopHandling = ReferenceLoopHandling.Ignore };
    string pawnSaveLocation;
    public Pawn pawnPrefab;
    public void SerializeAllPawns()
    {
        PawnsInScene = GameObject.FindObjectsOfType<Pawn>();
        foreach (Pawn pawn in PawnsInScene)
        {
            SerializeThisPawn(pawn);
        }
    }
    public void SerializeThisPawn(Pawn p)
    {
        string output = JsonUtility.ToJson(p.saveData, true);
        //string output = JsonConvert.SerializeObject(p.saveData, settings);
        //JSONConvert really wants to serialize the entire object(including the MonoBehaviour) so it throws a rigidbody error
        //This is why i have used the [JsonProperty] tags
        WriteToFile(output, p.saveData.firstName + p.saveData.lastName);
        Debug.Log(output);
    }
    public void DeserializeAllPawns()
    {
        FileInfo[] fileInfo = new DirectoryInfo(pawnSaveLocation).GetFiles("*.json");
        foreach (FileInfo f in fileInfo)
        {
            string pawnData = File.ReadAllText(f.FullName);
            Debug.Log(pawnData);
            DeserializeThisPawn(pawnData);
        }
        PawnsInScene = GameObject.FindObjectsOfType<Pawn>();
    }
    public void DeserializeThisPawn(string pawnData)
    {
        Debug.Log(pawnData);
        PawnSaveData pawnSaveData = new PawnSaveData();
        pawnSaveData = JsonUtility.FromJson<PawnSaveData>(pawnData);
        //pawnSaveData = JsonConvert.DeserializeObject<PawnSaveData>(pawnData, settings);
        pawnPrefab.saveData = pawnSaveData;
        Instantiate(pawnPrefab, transform);
    }
    public void WriteToFile(string data, string name)
    {
        if (!Directory.Exists(pawnSaveLocation)) Directory.CreateDirectory(pawnSaveLocation);

        using (StreamWriter sw = new StreamWriter(pawnSaveLocation + name + ".json"))
        {
            Debug.Log("Writing!");
            sw.WriteLine(data);
        }
    }
    #endregion
}
