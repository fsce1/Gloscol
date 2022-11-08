using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class ObstacleController : MonoBehaviour
{
    private GameManager GM;
    void Start()
    {
        GM = FindObjectOfType<GameManager>();
        GM.curObstacles++;
        Transform player = GameObject.Find("Player").transform;
        float force = 250f;
        Vector3 direction = (player.position - transform.position).normalized;
        GetComponent<Rigidbody2D>().AddForce(direction * force, ForceMode2D.Force);
    }
    void OnCollisionEnter2D(Collision2D col)
    {
        if (col.gameObject.name.Equals("Player"))
        {
            SceneManager.LoadScene(SceneManager.GetActiveScene().name);
        }
        else
        {
            Destroy(this.gameObject);
            GM.curObstacles--;
        }
    }
}
