using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class GameManager : MonoBehaviour
{
    public int StageNumber = 1;
    private int StageNumberStored = 1;
    public int curObstacles;
    public float timerLength = 10;
    float timerLengthStored = 10;
    public GameObject Obstacle;

    void Start()
    {
        timerLengthStored = timerLength;
        StageNumberStored = StageNumber;
    }

    void Update()
    {
        while(timerLength > 0)
        {
            if (curObstacles < 1)
            {
                while (StageNumber > 0)
                {
                    //Instantiate(Obstacle, new Vector3(Random.Range(0, ), Random.Range(0, Screen.height), 0), Quaternion.identity);
                    float spawnY = Random.Range
                         (Camera.main.ScreenToWorldPoint(new Vector2(0, 0)).y, Camera.main.ScreenToWorldPoint(new Vector2(0, Screen.height)).y);
                    float spawnX = Random.Range
                        (Camera.main.ScreenToWorldPoint(new Vector2(0, 0)).x, Camera.main.ScreenToWorldPoint(new Vector2(Screen.width, 0)).x);
                    Instantiate(Obstacle, new Vector3(spawnX, spawnY, 0), Quaternion.identity);
                    StageNumber--;
                }
            }
            //spawn code
            timerLength *= Time.deltaTime*100;
        }
        //timerLength = timerLengthStored;
        StageNumber = StageNumberStored + 1;
    }
}
