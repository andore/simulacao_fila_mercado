class AbstractObjeto
{
  float x, y, tX, tY;
  boolean isColisao;
  
  float getBordaEsquerda()
  {
    return x - (tX/2);
  }
  
  float getBordaDireita()
  {
    return x + (tX/2);
  }
  
  float getBordaSuperior()
  {
    return y - (tY/2);
  }
  
  float getBordaInferior()
  {
    return y + (tY/2);
  }
  
}