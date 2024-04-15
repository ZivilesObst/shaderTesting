/*
in development by ZivilesObst 
*/

//Settings//
#include "/lib/settings.glsl"

//Fragment Shader//////////////////////////////////////////////////
#ifdef FSH

//Varyings//
varying vec2 texCoord;

//Uniform//
uniform sampler2D colortex0;

//Optifine Constants//
/*
const int colortex0Format = R11F_G11F_B10F; //main scene
const int colortex1Format = RGB8; //raw translucent, bloom, final scene
const int colortex2Format = RGBA16; //temporal data
const int colortex3Format = RGB8; //specular data
const int gaux1Format = R8; //cloud alpha, ao
const int gaux2Format = RGB10_A2; //reflection image
const int gaux3Format = RGB16; //normals
const int gaux4Format = RGB16; //fresnel
*/

//Program//
void main(){
    vec3 color = pow(texture2D(colortex0, texCoord).rgb, vec3(1.0 / 2.2));
    gl_FragColor = vec4(color, 1.0);
}

#endif

//Vertex Shader////////////////////////////////////////////////////
#ifdef VSH

//Varyings//
varying vec2 texCoord;

//Program//
void main(){
    gl_Position = ftransform();
    texCoord = gl_MultiTexCoord0.st;
}

#endif