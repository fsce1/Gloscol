using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class Score : MonoBehaviour
{

    TMP_Text text;
    int leftScore = 0;
    int rightScore = 0;

    private void Start()
    {
        text = GetComponent<TMP_Text>();
        text.text = "Player I: " + leftScore + "| Player II: " + rightScore;
    }
    public void PlayerScored(GameManager.Side side)
    {
        if (side == GameManager.Side.Left) leftScore++;
        else if (side == GameManager.Side.Right) rightScore++;
        text.text = "Player I: " + leftScore + "| Player II: " + rightScore;
        GameObject.FindWithTag("GameManager").GetComponent<GameManager>().ResetGame();
    }
}
