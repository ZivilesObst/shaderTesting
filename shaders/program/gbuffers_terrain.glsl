/*
in development by ZivilesObst 
*/

//Settings//
#include "/lib/settings.glsl"

//Fragment Shader//////////////////////////////////////////////////
#ifdef FSH

//Varyings//
varying vec2 texCoord;
varying vec3 normal;
varying vec4 color;

//Uniforms//
uniform sampler2D texture;

//Program//
void main(){
    vec4 albedo = texture2D(texture, texCoord) * color;

    /*DRAWBUFFERS:01 */

    gl_FragData[0] = albedo;
    gl_FragData[1] = vec4(normal * 0.5 + 0.5, 1.0);
}

#endif

//Vertex Shader////////////////////////////////////////////////////
#ifdef VSH

//Varyings//
varying vec2 texCoord;
varying vec3 normal;
varying vec4 color;

//Program//
void main(){
    gl_Position = ftransform();

    texCoord = gl_MultiTexCoord0.st;
    normal = gl_NormalMatrix * gl_Normal;
    color = gl_Color;
}

#endif