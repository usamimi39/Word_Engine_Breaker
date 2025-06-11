class Particle {
  PVector position;     // 位置 (x, y)
  PVector velocity;     // 速度 (x方向、y方向への速さ)
  PVector acceleration; // 加速度 (重力など、だんだん加わる力)
  float lifespan;       // 寿命 (だんだん消えるためのタイマー)
  float size;           // 大きさ
  color particleColor;  // 色

  // コンストラクタ: Particleが新しく作られるときに、一度だけ呼ばれる初期設定
  Particle(PVector startPosition) {
    // 位置は、キャラクターの中心など、指定された場所からスタート
    position = startPosition.copy();

    // 速度: 全方向にランダムに飛び散るように設定
    float angle = random(TWO_PI); // 0〜360°のランダムな角度
    float speed = random(1, 5);   // 飛び散る速さもランダムに
    velocity = new PVector(cos(angle) * speed, sin(angle) * speed);

    // 加速度: 少しだけ重力（下向きの力）を加えて、フワッと落ちるように見せる
    acceleration = new PVector(0, 0.05);

    // 寿命: 255からスタートし、だんだん減っていくタイマー。透明度の値として使う。
    lifespan = 255.0;

    // 大きさと色
    size = random(4, 10);
    // キラキラした黄色っぽい色 (お好みで変更してください)
    particleColor = color(255, 255, 150);
  }

  // 毎フレーム呼ばれる、状態を更新するための処理
  void update() {
    velocity.add(acceleration); // 速度に加速度を加える (重力でだんだん軌道が下がる)
    position.add(velocity);     // 位置を速度の分だけ動かす
    lifespan -= 2.5;            // 寿命を少しずつ減らす (この数値が大きいほど早く消える)
  }

  // 画面に自分自身を描画するための処理
  void display() {
    noStroke();
    // 寿命(lifespan)を透明度の値として使うことで、フワッと消える効果を出す
    fill(particleColor, lifespan);
    circle(position.x, position.y, size);
  }

  // 寿命が尽きたかどうかを判定する
  boolean isDead() {
    // lifespanが0未満になったら「寿命が尽きた(true)」と判断
    return (lifespan < 0.0);
  }
}
