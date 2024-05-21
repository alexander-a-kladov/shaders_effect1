#version 430

out vec4 fragColor;

uniform vec2 resolution;
uniform float time;

vec2 rotate2D(vec2 uv, float a) {
 float s = sin(a);
 float c = cos(a);
 return mat2(c, -s, s, c) * uv;
}

vec3 getColor(vec2 uv, vec3 col) {
 float diff = uv.y - cos(time)*sin(cos(uv.x/4.0+time/20.0)*6.28)/2.0;
 col +=0.02/sqrt(diff*diff);
 return col;
}

void main() {
 vec2 uv = (gl_FragCoord.xy - 0.5 * resolution.xy) / resolution.y;
 vec3 col = vec3(0.0);
 
 for (int i = 0; i < 30; i++) {
  vec2 uv = rotate2D(uv, 2.0*sin(time/20.0)-i*(6.28/15));
  col = getColor(uv, col);
 }
col *= vec3(0.1, 0.05, 0.025);
 
 fragColor = vec4(col, 1.0);
}
