import java.util.List;
import java.util.Queue;
import java.util.LinkedList;
List<Caixa> caixas;
List<Cliente> clientes;

int qtdCaixas = 3;
int qtdClientesIni = qtdCaixas;

int distCaixa = 200;

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

float cameraY = height/2;
float cameraX = width/2;
float zoom;

int vel = 1;
void setup() {
  
  /****** TEMPO DE CHEGADA DE CLIENTE EM MILISEGUNDOS *******/
  int tempoChegadaCliente = (int) (getTaxaCliente(3600, lambdaCliente) * 1000)/multiplicaTempo;
  System.out.println("Tempo acelerado " + multiplicaTempo + "x");
  
  size(800, 600, P3D); 
  noStroke();
  caixas = new ArrayList<Caixa>();
  clientes = new ArrayList<Cliente>();
  frameRate(60 * multiplicaTempo/2 );

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
    c.desenhaCaixa3D();
    c.atende();
  }

  for (Caixa c : caixas)
  {
    c.desenhaAtendente3D();
  } 
  
 
  try
  {
    for (Cliente c : clientes)
    {
      c.desenha3D();
    }
  }catch(Exception e)
  {
    
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
  if(mousePressed){
    cameraX += pmouseX - mouseX;
    cameraY += pmouseY - mouseY;
  }
  
   camera(cameraX,cameraY, (height/2) / tan(PI/6) + zoom, cameraX, height/2, 0, 0, 1, 0);
  
  
}