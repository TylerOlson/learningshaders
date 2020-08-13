#version 120
#include "/lib/settings.glsl"

uniform sampler2D lightmap;
uniform sampler2D texture;
uniform vec4 entityColor;

varying vec2 lmcoord;
varying vec2 texcoord;
varying vec4 glcolor;

uniform float frameTimeCounter;

void main() {
	vec4 color = texture2D(texture, texcoord) * glcolor;
	color.rgb = mix(color.rgb, entityColor.rgb, entityColor.a);
	color *= texture2D(lightmap, lmcoord);

	#ifdef RAINBOW_ENTITIES
	color.r *= abs(sin(frameTimeCounter));
	color.g *= abs(cos(frameTimeCounter));
	color.b *= abs(tan(frameTimeCounter));
	#endif

/* DRAWBUFFERS:0 */
	gl_FragData[0] = color; //gcolor
}