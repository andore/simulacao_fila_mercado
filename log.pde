int count = 0;
void loganformacoes()
{
  count++;
  int qtdClienteSist = clientes.size() ;
  double medTempCliSist = (((calculaMediaTempoClientes()*multiplicaTempo)/1000)/60);
  int ocisos = getPercentagemOciosoTotal();
  float maiorTempCliSit = ((maiorTempoClienteSistema*multiplicaTempo)/1000)/60;
  int qtdClienteAtendido = quantidadeClientesAtendidos;
  
  System.out.println("\n\nINFO " + count + "," + qtdClienteSist + "," + medTempCliSist + "," + ocisos + "," + maiorTempCliSit + "," + qtdClienteAtendido);
  
  //text("Quantidade de Clientes no sistema: " + clientes.size(), 10, 30);
  //text("Media tempo cliente permanece no sistema: " + (((calculaMediaTempoClientes()*multiplicaTempo)/1000)/60) + " minutos", 10, 50);
  //text("Quantidade de Clientes Atendidos:" + quantidadeClientesAtendidos, 10, 70);
  //text("Maior tempo de um cliente no sistema:" + ((maiorTempoClienteSistema*multiplicaTempo)/1000)/60 + " minutos", 10, 90);
  //text("Tempo Ocioso do sistema:" + (float(tempoOciosoTotal)/1000) + " segundos (" + getPercentagemOciosoTotal() + "%)", 10, 110);
}

public class LogaInf implements ActionListener
{

  public void start(int intervalo)
  {
    Timer time = new Timer (intervalo, this);
    time.start();
  }
  
  @Override
  public void actionPerformed(ActionEvent e) {
    loganformacoes();
  }
  
}