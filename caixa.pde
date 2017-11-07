import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.Timer;

public class Caixa extends AbstractObjeto implements ActionListener
{
  Timer t;
  int cor=0;
  boolean isFuncionando;
  boolean isAtendendo;
  int tempoAtendimento;
  int mediaTempoAtendimento;
  int desvioPadraoTempoAtendimento;
  
  int larguraAtendente = 20;
  int alturaAtendente = 15;
  
  LinkedList <Cliente> filaCliente = new LinkedList();
  private Cliente cAtual;
  
  public Caixa()
  {
    tX = 70;
    tY = 100;  
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
        isAtendendo = true;
        t = new Timer((int)random(mediaTempoAtendimento, desvioPadraoTempoAtendimento), this);
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
    c.y = getBordaInferior() + (filaCliente.size() * (distCaixaClient + c.tX)) + 40;
  }
  
  public Cliente getProximoCliente()
  {
      if(clientes.isEmpty())
      {
        return null;
      }
      else
      {
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
    cAtual.isAtendido = true;
  }
}