Shader "Holistic/BumpDiffuse"
{
	Properties{
		_myDiffuse ("Diffuse Texture", 2D) = "white" {}
		_myBump ("Normal Texture", 2D) = "bump" {}
		//_mySlider ("Range", Range(0,10)) = 1
		_mySliderTex ("Texture Scale", Range(0,10)) = 1
		_myX ("Nx", Range(-10,10)) = 1
		_myY ("Ny", Range(-10,10)) = 1
		_myZ ("Nz", Range(-10,10)) = 1
	}
	SubShader{
		CGPROGRAM
		#pragma surface surf Lambert
		
		sampler2D _myDiffuse;
		sampler2D _myBump;
		//half _mySlider;
		half _mySliderTex;
		half _myX;
		half _myY;
		half _myZ;

		struct Input{
			float2 uv_myDiffuse;
			float2 uv_myBump;
		};

		void surf (Input IN, inout SurfaceOutput o) {
			o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse * _mySliderTex).rgb;
			o.Normal = UnpackNormal(tex2D(_myBump, IN.uv_myBump * _mySliderTex));
			o.Normal *= float3(_myX, _myY, _myZ);
		}

		ENDCG
	}
	Fallback "Diffuse"
}