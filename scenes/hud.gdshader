shader_type canvas_item;

uniform vec2 velocity = vec2(0,0);

void vertex() {
  //VERTEX += vec2(cos(TIME)*100.0, sin(TIME)*100.0);
  VERTEX += velocity / 5.0;
}