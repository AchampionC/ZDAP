Shader "AP01/L07/L07_3ColAmbient"
{
    Properties
    {
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
            
            uniform sampler2D _Occulusion;
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
                float3 NDirWS : TEXCOORD0;
                float2 uv : TEXCOORD1;
            };

            sampler2D _MainTex;
            float4 _MainTex_ST;

            v2f vert (appdata v)
            {
                v2f o;
                o.posCS = UnityObjectToClipPos(v.vertex);
                o.NDirWS = mul(v.normal, unity_WorldToObject);
                o.uv = v.uv0;
                return o;
            }

            fixed4 frag (v2f i) : SV_Target
            {
                // sample the texture
                fixed4 col = tex2D(_MainTex, i.uv);
                float upMask = max(0, i.NDirWS.g);
                float downMask  = max(0, i.NDirWS.g * (-1));
                float sideMask = 1 - upMask - downMask;

                float3 envCol = upMask * _EnvUpColor + downMask * _EnvDownColor + sideMask * _EnvSideColor;
                float occulision = tex2D(_Occulusion, i.uv);

                float3 envLighting = envCol * occulision;

                return float4(envLighting, 1.0);
            }
            ENDCG
        }
    }
}
