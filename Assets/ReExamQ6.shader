Shader "myshader" {
    Properties {
        _MainTex ("Texture Image", 2D) = "white" {
    }
}

SubShader {
        Pass {
            CGPROGRAM

			#pragma vertex vFunc
			#pragma fragment fFunc

			uniform sampler2D _MainTex;
    
	        struct vInput {
                float4 v : POSITION;
                float4 t : TEXCOORD0;
            };

            struct vOutput {
                float4 p : SV_POSITION;
                float4 t : TEXCOORD0;
            };

            vOutput vFunc(vInput i) {
                vOutput o;
                o.t = i.t;
                o.p = mul(UNITY_MATRIX_MVP, i.v);
                return o;
            }

			float4 fFunc(vOutput i) : COLOR {
	            return tex2D(_MainTex, 10.0 * i.t.xy);
            }

ENDCG
}
}
}