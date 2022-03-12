// Shader created with Shader Forge v1.40 
// Shader Forge (c) Freya Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.40;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,cpap:True,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:False,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:3138,x:33290,y:32692,varname:node_3138,prsc:2|emission-6714-OUT;n:type:ShaderForge.SFN_Normalize,id:5136,x:32641,y:32458,varname:node_5136,prsc:2|IN-2933-XYZ;n:type:ShaderForge.SFN_LightVector,id:3195,x:32641,y:32621,varname:node_3195,prsc:2;n:type:ShaderForge.SFN_Dot,id:2574,x:32847,y:32458,varname:node_2574,prsc:2,dt:0|A-5136-OUT,B-3195-OUT;n:type:ShaderForge.SFN_RemapRange,id:8607,x:33024,y:32458,varname:node_8607,prsc:2,frmn:-1,frmx:1,tomn:0,tomx:1|IN-2574-OUT;n:type:ShaderForge.SFN_Color,id:7050,x:32314,y:32811,ptovrint:False,ptlb:LightColor伪造光方向颜色,ptin:_LightColor,varname:__copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6886792,c2:0.120194,c3:0.120194,c4:1;n:type:ShaderForge.SFN_Multiply,id:1843,x:32555,y:32811,varname:node_1843,prsc:2|A-8607-OUT,B-7050-RGB;n:type:ShaderForge.SFN_Slider,id:2003,x:32233,y:33049,ptovrint:False,ptlb:OneSlider光强度,ptin:_OneSlider,varname:node_2003,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.31645,max:2;n:type:ShaderForge.SFN_Multiply,id:6514,x:32785,y:32799,varname:node_6514,prsc:2|A-1843-OUT,B-2003-OUT;n:type:ShaderForge.SFN_TexCoord,id:6846,x:32276,y:33205,varname:node_6846,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:3621,x:32591,y:33181,ptovrint:False,ptlb:node_3621,ptin:_node_3621,varname:node_3621,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:97e13bc521d7b4dada406599941bef7a,ntxv:0,isnm:False|UVIN-6846-UVOUT;n:type:ShaderForge.SFN_Multiply,id:32,x:32938,y:32976,varname:node_32,prsc:2|A-6514-OUT,B-3621-RGB;n:type:ShaderForge.SFN_SwitchProperty,id:6714,x:33117,y:33109,ptovrint:False,ptlb:OneSwitch光照开关,ptin:_OneSwitch,varname:node_6714,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,on:True|A-3621-RGB,B-32-OUT;n:type:ShaderForge.SFN_Vector4Property,id:2933,x:32440,y:32448,ptovrint:False,ptlb:OneVector伪造光方向,ptin:_OneVector,varname:node_2933,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5,v2:0.5,v3:0.5,v4:0;proporder:2933-7050-2003-3621-6714;pass:END;sub:END;*/

Shader "Shader Forge/L03_Properties" {
    Properties {
        _OneVector ("OneVector伪造光方向", Vector) = (0.5,0.5,0.5,0)
        _LightColor ("LightColor伪造光方向颜色", Color) = (0.6886792,0.120194,0.120194,1)
        _OneSlider ("OneSlider光强度", Range(0, 2)) = 1.31645
        _node_3621 ("node_3621", 2D) = "white" {}
        [MaterialToggle] _OneSwitch ("OneSwitch光照开关", Float ) = 0
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
            #pragma multi_compile_fwdbase_fullshadows
            #pragma target 3.0
            uniform sampler2D _node_3621; uniform float4 _node_3621_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _OneSlider)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _OneSwitch)
                UNITY_DEFINE_INSTANCED_PROP( float4, _OneVector)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
////// Lighting:
////// Emissive:
                float4 _node_3621_var = tex2D(_node_3621,TRANSFORM_TEX(i.uv0, _node_3621));
                float4 _OneVector_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OneVector );
                float4 _LightColor_var = UNITY_ACCESS_INSTANCED_PROP( Props, _LightColor );
                float _OneSlider_var = UNITY_ACCESS_INSTANCED_PROP( Props, _OneSlider );
                float3 _OneSwitch_var = lerp( _node_3621_var.rgb, ((((dot(normalize(_OneVector_var.rgb),lightDirection)*0.5+0.5)*_LightColor_var.rgb)*_OneSlider_var)*_node_3621_var.rgb), UNITY_ACCESS_INSTANCED_PROP( Props, _OneSwitch ) );
                float3 emissive = _OneSwitch_var;
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
            #pragma multi_compile_fwdadd_fullshadows
            #pragma target 3.0
            uniform sampler2D _node_3621; uniform float4 _node_3621_ST;
            UNITY_INSTANCING_BUFFER_START( Props )
                UNITY_DEFINE_INSTANCED_PROP( float4, _LightColor)
                UNITY_DEFINE_INSTANCED_PROP( float, _OneSlider)
                UNITY_DEFINE_INSTANCED_PROP( fixed, _OneSwitch)
                UNITY_DEFINE_INSTANCED_PROP( float4, _OneVector)
            UNITY_INSTANCING_BUFFER_END( Props )
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                UNITY_VERTEX_INPUT_INSTANCE_ID
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                LIGHTING_COORDS(2,3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                UNITY_SETUP_INSTANCE_ID( v );
                UNITY_TRANSFER_INSTANCE_ID( v, o );
                o.uv0 = v.texcoord0;
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                UNITY_SETUP_INSTANCE_ID( i );
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
