using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using UnityEngine.Tilemaps;
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
        AddLowCover();
    }
    #region SERIALIZATION
    public Pawn[] PawnsInScene()
    {
        return GameObject.FindObjectsOfType<Pawn>();
    }
    //JsonSerializerSettings settings = new JsonSerializerSettings() { ReferenceLoopHandling = ReferenceLoopHandling.Ignore };
    string pawnSaveLocation;
    public Pawn pawnPrefab;
    public void SerializeAllPawns()
    {
        //PawnsInScene = GameObject.FindObjectsOfType<Pawn>();
        foreach (Pawn pawn in PawnsInScene())
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



    #region GRIDSYSTEM
    public Tilemap tilemap;
    public GameObject lowCoverPrefab;
    public Vector2Int bounds;
    public enum types
    {
        Floor,
        Low,
        High
    }
public enum mats
{
        Bricks01,
        Concrete01,
        Dirt01
}









    public void AddLowCover()
    {

        //for (int x = lowCoverTilemap.cellBounds.min.x; x < lowCoverTilemap.cellBounds.max.x; x++)
        //{
        //    for (int y = lowCoverTilemap.cellBounds.min.y; y < lowCoverTilemap.cellBounds.max.y; y++)
        //    {
        //        for (int z = lowCoverTilemap.cellBounds.min.z; z < lowCoverTilemap.cellBounds.max.z; z++)
        //        {


        for (int x = bounds.x; x < bounds.y; x++)
        {
            for (int y = bounds.x; y < bounds.y; y++)
            {
                for (int z = bounds.x; z < bounds.y; z++)
                {
                    Vector3Int v3 = new Vector3Int(x, y, z);
                    Vector3Int v3worldspace = new Vector3Int(x, z, y);

                    Tile t = (Tile)tilemap.GetTile(v3);
                    if (t != null)
                    {


                        types thisCoverType = types.Floor;


                        //mat.color = t.GetTileData(v3, tilemap, t);

                        switch (t.name)
                        {
                             case string a when a.StartsWith("l_"):
                                thisCoverType = types.Low;
                                break;
                            case string a when a.StartsWith("h_"):
                                thisCoverType = types.High;
                                break;
                        }


                        switch (t.name)
                        {
                            case "Floor":
                                break;
                            case "LowCover":
                                ////Debug.Log(t.name);

                                transform.position = v3worldspace;
                                GameObject gobj = Instantiate(lowCoverPrefab, this.transform);
                                gobj.transform.SetParent(null);

                                break;
                            case "HighCover":
                                ////Debug.Log(t.name);

                                transform.position = v3worldspace;
                                gobj = Instantiate(lowCoverPrefab, this.transform); gobj.transform.SetParent(null);
                                transform.position += new Vector3(0, 1, 0);
                                gobj = Instantiate(lowCoverPrefab, this.transform); gobj.transform.SetParent(null);

                                break;
                            case "Bricks":
                                Material mat = new Material(Shader.Find("Standard"));
                                transform.position = v3worldspace;
                                gobj = Instantiate(lowCoverPrefab, this.transform); gobj.transform.SetParent(null);
                                MeshRenderer mesh = gobj.GetComponentInChildren<MeshRenderer>();
                                mat.mainTexture = t.sprite.texture;
                                mesh.material = mat;
                                break;
                        }
                    }
                }
            }
        }
        transform.position = Vector3.zero;
        tilemap.gameObject.SetActive(false);
        //foreach (TileBase t in lowCoverTilemap.GetTilesBlock(new BoundsInt(new Vector3Int(0, 0, 0), bounds)))
        //{
        //    Debug.Log(t.ToString());
        //    Debug.Log(t.name);
        //    //if (t.color.grayscale > 0.5)
        //    //{
        //    //    GameObject gobj = Instantiate(lowCoverPrefab, null);
        //    //    gobj.transform.position = t.gameObject.transform.position;
        //    //}
        //}

        //for (int i = -10; i < 10; i++)
        //{
        //    AddLowCoverPer(new Vector3Int(i, 0, 0));
        //    AddLowCoverPer(new Vector3Int(0, i, 0));
        //}
    }
    //public void AddLowCoverPer(Vector3Int v3i)
    //{
    //    Color t = lowCoverTilemap.GetColor(v3i);
    //    Debug.Log(t.ToString());
    //    if (t.grayscale > 0.5)
    //    {
    //        GameObject gobj = Instantiate(lowCoverPrefab, null);
    //        gobj.transform.position = v3i;
    //    }
    //}
    #endregion

    #region GRIDSYSTEMMOVEMENT

    public bool moveOnGrid = true;



    #endregion
}


