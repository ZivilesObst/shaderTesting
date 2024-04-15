/*
in development by ZivilesObst 
*/

//Settings//
#include "/lib/settings.glsl"

//Fragment Shader/////////////////////////////////////////////////
#ifdef FSH

//Varyings//
varying vec2 texCoord;

//Uniforms//
uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform vec3 sunVec;


//Attributes//

//Common Variables//
const float ambient = 0.1;

//Program//
void main(){
    vec3 albedo = pow(texture2D(colortex0, texCoord).rgb, vec3(2.2));
    vec3 normal = normalize(texture2D(colortex1, texCoord).rgb * 2.0 -1.0);
    float NdotL = max(dot(normal, normalize(sunVec)), 0.0);
    vec3 diffuse = albedo * (NdotL + ambient);

    /*DRAWBUFFERS:0*/
    gl_FragData[0] = vec4(diffuse, 1.0);
}

#endif

//Vertex Shader////////////////////////////////////////////////////
#ifdef VSH

//Varyings//
varying vec2 texCoord;

//Uniforms//

//Program//
void main(){
    gl_Position = ftransform();
    texCoord = gl_MultiTexCoord0.st;

    /*const vec2 sunRotationData = vec2(cos(sunPathRotation* 0.01745329251994), -sin(sunPathRoatation * 0.01745329251994));
    float ang = fract(timeAngle -0.25);
    ang = (ang + (cos(ang * 3.14159265358979)* -0.5 +0.5 -ang)/ 3.0) * 6.28318530717959;
    sunVec = normalize((gbufferModelView * vec4(vec3(-sin(ang), cos(ang) * sunRotationData) * 2000.0, 1.0)).xyz);

    upVec = normalize(gbufferModelView[1].xyz);
    */
}

#endif