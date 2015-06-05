
extern number r=0.4;
extern number g=0.7;
extern number b=1;
extern number pa=0.95;
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
	vec4 pixel = Texel(texture, texture_coords);
	pixel.r=r;
	pixel.g=g;
	pixel.b=b;
	// pixel.a*=pa;
	return pixel;
}
