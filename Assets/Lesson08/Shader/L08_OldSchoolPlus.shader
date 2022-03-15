Shader "AP01/L08/L08_OldSchoolPlus"
{
    Properties
    {
        _BaseColor("环境光", Color) = (1.0, 1.0, 1.0, 1.0)
        _LightColor("光颜色", Color) = (1.0, 1.0, 1.0, 1.0)
        _SpecularPow("specularpow", Range(1, 92)) = 32 
        _Occulusion ("AO图", 2d) = "white" {}
        _EnvUpColor("朝上环境色", Color) = (1.0, 1.0, 1.0, 1.0)
        _EnvSideColor("两侧环境色", Color) = (0.4, 0.4, 0.4, 1.0)
        _EnvDownColor("朝下环境色", Color) = (0.0, 0.0, 0.0, 0.0)
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            // make fog work
            #pragma multi_compile_fog

            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            uniform sampler2D _Occulusion;
            uniform float4 _BaseColor;
            uniform float4 _LightColor;
            uniform float  _SpecularPow;
            uniform float4 _EnvUpColor;
            uniform float4 _EnvSideColor;
            uniform float4 _EnvDownColor;

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 uv0 : TEXCOORD0;
            };

            struct v2f
            {
                float4 posCS : SV_POSITION;
                float3 posWS : TEXCOORD0;
                float3 NDirWS : TEXCOORD1;
                float2 uv : TEXCOORD2;
                LIGHTING_COORDS(3, 4)
            };



            v2f vert (appdata v)
            {
                v2f o;
                o.posCS = UnityObjectToClipPos(v.vertex);
                o.posWS = UnityObjectToWorldDir(v.vertex);
                o.NDirWS = mul(v.normal, unity_WorldToObject);
                o.uv = v.uv0;
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                
                // lambert
                float3 LDirWS = normalize(_WorldSpaceLightPos0.xyz);
                float3 NDirWS = i.NDirWS;
                float ndotl = dot(NDirWS, LDirWS);
                float lambert = max(0, ndotl);
                float3 diffuseCol = lambert * _BaseColor;

                // spcular 

                float3 rLDirWS = normalize(reflect(-1 * LDirWS, NDirWS));
                float3 vDir = normalize((_WorldSpaceCameraPos - i.posWS));
                float rdotv = dot(rLDirWS, vDir);
                float phong = pow(max(0, rdotv), _SpecularPow);
                float3 result1 = (phong + diffuseCol) * _LightColor;

                float shadow = LIGHT_ATTENUATION(i);
                result1 *= shadow;

                // sample the texture
                float upMask = max(0, i.NDirWS.g);
                float downMask  = max(0, i.NDirWS.g * (-1));
                float sideMask = 1 - upMask - downMask;

                float3 envCol = upMask * _EnvUpColor + downMask * _EnvDownColor + sideMask * _EnvSideColor;
                float occulision = tex2D(_Occulusion, i.uv);

                float3 envLighting = envCol * occulision;

                float3 finalRGB = envLighting + result1;

                return float4(finalRGB, 1.0);
            }
            ENDCG
        }
    }
}
