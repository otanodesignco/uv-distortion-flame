uniform float uTime;
uniform sampler2D uNoiseTexture;
uniform sampler2D uNoiseFlame;
uniform sampler2D uColorMap;

in vec2 vUv;
in vec3 worldPosition;
in vec3 worldNormal;
in vec3 viewDirection;
in vec3 normals;

#include ./lib/uv/uvPan.glsl
#include ./lib/color/colorGradientMap.glsl
#include ./lib/uv/uvDistort.glsl

void main()
{

    vec2 uv = vUv;
    float time = uTime;
    vec2 uvDistrort = uvDistort( uv, uNoiseTexture, vec2( 0.0, -0.2 ), time, 0.2 );

    float flames = texture( uNoiseFlame, uvDistrort ).r;
    vec4 colorFlame = vec4( flames  );

    vec4 colorFinal = colorGradientMap( colorFlame, uColorMap, 1.1 );

    vec2 uvWorld = worldPosition.xy;
    // uvWorld *= 0.5 + 0.5;
    
    gl_FragColor = colorFinal;
    
    #include <tonemapping_fragment>
    #include <colorspace_fragment>
    
}