// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33035,y:32787,varname:node_3138,prsc:2|emission-9985-OUT;n:type:ShaderForge.SFN_Tangent,id:3952,x:31883,y:32709,varname:node_3952,prsc:2;n:type:ShaderForge.SFN_Bitangent,id:7614,x:32020,y:32709,varname:node_7614,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:73,x:32154,y:32709,prsc:2,pt:False;n:type:ShaderForge.SFN_Code,id:467,x:31886,y:32925,varname:node_467,prsc:2,code:ZgBsAG8AYQB0ADMAIABuAEQAaQByAFQAUwAgAD0AIABVAG4AcABhAGMAawBOAG8AcgBtAGEAbAAoAHQAZQB4ADIARAAoAG4AbwByAG0AYQBsAG0AYQBwACwAdQB2ACkAKQA7AAoAZgBsAG8AYQB0ADMAeAAzACAAVABCAE4AIAA9ACAAZgBsAG8AYQB0ADMAeAAzACgAdABEAGkAcgAsACAAbgBEAGkAcgAsACAAbgBEAGkAcgApADsACgBmAGwAbwBhAHQAMwAgAG4ARABpAHIAVwBTACAAPQAgAG4AbwByAG0AYQBsAGkAegBlACgAbQB1AGwAKABUAEIATgAsACAAbgBEAGkAcgBUAFMAKQApADsACgByAGUAdAB1AHIAbgAgAG4ARABpAHIAVwBTADsA,output:2,fname:TBNTransform,width:666,height:287,input:2,input:2,input:2,input:12,input:1,input_1_label:tDir,input_2_label:bDir,input_3_label:nDir,input_4_label:normalmap,input_5_label:uv|A-3952-OUT,B-7614-OUT,C-73-OUT,D-4381-TEX,E-6750-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6750,x:31511,y:33111,varname:node_6750,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2dAsset,id:4381,x:31552,y:32864,ptovrint:False,ptlb:normalmap,ptin:_normalmap,varname:node_4381,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:3,isnm:True;n:type:ShaderForge.SFN_LightVector,id:8094,x:32517,y:32750,varname:node_8094,prsc:2;n:type:ShaderForge.SFN_Dot,id:885,x:32664,y:32945,varname:node_885,prsc:2,dt:0|A-8094-OUT,B-467-OUT;n:type:ShaderForge.SFN_Vector1,id:7640,x:32664,y:33161,varname:node_7640,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:9985,x:32808,y:32980,varname:node_9985,prsc:2|A-885-OUT,B-7640-OUT;proporder:4381;pass:END;sub:END;*/

Shader "AP01/L08/L08_NormalMap_SF" {
    Properties {
        _normalmap ("normalmap", 2D) = "bump" {}
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
            float3 TBNTransform( float3 tDir , float3 bDir , float3 nDir , sampler2D normalmap , float2 uv ){
            float3 nDirTS = UnpackNormal(tex2D(normalmap,uv));
            float3x3 TBN = float3x3(tDir, nDir, nDir);
            float3 nDirWS = normalize(mul(TBN, nDirTS));
            return nDirWS;
            }
            
            uniform sampler2D _normalmap; uniform float4 _normalmap_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
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
                float node_9985 = max(dot(lightDirection,TBNTransform( i.tangentDir , i.bitangentDir , i.normalDir , _normalmap , i.uv0 )),0.0);
                float3 emissive = float3(node_9985,node_9985,node_9985);
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
            float3 TBNTransform( float3 tDir , float3 bDir , float3 nDir , sampler2D normalmap , float2 uv ){
            float3 nDirTS = UnpackNormal(tex2D(normalmap,uv));
            float3x3 TBN = float3x3(tDir, nDir, nDir);
            float3 nDirWS = normalize(mul(TBN, nDirTS));
            return nDirWS;
            }
            
            uniform sampler2D _normalmap; uniform float4 _normalmap_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
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
