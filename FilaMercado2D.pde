import java.util.List; //<>// //<>//
import java.util.Queue;
import java.util.LinkedList;
List<Caixa> caixas;
List<Cliente> clientes;

int qtdCaixas = 3;
int qtdClientesIni = 3;

int distCaixa = 60;
int vel = 1;
int incX;
int incY;
int incZ = height/10;
int distCaixaClient = 5;
int atual = 0;
float posC=0;

void setup() {
  
  /****** TEMPO DE CHEGADA DE CLIENTE EM MILISEGUNDOS *******/
  int tempoChegadaCliente = 1000;
  
  size(800, 600); 
  noStroke();
  caixas = new ArrayList<Caixa>();
  clientes = new ArrayList<Cliente>();
  frameRate(60);

  for (int i=0; i<qtdCaixas; i++)
  {
    Caixa c = new Caixa();
    
    /****** TEMPOS DE ATENDIMENTO EM MILISEGUNDOS ******/
    c.mediaTempoAtendimento=2000;
    c.desvioPadraoTempoAtendimento=4000;
    
    c.x = (height/qtdCaixas) + (c.tX * i) + (distCaixa * i);
    c.y = (width/4);
    caixas.add(c);
  }
  
  for (int i=0; i<qtdClientesIni; i++)
  {
    Cliente cliente = new Cliente();
    cliente.x = posC;
    cliente.y = height - cliente.tX;
    clientes.add(cliente);
    posC = posC + cliente.tX;
  }
  
  GeraEventoChegadaCliente gerador = new GeraEventoChegadaCliente();
  gerador.inicia(tempoChegadaCliente);
  
} //<>//

void draw() { 
  background(150);

  for (Caixa c : caixas)
  {
    c.desenhaCaixa();
    c.atende();
  }

  for (Caixa c : caixas)
  {
    c.desenhaAtendente();
  } 
  
 
  try
  {
    for (Cliente c : clientes)
    {
      c.desenha();
    }
  }catch(Exception e)
  {
    System.out.println("Erro ao desenhar");
  } 
  andaFora();
  distribuiClientes();
}