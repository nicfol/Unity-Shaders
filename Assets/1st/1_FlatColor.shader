Shader "Custom/1_FlatColor" {
	Properties {
		_Color ("Color", Color) = (1.0, 1.0, 1.0, 1.0)
	}	
	SubShader {
		Pass {
			CGPROGRAM

			//Pragmas
			#pragma vertex vert
			#pragma fragment frag

			//User defined variables
			uniform float4 _Color;

			//Base Input Structs
			struct vertexInput{
				float4 vertex : POSITION;
			};

			struct vertexOutput{
				float4 pos : SV_POSITION;
			};

			//Vertex Function
			vertexOutput vert(vertexInput v){
				vertexOutput o;
				o.pos = mul(UNITY_MATRIX_MVP, v.vertex);
				return o;
			}

			//Fragment Function
			float4 frag(vertexOutput i) : Color {
				return _Color;
			}
			
			ENDCG
		}
	}
	//Fallback commented out during development
	//Fallback "Diffuse"
}
