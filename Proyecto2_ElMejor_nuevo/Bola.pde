class Particle {
  
  Body body;
  
  float r;
  color col;

  Particle(float x, float y, float r_) {
    r = r_;
    
    // Define un body
    BodyDef bd = new BodyDef();
    
    bd.type = BodyType.DYNAMIC;

    // Establecer su posición
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    
    //peso de la bola.
    fd.density = 10000;
    fd.friction = 0.1;
    fd.restitution = 0;
    
    body.createFixture(fd);

    col = color(0);
  }
  
  float MandarX(){
    Vec2 posX = box2d.getBodyPixelCoord(body);
    
    return posX.x;
    
  }
  
  float MandarY(){
    Vec2 posY = box2d.getBodyPixelCoord(body);
    
    return posY.y;
    
  }

  void display() {
    // Observamos cada body y obtenemos su posición en la pantalla.
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Obtenga su ángulo de rotación
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(col);
    stroke(0);
    strokeWeight(1);
    ellipse(0,0,r*2,r*2);
    
    popMatrix();
   }
}
