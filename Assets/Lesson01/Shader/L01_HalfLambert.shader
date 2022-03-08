// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33025,y:32713,varname:node_3138,prsc:2|emission-1595-RGB;n:type:ShaderForge.SFN_NormalVector,id:2515,x:31931,y:32719,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:3100,x:31931,y:32921,varname:node_3100,prsc:2;n:type:ShaderForge.SFN_Dot,id:8824,x:32112,y:32778,varname:node_8824,prsc:2,dt:0|A-2515-OUT,B-3100-OUT;n:type:ShaderForge.SFN_Multiply,id:1527,x:32284,y:32929,varname:node_1527,prsc:2|A-8824-OUT,B-7414-OUT;n:type:ShaderForge.SFN_Vector1,id:7414,x:32099,y:33053,varname:node_7414,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Add,id:3981,x:32464,y:32929,varname:node_3981,prsc:2|A-1527-OUT,B-7151-OUT;n:type:ShaderForge.SFN_Vector1,id:7151,x:32209,y:33097,varname:node_7151,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Vector1,id:9898,x:32411,y:33125,varname:node_9898,prsc:2,v1:0.2;n:type:ShaderForge.SFN_Append,id:7926,x:32609,y:33004,varname:node_7926,prsc:2|A-3981-OUT,B-9898-OUT;n:type:ShaderForge.SFN_Tex2d,id:1595,x:32789,y:32987,ptovrint:False,ptlb:RampTeture,ptin:_RampTeture,varname:node_1595,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7ee45e7dc259cab4dad524b090c0fec6,ntxv:0,isnm:False|UVIN-7926-OUT;proporder:1595;pass:END;sub:END;*/

Shader "AP01/L01/HalfLambert" {
    Properties {
        _RampTeture ("RampTeture", 2D) = "white" {}
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
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _RampTeture; uniform float4 _RampTeture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float2 node_7926 = float2(((dot(i.normalDir,lightDirection)*0.5)+0.5),0.2);
                float4 _RampTeture_var = tex2D(_RampTeture,TRANSFORM_TEX(node_7926, _RampTeture));
                float3 emissive = _RampTeture_var.rgb;
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _RampTeture; uniform float4 _RampTeture_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float4 posWorld : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
