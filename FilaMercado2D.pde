import java.util.List;
List<Caixa> caixas;

void setup() {
  size(1024, 768); 
  noStroke();
  caixas = new ArrayList<Caixa>();
  
  int distCaixa = 70;
  int qtdCaixas = 6;
  
  for(int i=0; i<qtdCaixas; i++)
  {
     Caixa c = new Caixa();
     c.x = (height/qtdCaixas) + (c.tX * i) + (distCaixa * i);
     c.y = (width/4);
     caixas.add(c);
  }
  
  background(51);
  
  caixas.get(0).isFuncionando = true;
  caixas.get(0).tempoAtendimento = 5000;
  caixas.get(0).atende();
   
  for(Caixa c: caixas)
  {
    c.desenhaCaixa();
  }
   
  fill(0,255,0);
  ellipse(caixas.get(0).x + caixas.get(0).tX/2 + 20, caixas.get(0).y, 20,20);
  
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