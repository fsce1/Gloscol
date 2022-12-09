Shader "Custom/Saturate" {
    Properties{
        _MainTex("Base (RGB)", 2D) = "white" {}
        _Blend("blend", Range(0, 1)) = 0
    }
        SubShader{
            Pass {
                CGPROGRAM
                #pragma vertex vert_img
                #pragma fragment frag
                #include "UnityCG.cginc"
                uniform sampler2D _MainTex;
                uniform float _Blend;
                float4 frag(v2f_img i) : COLOR {
                    float4 c = tex2D(_MainTex, i.uv);

                    //float lum = c.r / .3 + c.g / .59 + c.b / .11;
                    float3 sat = float3(c.x * 2, c.y * 2, c.z * 2);

                    float4 result = c;
                    result.rgb = lerp(c.rgb, sat, _Blend);
                    return result;
                }
                ENDCG
            }
        }
}