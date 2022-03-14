// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34916,y:32689,varname:node_3138,prsc:2|emission-1753-OUT;n:type:ShaderForge.SFN_NormalVector,id:2577,x:33109,y:32775,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:9199,x:33273,y:32775,varname:node_9199,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-2577-OUT;n:type:ShaderForge.SFN_Vector1,id:509,x:33160,y:33000,varname:node_509,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:5798,x:33448,y:32775,cmnt:向上部分Mask,varname:node_5798,prsc:2|A-9199-OUT,B-509-OUT;n:type:ShaderForge.SFN_Vector1,id:6416,x:33209,y:33078,varname:node_6416,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:5160,x:33430,y:33024,varname:node_5160,prsc:2|A-9199-OUT,B-6416-OUT;n:type:ShaderForge.SFN_Max,id:7883,x:33628,y:33024,cmnt:向下部分Mask,varname:node_7883,prsc:2|A-5160-OUT,B-509-OUT;n:type:ShaderForge.SFN_Color,id:4710,x:33621,y:32356,ptovrint:False,ptlb:EnvUpCol,ptin:_EnvUpCol,varname:node_4710,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:5428,x:33878,y:32422,varname:node_5428,prsc:2|A-4710-RGB,B-5798-OUT;n:type:ShaderForge.SFN_Vector1,id:9554,x:33506,y:32952,varname:node_9554,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:9424,x:33705,y:32822,varname:node_9424,prsc:2|A-9554-OUT,B-5798-OUT;n:type:ShaderForge.SFN_Subtract,id:4790,x:33889,y:32867,varname:node_4790,prsc:2|A-9424-OUT,B-7883-OUT;n:type:ShaderForge.SFN_Color,id:6243,x:33621,y:32509,ptovrint:False,ptlb:EnvDownCol,ptin:_EnvDownCol,varname:_EnvUpCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:22,x:33878,y:32558,varname:node_22,prsc:2|A-6243-RGB,B-7883-OUT;n:type:ShaderForge.SFN_Add,id:4371,x:34120,y:32747,varname:node_4371,prsc:2|A-5428-OUT,B-22-OUT;n:type:ShaderForge.SFN_Add,id:1781,x:34172,y:32927,varname:node_1781,prsc:2|A-4371-OUT,B-2088-OUT;n:type:ShaderForge.SFN_Tex2d,id:3556,x:34340,y:32730,ptovrint:False,ptlb:Occulsion,ptin:_Occulsion,varname:node_3556,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:eabfa8d88fe328f4b952fb81f530c4a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:1753,x:34567,y:32977,varname:node_1753,prsc:2|A-3556-RGB,B-1781-OUT;n:type:ShaderForge.SFN_Color,id:5938,x:33621,y:32665,ptovrint:False,ptlb:EnvSideCol,ptin:_EnvSideCol,varname:_EnvDownCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4,c2:0.4,c3:0.4,c4:1;n:type:ShaderForge.SFN_Multiply,id:2088,x:33889,y:32702,varname:node_2088,prsc:2|A-5938-RGB,B-4790-OUT;proporder:4710-6243-3556-5938;pass:END;sub:END;*/

Shader "AP01/L07/3ColAmbient_SF" {
    Properties {
        _EnvUpCol ("EnvUpCol", Color) = (1,1,1,1)
        _EnvDownCol ("EnvDownCol", Color) = (0,0,0,1)
        _Occulsion ("Occulsion", 2D) = "white" {}
        _EnvSideCol ("EnvSideCol", Color) = (0.4,0.4,0.4,1)
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
            uniform sampler2D _Occulsion; uniform float4 _Occulsion_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float3 normalDir : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.pos = UnityObjectToClipPos( v.vertex );
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 normalDirection = i.normalDir;
////// Lighting:
////// Emissive:
                float4 _Occulsion_var = tex2D(_Occulsion,TRANSFORM_TEX(i.uv0, _Occulsion));
                float4 _EnvUpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvUpCol );
                float node_9199 = i.normalDir.g;
                float node_509 = 0.0;
                float node_5798 = max(node_9199,node_509); // 向上部分Mask
                float4 _EnvDownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDownCol );
                float node_7883 = max((node_9199*(-1.0)),node_509); // 向下部分Mask
                float4 _EnvSideCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSideCol );
                float3 emissive = (_Occulsion_var.rgb*(((_EnvUpCol_var.rgb*node_5798)+(_EnvDownCol_var.rgb*node_7883))+(_EnvSideCol_var.rgb*((1.0-node_5798)-node_7883))));
                float3 finalColor = emissive;
                return fixed4(finalColor,1);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
