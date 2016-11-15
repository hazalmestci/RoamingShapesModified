public class Shape {
  private PVector position;
  private PVector orientation;
  private PVector velocity;
  private PVector rotation;
  color myColor;

  public Shape(PVector start, PVector velocity, PVector orientation,
      PVector rotation, color myColor) {
    this.position = start;
    this.velocity = velocity;
    this.orientation = orientation;
    this.rotation = rotation;
    this.myColor = myColor;
  }

  public void update() {
    position.add(velocity);
    orientation.add(rotation);

    int barrier = 20;
    if (position.x > xMax - barrier) {
      velocity.x = -velocity.x;
    } else if (position.x < xMin + barrier) {
      velocity.x = -velocity.x;
    }
    if (position.y > yMax - barrier) {
      velocity.y = -velocity.y;
    } else if (position.y < yMin + barrier) {
      velocity.y = -velocity.y;
    }
    if (position.z > zMaxShape - barrier) {
      velocity.z = -velocity.z;
    } else if (position.z < zMin + barrier) {
      velocity.z = -velocity.z;
    }
  }

  private void drawSelf(PVector drawPosition) {
    pushMatrix();
    translate(drawPosition.x, drawPosition.y, drawPosition.z);
    rotateX(radians(orientation.x));
    rotateY(radians(orientation.y));
    rotateZ(radians(orientation.z));
    fill(myColor);
   float osc = frameCount * 0.10;
   float mx = map(mouseX, 0, width, 0, 2);
   float my = map(mouseY, 0, height, 0, 2);
   for (int i = 0; i < y.length; i++) {
    ellipse(x[i], y[i], 10, 10);
    y[i] = height/2 + sin((osc + i) * mx) * 500;
    x[i] = width/2 + cos((osc + i) * my) * 500;
   }
    popMatrix();
  }

  public void draw() {
    drawSelf(position);
  }
}