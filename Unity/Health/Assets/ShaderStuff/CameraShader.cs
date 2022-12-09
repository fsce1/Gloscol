using System.IO;
using UnityEngine;
using UnityEditor;
using System.Collections.Generic;
using System.Linq;
[ExecuteInEditMode]
public class CameraShader : MonoBehaviour
{
    //public float[] intensity;
    //public Material[] mats;
    
    void Awake()
    {
        //mat = new Material(Shader.Find("Hidden/BWTest"));
    }
    public List<Material> effectMaterials = new List<Material>();
    void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        if (effectMaterials.Count > 1)
        {
            List<RenderTexture> renderTextures = new List<RenderTexture>();

            for (int i = 0; i < effectMaterials.Count; i++)
            {
                //Create blank RenTex
                RenderTexture tempDest = RenderTexture.GetTemporary(source.width, source.height);
                tempDest = source;
                //If this is the first material, start from the source texture
                if (i == 0)
                {
                    Graphics.Blit(source, tempDest, effectMaterials[i]);
                }

                //If this is the last material, send the resulting texture to destination
                else if (i == effectMaterials.Count - 1)
                {
                    Graphics.Blit(tempDest, destination, effectMaterials[i]);
                }

                //If this is inbetween, pass between temp textures
                else
                {
                    Graphics.Blit(tempDest, tempDest, effectMaterials[i]);
                }
            }

            //for (int i = 0; i < renderTextures.Count; i++)
            //{
            //    RenderTexture.ReleaseTemporary(renderTextures[i]);
            //}

        }

        else if (effectMaterials.Count == 1)
        {
            Graphics.Blit(source, destination, effectMaterials[0]);
        }

        else
        {
            Graphics.Blit(source, destination);
        }
    }

    //RenderTexture rt = src;
    //int i = 0;
    //foreach (Material m in mats) 
    //{
    //    m.mainTexture = rt;
    //    m.SetFloat("_Blend", intensity[i]);
    //    i++;
    //    Graphics.Blit(rt, rt, m);
    //}
    //Graphics.Blit(rt,dest);
    //mat.SetFloat("_bwBlend", intensity);
    //Graphics.Blit(src, dest, mat);
}
