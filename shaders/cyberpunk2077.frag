#version 300 es
precision mediump float;

in vec2 v_texcoord;
layout(location = 0) out vec4 fragColor;

uniform sampler2D tex;
uniform float time;

void main() {
    vec2 uv = v_texcoord;
    vec4 pixColor = texture(tex, uv);

    // Subtle scanlines
    float scanline = sin(uv.y * 600.0 + time * 3.0) * 0.02;
    pixColor.rgb += scanline;

    // Chromatic aberration
    float offset = 0.0015;
    vec4 red = texture(tex, uv + vec2(offset, 0.0));
    vec4 blue = texture(tex, uv + vec2(-offset, 0.0));
    pixColor.r = red.r;
    pixColor.b = blue.b;

    // Vignette
    vec2 center = vec2(0.5, 0.5);
    float dist = distance(uv, center);
    float vignette = 1.0 - smoothstep(0.3, 0.8, dist);
    pixColor.rgb *= vignette;

    // Cyan cyberpunk tint
    pixColor.b *= 1.15;

    fragColor = pixColor;
}
