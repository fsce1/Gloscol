using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Scanline : MonoBehaviour
{


    public Vector2 bounds;

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (transform.localPosition.y == bounds.x)
        {
            transform.localPosition = new Vector3(0, bounds.y, 5);
        }
        else transform.localPosition = new Vector3(0, bounds.x, 5);
    }
}
