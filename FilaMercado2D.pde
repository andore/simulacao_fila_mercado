import java.util.List;
import java.util.Queue;
import java.util.LinkedList;
List<Caixa> caixas;
List<Cliente> clientes;

int qtdCaixas = 3;
int qtdClientesIni = qtdCaixas;

int distCaixa = 100;

int incX;
int incY;
int incZ = height/10;
int distCaixaClient = 5;
int atual = 0;
float posC=0;
int multiplicaTempo = 20;
int lambdaCliente = 60;
float lambdaAtendimento = 3;
int quantidadeClientesAtendidos = 0;
int tempoTotalAtedimento = 0;
float maiorTempoClienteSistema;
int tempoOciosoTotal;
int tempoInicio;

int vel = 1;
void setup() {
  
  /****** TEMPO DE CHEGADA DE CLIENTE EM MILISEGUNDOS *******/
  int tempoChegadaCliente = (int) (getTaxaCliente(3600, lambdaCliente) * 1000)/multiplicaTempo;
  System.out.println("Tempo acelerado " + multiplicaTempo + "x");
  
  size(800, 600); 
  noStroke();
  caixas = new ArrayList<Caixa>();
  clientes = new ArrayList<Cliente>();
  frameRate(60 * multiplicaTempo);

  for (int i=0; i<qtdCaixas; i++)
  { 
    Caixa c = new Caixa();
    c.id = i;
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
  
  tempoInicio = millis();
  
  GeraEventoChegadaCliente gerador = new GeraEventoChegadaCliente();
  gerador.inicia(tempoChegadaCliente);
  
  LogaInf loga = new LogaInf();
  loga.start(10000);
  
}

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
  
  textSize(15);
  text("Quantidade de Clientes no sistema: " + clientes.size(), 10, 30);
  text("Media tempo cliente permanece no sistema: " + (((calculaMediaTempoClientes()*multiplicaTempo)/1000)/60) + " minutos", 10, 50);
  text("Quantidade de Clientes Atendidos:" + quantidadeClientesAtendidos, 10, 70);
  text("Maior tempo de um cliente no sistema:" + ((maiorTempoClienteSistema*multiplicaTempo)/1000)/60 + " minutos", 10, 90);
  text("Tempo Ocioso do sistema:" + (float(tempoOciosoTotal)/1000) + " segundos (" + getPercentagemOciosoTotal() + "%)", 10, 110);
 
  fill(0, 102, 153);
  
}