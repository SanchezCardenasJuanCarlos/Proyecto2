import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

// Una referencia a nuestro mundo box2d
Box2DProcessing box2d;

//Declarar clase PantallaCarga
PantallaCarga c;//Nombre del objeto

//Para Limites
ArrayList <Boundary> boundaries;
ArrayList <Box> box;
Particle u;
Spring g;

//Variable de fuente
PFont fuente;

//imagen de fondo
PImage cielo;

void setup(){
  
  size(600, 300);
  
   //cielo
  cielo=loadImage("cielo.jpg");
  
   //Crear mundo de box2d --- Inicializa la física box2d y crea el mundo
   box2d = new Box2DProcessing(this);
   box2d.createWorld();
  
  //Inicializar la variable de PantallaCarga == Crear objeto
  c = new PantallaCarga();
  
  // Inicializar Limites == Crear Limites
  boundaries = new ArrayList();
  
  boundaries.add(new Boundary(width/2,height,width,0,0));
  boundaries.add(new Boundary(width/2,0,width,0,0));
  boundaries.add(new Boundary(width-1,height/2,0,height,0));
  boundaries.add(new Boundary(1,height/2,0,height,0));
  
  //Inicializar Cajas
  box = new ArrayList();
  CrearCajas();
  u = new Particle(width/2, 100, 20); //Experimentale más perroooooo!!!!!!
  g = new Spring();
 
  
  //Inicializar tu variable de fuente
  fuente = loadFont("fuente1.vlw");
  
}

void draw(){
  
  c.Cambio();
  //Pone la 4TA DIMENSIOOOOON (tiempo)
  box2d.step();
  g.update(mouseX,mouseY);
}

void mouseReleased() {
  g.destroy();
  g.checar = false;
}

// Cuando se presiona el mouse nosotros. . .
void mousePressed() {
  if(dist(u.MandarX(), u.MandarY(), mouseX, mouseY) <= 20)
  {
    g.bind(mouseX,mouseY,u);
    g.checar = true;
  }
}
 //cajas
void CrearCajas(){
  //lado izquierdo
  for(int i = 0; i < 10; i++)
  {
    box.add(new Box(117+i, 299));
  }
  //las demas cajas
   for(int i = 0; i < 10; i++)
  {
    box.add(new Box(117+i, 275));
  }
    for(int i = 0; i < 10; i++)
  {
    box.add(new Box(117+i, 251));
  }
    for(int i = 0; i < 10; i++)
  {
    box.add(new Box(117+i, 227));
  }
 //ultimas cajas
 for(int i = 0; i < 5; i++)
  {
    box.add(new Box(111+i, 203));
  }
   for(int i = 0; i < 5; i++)
  {
    box.add(new Box(111+i, 179));
  }
   for(int i = 0; i < 5; i++)
  {
    box.add(new Box(112+i, 155));
  }


  //lado derecho
  for(int i = 0; i < 10; i++)
  {
    box.add(new Box(485-i, 299));
  }
  for(int i = 0; i < 10; i++)
  {
    box.add(new Box(485-i, 275));
  }
  for(int i = 0; i < 10; i++)
  {
    box.add(new Box(485-i, 251));
  }
  for(int i = 0; i < 10; i++)
  {
    box.add(new Box(486-i, 227));
  }
  
}
