using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UIManager : MonoBehaviour
{
    public static UIManager UI;
    private void Awake()
    {
        if (UI != null && UI != this) Destroy(this);
        else UI = this;
    }

    void Start()
    {

    }
}

