
extern number y=450;
extern number height=100;
vec4 effect( vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords ){
	vec4 pixel = Texel(texture, texture_coords);
	if(screen_coords.y > y){
		pixel.a*=1;
	}else if(screen_coords.y > y-height){
		pixel.a*=1-(y-screen_coords.y)/height;
	}else{
		pixel.a*=0;
	}
	return pixel;
}
