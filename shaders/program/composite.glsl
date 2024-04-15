/*
in development by ZivilesObst 
*/

//Settings//
#include "/lib/settings.glsl"

//Fragment Shader/////////////////////////////////////////
#ifdef FSH

//Varyings//
varying vec2 texCoord;

varying vec3 sunVec, upVec;

//Uniforms//
uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform sampler2D colortex2;
uniform sampler2D depthtex0;

uniform mat4 gbufferProjectionInverse;
uniform mat4 gbufferModelViewInverse;
uniform mat4 shadowModelView;
uniform mat4 shadowProjection;

//Attributes//

//Common Variables//
const float ambient = 0.025;

//Common Functions//

//Includes//

//Program//
void main(){
    vec3 albedo = pow(texture2D(colortex0, texCoord).rgb, vec3(2.2));
    float depth = texture2D(depthtex0, texCoord).r;
    if(depth == 1.0){
        gl_FragData[0] = vec4(albedo, 1.0);
        return;
    }
}

#endif

//Vertex Shader/////////////////////////////////////////////
#ifdef VSH

//Varyings//
varying vec2 texCoord;

varying vec3 sunVec, upVec;

//Uniforms//
uniform float timeAngle;

uniform mat4 gbufferModelView;

//Program//
void main(){
    gl_Position = ftransform();
    texCoord = gl_MultiTexCoord0.xy;

    /*const vec2 sunRotationData = vec2(cos(sunPathRotation* 0.01745329251994), -sin(sunPathRoatation * 0.01745329251994));
    float ang = fract(timeAngle -0.25);
    ang = (ang + (cos(ang * 3.14159265358979)* -0.5 +0.5 -ang)/ 3.0) * 6.28318530717959;
    sunVec = normalize((gbufferModelView * vec4(vec3(-sin(ang), cos(ang) * sunRotationData) * 2000.0, 1.0)).xyz);

    upVec = normalize(gbufferModelView[1].xyz);
    */
}

#endif