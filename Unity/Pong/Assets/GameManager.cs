using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{

    public enum Side { Left, Right }
    [SerializeField]
    GameObject[] gameAssets;
    void Start()
    {
        StartGame();
    }
    private void StartGame()
    {
        GameObject.FindWithTag("Ball").GetComponent<Ball>().FireBall();
    }
    public void ResetGame()
    {
        foreach (GameObject gobj in gameAssets)
        {
            if (gobj.CompareTag("Ball"))
            {
                gobj.GetComponent<Ball>().ResetPosition();
            }
            else if (gobj.CompareTag("Player"))
            {
                gobj.GetComponent<Player>().ResetPosition();
            }
        }
        StartGame();
    }
}
