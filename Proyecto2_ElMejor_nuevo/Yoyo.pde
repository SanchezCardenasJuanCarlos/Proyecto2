class Spring {
  boolean checar = false;
  
  MouseJoint mouseJoint;

  Spring() {
    // Para que no exista en un inicio
    mouseJoint = null;
  }
  
  //Si existe ponerlo en las coordenadas del mouse
  void update(float x, float y) {
    if (mouseJoint != null) {
      Vec2 mouseWorld = box2d.coordPixelsToWorld(x,y);
      mouseJoint.setTarget(mouseWorld);
    }
  }

  void display() {
    if(checar)
    {
          if (mouseJoint != null) {
          // Podemos obtener los dos puntos de anclaje
          Vec2 v1 = new Vec2(0,0);
          mouseJoint.getAnchorA(v1);
          Vec2 v2 = new Vec2(0,0);
          mouseJoint.getAnchorB(v2);
          // Convertirlos a coordenadas de pantalla
          v1 = box2d.coordWorldToPixels(v1);
          v2 = box2d.coordWorldToPixels(v2);
          // Y solo dibuja una línea
          stroke(random(255), random(255), random(255));
          strokeWeight(3);
          line(v1.x,v1.y,v2.x,v2.y);
        }
    }
  }

  void bind(float x, float y, Particle particle) {
    
    MouseJointDef md = new MouseJointDef();
    md.bodyA = box2d.getGroundBody();
    md.bodyB = particle.body;
    Vec2 mp = box2d.coordPixelsToWorld(x,y);
    md.target.set(mp);
    md.maxForce = 1000.0 * particle.body.m_mass;
    md.frequencyHz = 5.0;
    md.dampingRatio = 0.9;

    // ¡Haz la articulación!
    mouseJoint = (MouseJoint) box2d.world.createJoint(md);
    
  }

  void destroy() {
    //Podemos deshacernos de la articulación cuando se suelta el mouse
    if (mouseJoint != null) {
      box2d.world.destroyJoint(mouseJoint);
      mouseJoint = null;
    }
  }

}
