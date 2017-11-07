public class Cliente extends AbstractObjeto
{
  boolean isEmFila = true;
  boolean isEmAtendimento;
  boolean isAtendido = false;
  boolean isAndaX = true;
  boolean isAndaY = true;
  boolean isTerminado = false;
  Caixa atendente;
  int corR;
  int corG;
  int corB;
 
  public Cliente()
  {
     tX = 20;
     tY = 20;
     corR = (int)random(100,255);
     corG = (int)random(100,255);
     corB = (int)random(100,255);
  }
  
  void desenha3D()
  {
    pushMatrix();
    translate(x, y, 0);
    fill(200,200,200);
    sphere(tX);
    popMatrix();
    
    pushMatrix();
    translate(x, y, 50);
    fill(0,0,0);
    sphere(25);
    popMatrix();
  }
  
  void desenha()
  {
    fill(corR,corG,corB);
    ellipse(x, y, tX, tY);
    
    fill(0,0,0);
    ellipse(x, y, tX/2, tY/2);
  }
}