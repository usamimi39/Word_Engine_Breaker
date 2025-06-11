//パーティクルの描写
class Particle {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  float size;
  color particleColor;


  Particle(PVector startPosition, color pColor, PVector acc) {
    position = startPosition.copy();

    float angle = random(TWO_PI);
    float speed = random(0.5, 3);
    velocity = new PVector(cos(angle) * speed, sin(angle) * speed);

    acceleration = acc.copy();

    lifespan = 255.0;

    size = random(4, 10);
    particleColor = pColor;
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.5;
  }


  void display() {
    noStroke();

    fill(particleColor, lifespan);
    circle(position.x, position.y, size);
  }


  boolean isDead() {
    return (lifespan < 0.0);
  }
}
