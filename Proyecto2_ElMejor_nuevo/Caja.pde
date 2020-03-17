class Box {
  boolean vivo = true;

  // Necesitamos hacer un seguimiento de un body y un ancho y alto
  Body body;
  float w;
  float h;

  // Constructor
  Box(float x_, float y_) {
    float x = x_;
    float y = y_;
    w = 24;
    h = 24;  
    // Agrega el cuadro al mundo box2d
    makeBody(new Vec2(x,y),w,h);
  }

  
   // Esta función elimina la partícula del mundo box2d
  void killBody() {
    if (vivo)
      box2d.destroyBody(body);
      
    vivo = false;

    
  }

  boolean contains(float x, float y) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }

   // Dibujando el box
  void display() {
    if(vivo){
      
      
   // Observamos cada body y obtenemos su posición en la pantalla
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Obtenga su ángulo de rotación
    float a = body.getAngle();

    rectMode(PConstants.CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(a);
    fill(#88B7C4);
    stroke(0);
    rect(0,0,w,h);
    popMatrix();
    
    }
  }


  // Esta función agrega el rectángulo al mundo box2d
  void makeBody(Vec2 center, float w_, float h_) { 
  // Define y crea el body
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    
    // Definir un polígono (esto es lo que usamos para un rectángulo)
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w_/2);
    float box2dH = box2d.scalarPixelsToWorld(h_/2);
    sd.setAsBox(box2dW, box2dH);

    
    // Definir un fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    
    // Parámetros que afectan la física.
    fd.density = 5000;
    fd.friction = 30000;
    fd.restitution = 0;

    body.createFixture(fd);
    

    
    // Dale una velocidad aleatoria inicial
    body.setLinearVelocity(new Vec2(random(-5, 5), random(2, 5)));
    body.setAngularVelocity(random(-5, 5));
  }

}
