import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.Timer;

public class Caixa implements ActionListener
{
  Timer t;
  
  int x,y;
  int tX = 60;
  int tY = 100;
  int cor=0;
  boolean isFuncionando;
  
  boolean isAtendendo;
  int tempoAtendimento;
  
  int larguraAtendente = 20;
  int alturaAtendente = 15;
  
  public Caixa()
  {
    
  }
  
  void desenhaCaixa()
  {
    rectMode(CENTER);
    
    fill(44);
    rect(x, y, tX, tY);  
  }
 
  void desenhaAtendente()
  {  
    if(isAtendendo)
    {
      cor +=5;
      if(cor > 255)
      {
        cor=0;
      }
      
      fill(cor,cor,255);
      rect(x + tX/10, y, larguraAtendente, alturaAtendente);
    }
    else if(isFuncionando)
    {
      cor=0;
      fill(70,255,70);
      rect(x + tX/10, y, larguraAtendente, alturaAtendente);
    }
    else if(!isFuncionando)
    {
      cor=0;
      fill(200,200,200);
      rect(x + tX/10, y, larguraAtendente, alturaAtendente);
    }
  }
  
  void atende()
  {
    if(!isAtendendo && isFuncionando) //<>//
    {
      isAtendendo = true;
      t = new Timer(tempoAtendimento, this);
      t.setRepeats(false);
      t.start();
    }
  }
  
  @Override
  public void actionPerformed(ActionEvent e) {
    isAtendendo = false; //<>//
  }
}