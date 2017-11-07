void mouseWheel(MouseEvent event) {
  incZ += event.getCount();
}

void mouseDragged()
{
  incX += (mouseX - pmouseX);
  incY += (mouseY - pmouseY);
}

void mousePressed() {
  for (Caixa c : caixas)
  {
    if (mouseX > (c.x - c.tX/2) && mouseX < (c.x + c.tX/2) &&
      mouseY > (c.y - c.tY/2) && mouseY < (c.y + c.tY/2))
    {
      c.isFuncionando  = !c.isFuncionando;
    }
  }
  
   if(mouseY > width/2)
    {
      adicionaCliente();
    }
}