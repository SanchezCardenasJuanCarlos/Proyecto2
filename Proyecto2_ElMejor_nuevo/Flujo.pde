class PantallaCarga{
  
  int p = 0;
  

  PantallaCarga(){
    
  }
  
  void Cambio(){
    
    switch(p){
      
      case 0:  //if (p == 0);
      pan1();
      break; //Termina la instruccion de este caso
      
      case 1:  
      pan2();
      break; 
      
      case 2:  
      pan3();
      break; 
      
      case 3:  
      pan4();
      break; 

    }
    
    
  }
  
  void pan1(){
    //dibujo mi imagen
    imageMode(CENTER);
    image(cielo,0,0,1200,600);
    
      //texto
       fill(0);
       textFont(fuente);
        textSize(50);
        textAlign(CENTER);
        text("Maquina de demolición",300, 150);
        fill(#D10221);
        textSize(15);
        text("PRECIONA 1", 290,260);
      
     if(keyPressed)
          if(key=='1')
          p++;
    
  }
  
  void pan2(){
    //dibujo mi imagen
    imageMode(CENTER);
    image(cielo,0,0,1200,600);
    
    rectMode(CORNERS);
    //Instrucciones
    fill(255,180);
    rect(25,25,550,270);
    
      //texto
       fill(0);
       textFont(fuente);
        textSize(20);
        textAlign(CENTER);
        text("INSTRUCCIONES",300, 50);
        text("Demuele los edificios ",300, 80);
        text("y disfruta del juego ",300, 110);
        text("aunque ya los hayas ",300, 140);
        text("demolido. Selecciona ",300, 170);
        text("la bola de demolicion ",300, 200);
        text("con el mouse sin dejar de ",300, 230);
        text("presionar la bola.",300, 260);
        fill(#00833C);
        textSize(15);
        text("PRESIONA 2",480,260);
    //Fin de Instrucciones
    if(keyPressed)
          if(key=='2')
          p++;
  }
  
  void pan3(){
    //dibujo mi imagen
    imageMode(CENTER);
    image(cielo,0,0,1200,600);
    
    //Para una clase Boundary, crear una variable 's' que controle todo el Arraylist boundaries
    for (Boundary s : boundaries) 
      s.display();
      
    for (Box a : box) 
      a.display();
      
      u.display(); //Llamar al display de la BOLA
      
      //texto
      fill(#D10221);
      textSize(15);
        text("PRESIONA 3, si ya te aburriste",460,50);
        
     g.display();
    
    if(keyPressed)
          if(key=='3')
          p++;
  }
  
  void pan4(){
    
    //dibujo mi imagen
    imageMode(CENTER);
    image(cielo,0,0,1200,600);
    
     //Instrucciones
    fill(255,180);
    rect(300,150,550,260);
   
    
      //texto
       fill(0);
       textFont(fuente);
        textSize(20);
        textAlign(CENTER);
        text("Gracias por jugar ",300, 80);
        text("Maquina de demolición, ",300, 110);
        text("espero lo hayas disfrutado.",300, 140);
        text("Para volver a jugar ",300, 170);
        fill(#00833C);
        textSize(15);
        text("PRESIONA 4",300,200);
        
        if(keyPressed)
          if(key == '4')
          {
           p=0;
           for (Box s : box) 
              s.killBody();
              CrearCajas();
          }
       
      }
    
  
  
}
