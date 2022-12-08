using System.Collections;
using System.Collections.Generic;
using UnityEngine;
[ExecuteInEditMode]
public class CameraShader : MonoBehaviour
{
    public float[] intensity;
    public Material[] mats;
    
    void Awake()
    {
        //mat = new Material(Shader.Find("Hidden/BWTest"));
    }

    void OnRenderImage(RenderTexture src, RenderTexture dest) // only applies last thing for some reason
    {
        int i = 0;
        foreach (Material m in mats) 
        {
            m.mainTexture = src;
            m.SetFloat("_Blend", intensity[i]);
            i++;
            Graphics.Blit(src, dest, m);
        }

        //mat.SetFloat("_bwBlend", intensity);
        //Graphics.Blit(src, dest, mat);
    }
}
