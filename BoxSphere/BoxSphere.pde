
int num = 100;                     //y軸回転の正方形の数
int sm = 100;                      //x軸z軸回転体の数
color[] colors = new color[num];   //正方形ごとのカラー配列
float rotate_speed;                //回転スピード
boolean change_mode = true;        //描画モード切り替え

void setup() {
  size(400, 400, P3D);
  colorMode(HSB, 360, 100, 100, 100);
  noStroke();

  //カラーの初期設定
  for (int i=0; i<num; i++) {
    colors[i] = color((i+1)*360/num, 80, 100, 10);
  }
}

void draw() {
  background(50);
  camera(width/2-mouseX, height/2-mouseY, 100, 
  0, 0, 0, 
  0, 1, 0);
  
  //ボックス描画と回転
  for (int i=0; i<num; i++) {
    for (int j=1; j<=sm; j++) {
      pushMatrix();
      fill(colors[i]);
      rotateX(rotate_speed+radians((j*360/sm)));
      rotateZ(rotate_speed+radians((j*360/sm)));
      rotateY(rotate_speed+radians((i+1)*360/num));
      box(50);
      popMatrix();
    }
  }
  rotate_speed += 0.01;
}

void mousePressed(){
  
  //描画モードの切り替え
  change_mode = !change_mode;
  
  //描画の更新
  for (int i=0; i<num; i++) {
    if (change_mode == true) {
      colors[i] = color((i+1)*360/num, 80, 100, 10);
    } else {
      colors[i] = color(100, 100, 100, 100);
    }
  }
}

