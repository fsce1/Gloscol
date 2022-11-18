using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class InteractableController : MonoBehaviour
{


    public TextMeshProUGUI scoreText;
    public Scrollbar healthSlider;
    const int maxHealth = 100;
    int curHealth;
    int score = 0;


    // Start is called before the first frame update
    void Start()
    {
        curHealth = maxHealth;
        scoreText.text = "Score: " + score;
        healthSlider.size = curHealth / maxHealth;

    }

    // Update is called once per frame
    void Update()
    {
        scoreText.text = "Score: " + score;
        healthSlider.size = (float)curHealth / maxHealth;
    }

    private void OnTriggerEnter2D(Collider2D col)
    {
        if (col.CompareTag("GravTrigger")) return;
        Destroy(col.gameObject);
        switch (col.gameObject.tag)
        {
            case "Coin":
                score++;
                break;
            case "HealthPack":
                curHealth += 10;
                break;
            case "DamagePack":
                curHealth -= 10;
                break;
        }
    }
}
