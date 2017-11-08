void adicionaCliente()
{
   
     Cliente cliente = new Cliente();
     cliente.x = posC;
     cliente.y = height - cliente.tX;
     clientes.add(cliente);
     posC = posC + cliente.tX; 
     
     if(posC > width)
     {
       posC = 0;
     }
  
}

void distribuiClientes()
{
  for(Cliente c: clientes)
  {
    if(c.atendente != null)
    {
      continue;
    }
    
    int menor=clientes.size();
    int indice=0;
    int qtdCliente;
    for(int i=0; i<caixas.size(); i++)
    {
        if(caixas.get(i).isFuncionando)
        {
          qtdCliente = caixas.get(i).filaCliente.size();
          
          if(caixas.get(i).isAtendendo)
          {
            qtdCliente++;
          }
          
          if(qtdCliente<= menor)
          {
            menor = caixas.get(i).filaCliente.size();
            indice = i;
          }    
        }
    }
    
    if(menor < 8 && caixas.get(indice).isFuncionando)
    {
      caixas.get(indice).adicionaCliente(c);
    }
  }
}

class GeraEventoChegadaCliente implements ActionListener
{
  
  public void inicia(int tempo)
  {
    Timer timer = new Timer(tempo, this);
    timer.start();
  }
  
  @Override
  public void actionPerformed(ActionEvent e) {
     adicionaCliente();
  }
}