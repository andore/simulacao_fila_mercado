public class Cliente
{
  int x,y;
  int tX = 20;
  int tY = 20;
  
  boolean isEmFila = true;
  boolean isEmAtendimento;
  boolean isAtendido;

  void desenha()
  {
    ellipse(x, y, tX, tY);
  }

}