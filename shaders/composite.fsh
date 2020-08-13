#version 120
#include "/lib/settings.glsl"

uniform sampler2D gcolor;

varying vec2 texcoord;

uniform float frameTimeCounter;

void main() {
	vec3 color = texture2D(gcolor, texcoord).rgb;

	//color = vec3(1.0, 1.0, 1.0);
	
	if(texcoord.x < 0.2 && texcoord.y > 0.5) {
	   color = vec3(texcoord.x / texcoord.y, texcoord.x / texcoord.y, texcoord.x / texcoord.y);

	}

	#ifdef RAINBOW_SCREEN
	color.r *= abs(sin(frameTimeCounter));
	color.g *= abs(cos(frameTimeCounter));
	color.b *= abs(tan(frameTimeCounter));
	#endif

/* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(color, 1.0); //gcolor
}