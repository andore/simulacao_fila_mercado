public class Cliente extends AbstractObjeto
{
  boolean isEmFila = true;
  
  boolean isEmAtendimento;;  private boolean isAtendido = false;
  boolean isAndaX = true;
  boolean isAndaY = true;
  boolean isTerminado = false;
  Caixa atendente;
  int corR;
  int corG;
  int corB;
  int tempoEntradaSistema;

 
 
  public Cliente()
  {
     tX = 20;
     tY = 20;
     corR = (int)random(100,255);
     corG = (int)random(100,255);
     corB = (int)random(100,255);
     tempoEntradaSistema = millis();
  }
  
  void desenha3D()
  {
    pushMatrix();
    translate(x, y, 0);
    fill(corR,corG,corB);
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
  
  public void atendido()
  {
    isAtendido= true;
    quantidadeClientesAtendidos++;
    int tempoSistema = millis() - tempoEntradaSistema;
    tempoTotalAtedimento += tempoSistema;
    if(tempoSistema > maiorTempoClienteSistema)
    {
      maiorTempoClienteSistema = tempoSistema;
    }
    
    //System.out.println("Tempo do cliente no sistema:" + tempoSistema+ "segundos TOTAL" + tempoTotalAtedimento);
  }
  
}