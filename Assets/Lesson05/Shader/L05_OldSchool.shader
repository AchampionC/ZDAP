// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:32719,y:32712,varname:node_3138,prsc:2|emission-7241-RGB;n:type:ShaderForge.SFN_Color,id:7241,x:32471,y:32812,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_7241,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.07843138,c2:0.3921569,c3:0.7843137,c4:1;proporder:7241;pass:END;sub:END;*/

Shader "AP01/L05/L05_OldSchool" {
    Properties {
        _MainColor("颜色", color) = (1.0, 1.0, 1.0, 1.0)
        _SpecularPow("幂次", float) = 32
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0

            uniform float3 _MainColor;
            uniform float _SpecularPow;

            struct VertexInput {
                float4 vertex : POSITION; // 将模型顶点信息输入进来
                float3 normal : NORMAL;  // 将模型法线信息输入进来
            };

            struct VertexOutput {
                float4 posCS : SV_POSITION; // 由模型顶点信息换算而来的顶点屏幕位置
                float4 posWS : TEXCOORD0;
                float3 nDirWS : TEXCOORD1;  // 由模型发信息信息换算出来世界空间法线信息
            };

            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.posCS = UnityObjectToClipPos(v.vertex);
                o.posWS = mul(unity_ObjectToWorld, v.vertex);
                o.nDirWS = UnityObjectToWorldNormal(v.normal);
                return o;
            }

            float4 frag(VertexOutput i) : COLOR {
                float3 nDir = i.nDirWS;
                float3 lDir = normalize(_WorldSpaceLightPos0.xyz);
                float3 vDir = normalize(_WorldSpaceCameraPos.xyz - i.posWS);
                float3 h = normalize(lDir + vDir);
                // 准备中间结果
                float ndoth  = dot(nDir, h);
                float ndotl = dot(nDir, lDir);
                // 计算过程
                float lambert = max(0, ndotl);
                float bllinPhong = pow(max(0, ndoth), _SpecularPow);
                float3 finalRGB = _MainColor * lambert + bllinPhong;
                return float4(finalRGB,1.0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
