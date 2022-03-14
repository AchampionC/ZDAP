// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:34304,y:33628,varname:node_3138,prsc:2|emission-1998-OUT;n:type:ShaderForge.SFN_NormalVector,id:7997,x:32368,y:32434,prsc:2,pt:False;n:type:ShaderForge.SFN_LightVector,id:7607,x:32368,y:32604,varname:node_7607,prsc:2;n:type:ShaderForge.SFN_Dot,id:9699,x:32552,y:32481,varname:node_9699,prsc:2,dt:0|A-7997-OUT,B-7607-OUT;n:type:ShaderForge.SFN_LightVector,id:4633,x:32039,y:32778,varname:node_4633,prsc:2;n:type:ShaderForge.SFN_Vector1,id:746,x:32050,y:32945,varname:node_746,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:6562,x:32211,y:32830,varname:node_6562,prsc:2|A-4633-OUT,B-746-OUT;n:type:ShaderForge.SFN_NormalVector,id:3283,x:32024,y:33037,prsc:2,pt:False;n:type:ShaderForge.SFN_Vector1,id:847,x:32556,y:32674,varname:node_847,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:5408,x:32727,y:32514,varname:node_5408,prsc:2|A-9699-OUT,B-847-OUT;n:type:ShaderForge.SFN_Reflect,id:5036,x:32371,y:32913,varname:node_5036,prsc:2|A-6562-OUT,B-3283-OUT;n:type:ShaderForge.SFN_ViewVector,id:7083,x:32358,y:33095,varname:node_7083,prsc:2;n:type:ShaderForge.SFN_Vector1,id:5285,x:32529,y:33129,varname:node_5285,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:5216,x:32701,y:32962,varname:node_5216,prsc:2|A-4460-OUT,B-5285-OUT;n:type:ShaderForge.SFN_Slider,id:4723,x:32731,y:33154,ptovrint:False,ptlb:specular_pow,ptin:_specular_pow,varname:node_4723,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:1,cur:33.94447,max:92;n:type:ShaderForge.SFN_Power,id:5115,x:32901,y:32914,cmnt:Phong,varname:node_5115,prsc:2|VAL-5216-OUT,EXP-4723-OUT;n:type:ShaderForge.SFN_Dot,id:4460,x:32539,y:32923,varname:node_4460,prsc:2,dt:0|A-5036-OUT,B-7083-OUT;n:type:ShaderForge.SFN_Add,id:2814,x:33152,y:32614,varname:node_2814,prsc:2|A-2165-OUT,B-5115-OUT;n:type:ShaderForge.SFN_Color,id:2434,x:33133,y:32417,ptovrint:False,ptlb:LightColor,ptin:_LightColor,varname:node_2434,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_LightAttenuation,id:4404,x:33470,y:32401,varname:node_4404,prsc:2;n:type:ShaderForge.SFN_Multiply,id:777,x:33325,y:32639,varname:node_777,prsc:2|A-2434-RGB,B-2814-OUT;n:type:ShaderForge.SFN_Multiply,id:7956,x:33585,y:32659,varname:node_7956,prsc:2|A-4404-OUT,B-777-OUT;n:type:ShaderForge.SFN_NormalVector,id:7767,x:31903,y:33563,prsc:2,pt:False;n:type:ShaderForge.SFN_ComponentMask,id:4687,x:32067,y:33563,varname:node_4687,prsc:2,cc1:1,cc2:-1,cc3:-1,cc4:-1|IN-7767-OUT;n:type:ShaderForge.SFN_Vector1,id:8173,x:31954,y:33788,varname:node_8173,prsc:2,v1:0;n:type:ShaderForge.SFN_Max,id:9174,x:32242,y:33563,cmnt:向上部分Mask,varname:node_9174,prsc:2|A-4687-OUT,B-8173-OUT;n:type:ShaderForge.SFN_Vector1,id:8660,x:32003,y:33866,varname:node_8660,prsc:2,v1:-1;n:type:ShaderForge.SFN_Multiply,id:5610,x:32224,y:33812,varname:node_5610,prsc:2|A-4687-OUT,B-8660-OUT;n:type:ShaderForge.SFN_Max,id:4314,x:32461,y:34010,cmnt:向下部分Mask,varname:node_4314,prsc:2|A-5610-OUT,B-8173-OUT;n:type:ShaderForge.SFN_Color,id:237,x:32454,y:33342,ptovrint:False,ptlb:EnvUpCol,ptin:_EnvUpCol,varname:node_4710,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Multiply,id:5317,x:32711,y:33408,varname:node_5317,prsc:2|A-237-RGB,B-9174-OUT;n:type:ShaderForge.SFN_Vector1,id:4401,x:32300,y:33740,varname:node_4401,prsc:2,v1:1;n:type:ShaderForge.SFN_Subtract,id:2211,x:32538,y:33808,varname:node_2211,prsc:2|A-4401-OUT,B-9174-OUT;n:type:ShaderForge.SFN_Subtract,id:4380,x:32722,y:33853,varname:node_4380,prsc:2|A-2211-OUT,B-4314-OUT;n:type:ShaderForge.SFN_Color,id:2768,x:32454,y:33495,ptovrint:False,ptlb:EnvDownCol,ptin:_EnvDownCol,varname:_EnvUpCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:3276,x:32711,y:33544,varname:node_3276,prsc:2|A-2768-RGB,B-4314-OUT;n:type:ShaderForge.SFN_Add,id:6024,x:32953,y:33733,varname:node_6024,prsc:2|A-5317-OUT,B-3276-OUT;n:type:ShaderForge.SFN_Add,id:1167,x:33005,y:33913,varname:node_1167,prsc:2|A-6024-OUT,B-8626-OUT;n:type:ShaderForge.SFN_Tex2d,id:2113,x:33459,y:33590,ptovrint:False,ptlb:Occulsion,ptin:_Occulsion,varname:node_3556,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:eabfa8d88fe328f4b952fb81f530c4a4,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:6262,x:33694,y:33867,varname:node_6262,prsc:2|A-2113-RGB,B-6464-OUT;n:type:ShaderForge.SFN_Color,id:163,x:32454,y:33651,ptovrint:False,ptlb:EnvSideCol,ptin:_EnvSideCol,varname:_EnvDownCol_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.4,c2:0.4,c3:0.4,c4:1;n:type:ShaderForge.SFN_Multiply,id:8626,x:32722,y:33688,varname:node_8626,prsc:2|A-163-RGB,B-4380-OUT;n:type:ShaderForge.SFN_Add,id:1998,x:33978,y:33389,varname:node_1998,prsc:2|A-7956-OUT,B-224-OUT;n:type:ShaderForge.SFN_Color,id:8881,x:32701,y:32749,ptovrint:False,ptlb:baseColor,ptin:_baseColor,varname:node_8881,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:2165,x:32901,y:32703,cmnt:lambert,varname:node_2165,prsc:2|A-8881-RGB,B-5408-OUT;n:type:ShaderForge.SFN_Slider,id:6717,x:32910,y:34225,ptovrint:False,ptlb:envint,ptin:_envint,varname:node_6717,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1,max:1;n:type:ShaderForge.SFN_Multiply,id:4528,x:33172,y:34068,varname:node_4528,prsc:2|A-1167-OUT,B-6717-OUT;n:type:ShaderForge.SFN_Multiply,id:6464,x:33463,y:33989,varname:node_6464,prsc:2|A-8881-RGB,B-4528-OUT;n:type:ShaderForge.SFN_Multiply,id:224,x:33877,y:33996,varname:node_224,prsc:2|A-6262-OUT,B-6464-OUT;proporder:4723-2434-237-2768-2113-163-8881-6717;pass:END;sub:END;*/

Shader "Shader Forge/L07_OldSchoolPlus" {
    Properties {
        _specular_pow ("specular_pow", Range(1, 92)) = 33.94447
        _LightColor ("LightColor", Color) = (1,1,1,1)
        _EnvUpCol ("EnvUpCol", Color) = (1,1,1,1)
        _EnvDownCol ("EnvDownCol", Color) = (0,0,0,1)
        _Occulsion ("Occulsion", 2D) = "white" {}
        _EnvSideCol ("EnvSideCol", Color) = (0.4,0.4,0.4,1)
        _baseColor ("baseColor", Color) = (0.5,0.5,0.5,1)
        _envint ("envint", Range(0, 1)) = 1
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
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _Occulsion; uniform float4 _Occulsion_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _specular_pow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _baseColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _envint)
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
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
////// Emissive:
                float4 _LightColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightColor );
                float4 _baseColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _baseColor );
                float _specular_pow_var = UNITY_ACCESS_INSTANCED_PROP( Props, _specular_pow );
                float4 _Occulsion_var = tex2D(_Occulsion,TRANSFORM_TEX(i.uv0, _Occulsion));
                float4 _EnvUpCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvUpCol );
                float node_4687 = i.normalDir.g;
                float node_8173 = 0.0;
                float node_9174 = max(node_4687,node_8173); // 向上部分Mask
                float4 _EnvDownCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvDownCol );
                float node_4314 = max((node_4687*(-1.0)),node_8173); // 向下部分Mask
                float4 _EnvSideCol_var = UNITY_ACCESS_INSTANCED_PROP( Props, _EnvSideCol );
                float _envint_var = UNITY_ACCESS_INSTANCED_PROP( Props, _envint );
                float3 node_6464 = (_baseColor_var.rgb*((((_EnvUpCol_var.rgb*node_9174)+(_EnvDownCol_var.rgb*node_4314))+(_EnvSideCol_var.rgb*((1.0-node_9174)-node_4314)))*_envint_var));
                float3 emissive = ((attenuation*(_LightColor_var.rgb*((_baseColor_var.rgb*max(dot(i.normalDir,lightDirection),0.0))+pow(max(dot(reflect((lightDirection*(-1.0)),i.normalDir),viewDirection),0.0),_specular_pow_var))))+((_Occulsion_var.rgb*node_6464)*node_6464));
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
            #pragma multi_compile_instancing
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #include "Lighting.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _Occulsion; uniform float4 _Occulsion_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float, _specular_pow)
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvUpCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvDownCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _EnvSideCol)
                UNITY_DEFINE_INSTANCED_PROP( float4, _baseColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _envint)
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
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                LIGHTING_COORDS(3,4)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
////// Lighting:
                float attenuation = LIGHT_ATTENUATION(i);
                float3 finalColor = 0;
                return fixed4(finalColor * 1,0);
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
