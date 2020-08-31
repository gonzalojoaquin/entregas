int cantH = 10;
int tam;
int [] posX = new int [cantH]; // Posiciones en X de cada ellipse
int [] dirX = new int [cantH]; // Direcciones en X de cada ellipse
int personajePosX, personajePosY;


void setup() {
  size(500, 500);
  tam = height/cantH;

  surface.setResizable(true);

  textSize(20);
  textAlign(CENTER);
  
  //No calculo la última fila, que es donde arranca el personaje
  for (int h=0; h < cantH-1; h++) {
    //Genero aleatoriamente la posX de la elipse
    posX[h] = round(random(tam, width-tam));
    //Genero aleatoriamente la dirección
    if (random(0, width)>width/2)
      dirX[h] = 1;
    else
      dirX[h] = -1;
  }
  
  //La ubicación del Personaje
  personajePosX = width/2;
  personajePosY = height - tam/2;
}

void draw() {  
  
  tam = height/cantH;

  background(200);
  
  //No calculo la última fila, que es donde arranca el personaje
  for (int h=0; h < cantH-1; h++) {
    fill(255);
    ellipse(posX[h], h*tam + tam/2, tam, tam);
    //Calculo la nueva posición
    posX[h] = posX[h] + dirX[h];
    if(dist(posX[h],h*tam+tam/2,personajePosX,personajePosY)<=tam-1)
     personajePosY=height - tam/2;
    if (dist(posX[h],-100,personajePosX,personajePosY)<=tam-1)
     personajePosY=height - tam/2;
    //Si toca algún borde, cambia la dirección
    if (posX[h] < tam/2 || posX[h] > width-tam/2) {
      dirX[h] = dirX[h] * -1;
    }if (personajePosY < 0) {
    fill(0);
    text("Oprime la flecha hacia arriba para volver a empezar", width/2, height/2+50);
  }
  }
  
  fill(255,0,0);
  ellipse(personajePosX, personajePosY, tam, tam);
}

void keyPressed() {
  //Controlo el personaje arriba y abajo
  if (keyCode == UP) {
    personajePosY = personajePosY - tam;
  } else if (keyCode == DOWN) {
    personajePosY = personajePosY + tam;
  }
}
