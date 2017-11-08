public static int getPoisson(double lambda) {
  double L = Math.exp(-lambda);
  double p = 1.0;
  int k = 0;

  do {
    k++;
    p *= Math.random();
  } while (p > L);

  return k - 1;
}

public static double getTaxaCliente(float tempo, float lambda)
{
  double tempoChegadaCliente;
  double possion = getPoisson(lambda);
  tempoChegadaCliente = tempo/possion;
  
  System.out.println("LAMBDA = " + lambda + " POISSON = " + possion + " INTERVALO DE TEMPO = " + tempo/3600 + " hora(s)");
  System.out.println("TAXA: chega 1 cliente a cada " + tempoChegadaCliente + " segundos");
  return tempoChegadaCliente;
}

public double getTaxaAtendimento(float minutos, Caixa c)
{
  double tempoAtendimento;
  double lambda = minutos *60;
  double poisson = getPoisson(lambda);
  
  tempoAtendimento = poisson;
  
  if(c.id == 0)
  {
    //System.out.println("CAIXA T QUANTIDADE TOTAL CLIENTE: " + quantidadeClientesAtendidos);
  }
  
  //System.out.println("CAIXA " + c.id + " LAMBDA: " + lambda + "(segundos) POISSON: " + poisson + "(segundos)");
  //System.out.println("CAIXA " + c.id + " TEMPO ATENDIMENTO:" + tempoAtendimento/60 + " minutos ou " + tempoAtendimento + " segundos" );
  //System.out.println("CAIXA " + c.id +" MEDIA ATENDIMENTO: " + (c.getMediaAtendimento()/60)/1000 + " minutos");
  //System.out.println("CAIXA " + c.id + " TEMPO OCIOSO: " + c.tempoOciosidade + "ms (" +c.getPercentagemOciosa()+ "%)");
  //System.out.println("CAIXA " + c.id + " QTD TOTAL ATENDIMENTOS: " + c.qtdTotalAtendimento + " clientes");  
  //System.out.print("CAIXA P " + c.id + "," + lambda + "," + poisson + "," + tempoAtendimento/60 + "," + (c.getMediaAtendimento()/60)/1000 + "," + c.tempoOciosidade + "," + c.getPercentagemOciosa() + "," + c.qtdTotalAtendimento);

  return tempoAtendimento * 1000;
} //<>//

double calculaMediaTempoClientes()
{
  if(quantidadeClientesAtendidos==0)
  {
    return 0;
  }
  
  return tempoTotalAtedimento/quantidadeClientesAtendidos;
}

int getPercentagemOciosoTotal()
{
   int tempoTotal = millis() - tempoInicio;  
   return (100*tempoOciosoTotal)/tempoTotal;
 }