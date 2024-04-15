/* by ZivilesObst*/

/*
You can edit this file to enable, disable and tweak features.
*/

//Shader Options//

    #define ABOUT 0 //[0]

//Lighting//
    const int shadowMapResolution = 2048; //[512 1024 2048 3072 4096]
    const int noiseTextureResolution = 64; //[32 64 128]

    const float sunPathRotation = -40.0; //[-85.0 -88.0 -75.0 -70.0 -65.0 -60.0 -55.0 -50.0 -45.0 -40.0 -35.0 -25.0 -20.0 -15.0 -10.0 -5.0 0.0 5.0 10.0 15.0 20.0 25.0 30.0 35.0 40.0 45.0 50.0 55.0 60.0 65.0 75.0 80.0 85.0]

    #define AO
    #define AO_STRENGTH 1.00 //[0.25 0.50 0.75 1.00 1.25 1.50 1.75 2.00]

//Material//

//Atmospherics//

//Water//

//Post Effects//

//Color//
#define SKY_R 96 //[0 4 16 32 64]
#define SKY_G 160 //[0 4 16 32 64]
#define SKY_B 255 //[0 4 16 32 64]
#define SKY_I 1.00 //[0.05 0.10 0.25 0.5 0.75]

//World//