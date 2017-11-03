import java.util.List;
List<Caixa> caixas;
List<Cliente> clientes;

void setup() {
  size(1024, 768); 
  noStroke();
  caixas = new ArrayList<Caixa>();
  clientes = new ArrayList<Cliente>();
  
  int distCaixa = 70;
  int qtdCaixas = 7;
  
  for(int i=0; i<qtdCaixas; i++)
  {
     Caixa c = new Caixa();
     c.x = (height/qtdCaixas) + (c.tX * i) + (distCaixa * i);
     c.y = (width/4);
     caixas.add(c);
  }
  
  Cliente cliente = new Cliente();
  cliente.x = caixas.get(0).x + caixas.get(0).tX/2 + cliente.tX;
  cliente.y = caixas.get(0).y;
  
  Cliente cliente2 = new Cliente();
  cliente2.x = caixas.get(2).x + caixas.get(2).tX/2 + cliente.tX;
  cliente2.y = caixas.get(2).y;
  
  background(80);
  
  caixas.get(0).isFuncionando = true;
  caixas.get(0).tempoAtendimento = 5000;
  caixas.get(0).atende();
   
  for(Caixa c: caixas)
  {
    c.desenhaCaixa();
  }
   
  fill(255,150,0);

  cliente.desenha();
  cliente2.desenha();  
}

void draw() { 
  for(Caixa c: caixas)
  {
    c.desenhaAtendente();
  } 
  caixas.get(0).atende();
}

void mousePressed() {
    for(Caixa c: caixas)
    {
      if(mouseX > (c.x - c.tX/2) && mouseX < (c.x + c.tX/2) &&
         mouseY > (c.y - c.tY/2) && mouseY < (c.y + c.tY/2))
      {
        c.isFuncionando  = !c.isFuncionando; 
      }
    }
}