Shader "Holistic/Challenge4"
{
	Properties{
		_myDif ("Diffuse Texture", 2D) = "white" {}
		_myEmi ("Emissive Texture", 2D) = "black" {}
	}

	SubShader{
		CGPROGRAM
		#pragma surface surf Lambert

		sampler2D _myDif;
		sampler2D _myEmi;

		struct Input{
			float2 uv_myDif;
			float2 uv_myEmi;
		};

		void surf (Input IN, inout SurfaceOutput o){
			o.Albedo = tex2D(_myDif, IN.uv_myDif).rgb;
			o.Emission = tex2D(_myEmi, IN.uv_myEmi).rgb;
		}
		ENDCG
	}
	Fallback "Diffuse"
}
