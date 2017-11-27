import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.Timer;

public class Caixa extends AbstractObjeto implements ActionListener
{
  int id;
  Timer t;
  int cor=0;
  boolean isFuncionando = true;
  boolean isAtendendo;
  int tempoAtendimento;
  
  int larguraAtendente = 20;
  int alturaAtendente = 15;
  int qtdTotalAtendimento;
  int qtdTotalTempoAtendimento ;
  int mediaTempoAtendimento;
  int tempoOciosidade;
  int tempoFilaVazia;
  int tempoIni;
  
  LinkedList <Cliente> filaCliente = new LinkedList();
  private Cliente cAtual;
  
  public Caixa()
  {
    tX = 70;
    tY = 100;
    tempoIni = millis();
  }
  
  void desenhaCaixa3D()
  {
    pushMatrix();
    translate(x,y,0);
    box(tX,tY,100);
    popMatrix();
  }
  
  void desenhaAtendente3D()
  {
    fill(80);
    textSize(11);
    text("\nCAIXA " + id + "\nMEDIA = " + (getMediaAtendimento()/60)/1000 + " min\nTOT ATENDIMENTOS = " + qtdTotalAtendimento + "\nTEMPO OCIOSO = " + tempoOciosidade/1000 + " (" +getPercentagemOciosa()+ "%)", x - tX/2, y + tY/2);
    pushMatrix();
    translate(x,y,100);
    if(isAtendendo)
    {
      cor +=5;
      if(cor > 255)
      {
        cor=0;
      }  
      fill(cor,cor,255);
    }
    else if(isFuncionando)
    {
      cor=0;
      fill(70,255,70);
    }
    else if(!isFuncionando)
    {
      cor=0;
      fill(200,200,250);
    }
    sphere(20.0);
    popMatrix();
  }
  
  void desenhaCaixa()
  {
    rectMode(CENTER);
    fill(80);
    rect(x, y, tX, tY);
    
     textSize(11);
     text("\nCAIXA " + id + "\nMEDIA = " + (getMediaAtendimento()/60)/1000 + " min\nTOT ATENDIMENTOS = " + qtdTotalAtendimento + "\nTEMPO OCIOSO = " + tempoOciosidade/1000 + " (" +getPercentagemOciosa()+ "%)", x - tX/2, y + tY/2);
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
    }
    else if(isFuncionando)
    {
      cor=0;
      fill(70,255,70);
    }
    else if(!isFuncionando)
    {
      cor=0;
      fill(200,200,250);
    }
    rect(x + tX/10, y, larguraAtendente, alturaAtendente);
  }
  
  void atende()
  {
    if(cAtual == null)
    {
      cAtual = getProximoCliente();
    }
    
    if(cAtual!=null && cAtual.isAtendido)
    {
      filaCliente.remove(cAtual);
      cAtual = null;
    }

    if(cAtual!=null)
    {
      if(isFuncionando)
      {
        if(cAtual.isAndaX || cAtual.isAndaY)
          andaParaCaixa(cAtual, this); 
      }
      
      if(!isAtendendo && isFuncionando && !cAtual.isAndaX && !cAtual.isAndaY && !cAtual.isAtendido)
      {
        
        //System.out.println("\n");
        //System.out.println("CAIXA " + id);
        
        
        this.qtdTotalAtendimento ++;
        this.tempoAtendimento = (int)(getTaxaAtendimento(lambdaAtendimento, this)); 
        this.qtdTotalTempoAtendimento += tempoAtendimento;
          
        isAtendendo = true;
        t = new Timer(tempoAtendimento/multiplicaTempo, this);
        t.setRepeats(false);
        t.start();
      }
    }
  }
  
  public void adicionaCliente(Cliente c)
  {
    filaCliente.add(c);
    c.atendente = this;
    c.x = x;
    c.y = getBordaInferior() + (filaCliente.size() * (distCaixaClient + c.tX)) + 60;
  }
  
  public Cliente getProximoCliente()
  {
      if(filaCliente.isEmpty() && tempoFilaVazia==0 )
      {
        tempoFilaVazia = millis();
        return null;
      }
      else
      {
        if(tempoFilaVazia > 0)
        {
          int tempo = millis() - tempoFilaVazia;
          tempoOciosoTotal += tempo;
          tempoOciosidade += tempo;
          tempoFilaVazia=0;
        }
        for(int i=0; i<filaCliente.size(); i++)
        {
           if(!filaCliente.get(i).isEmAtendimento)
            filaCliente.get(i).y = filaCliente.get(i).y - distCaixaClient - filaCliente.get(i).tY; 
        }
        return filaCliente.poll();
      }
      
     
  }
  
  @Override
  public void actionPerformed(ActionEvent e) {
    isAtendendo = false;
    cAtual.atendido();
  }
  
  private float getMediaAtendimento()
  {
    if(qtdTotalAtendimento == 0)
    {
      return 0;
    }
    
    return (qtdTotalTempoAtendimento/qtdTotalAtendimento);
  }
 
 int getPercentagemOciosa()
 {
   int tempoTotal = millis() - tempoIni;  
   return (100*tempoOciosidade)/tempoTotal;
 }
}