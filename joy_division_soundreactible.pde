import ddf.minim.*;

Minim minim;
AudioInput in;
float v = 0;
float vv = 0;
float angle = 0;

void setup()
{
  size(720, 576);
smooth();
  minim = new Minim(this);
  in = minim.getLineIn();
}

void draw()
{
  angle += 0.01;
  background(0, 50);
  stroke(255);

  for (int i = 0; i < 10; i++)  //in.bufferSize() - 1
  {
    pushMatrix();
    translate(width/2, height/2);
    
    for (int ii=0;ii<=80;ii+=10) {
      v = random(-1, 1);
      vv = random(-1, 1);
      stroke(191, 75+50*sin(angle*random(-0.1, 0.1)));
      strokeWeight(1);
      ellipse(random(-width/2, width/2), random(-height/2, height/2), 1, 1);
      ellipse(random(-width/2, width/2), random(-height/2, height/2), 1, 1);
      stroke(255, 75+50*sin(angle*random(-0.1, 0.1)));
      strokeWeight(1);
      ellipse(in.right.get(i)*1000*v, in.left.get(i)*1000*vv, 1, 1);
   }

    
    
     fill(0,0);
    stroke(191, 50+25*sin(angle*random(-0.1,0.1)));
    strokeWeight(1);
    beginShape();
    vertex(-width/2, -height/2+i*58);
    bezierVertex(-width/2, -height/2+i*58, in.left.get(i)*750, in.right.get(i)*750, width/2, -height/2+i*58);
    endShape();
    beginShape();
    vertex(-width/2+i*72, -height/2);
    bezierVertex(-width/2+i*72, -height/2, in.left.get(i)*750, in.right.get(i)*750, -width/2+i*72, height/2);
    endShape();
    stroke(255, 50+25*sin(angle*random(-0.1,0.1)));
    strokeWeight(1);
    beginShape();
    vertex(-width/2, 0);
    bezierVertex(-width/2, 0, in.left.get(i)*750, in.right.get(i)*750, width/2, 0);
    endShape();
    popMatrix();
   
    
  
}
}


