void andaParaCaixa(Cliente cl, Caixa c)
{ 
  verificaColisaoClientes();
  if (cl.isAndaX)
  {
    if (cl.getBordaEsquerda() < c.getBordaDireita() + distCaixaClient)
    {
      //if(!isColisao(clientes.get(0), clientes.get(1)))
      {
        cl.x = cl.x + vel;
      }
    } else if (abs(cl.getBordaEsquerda() - c.getBordaDireita()) < distCaixaClient + vel)
    {
      cl.isAndaX = false;
    } else
    {
      //if(!isColisao(clientes.get(0), clientes.get(1)))
      {
        cl.x = cl.x - vel;
      }
    }
  }
  if (cl.isAndaY)
  {
    if (cl.y > c.y)
    {
      if (!isColisaoCaixa(c, cl))
      {
        if (!cl.isColisao)
        {
          cl.y = cl.y - vel;
        }
      }
    } 
    else if (cl.y < c.y)
    {
      if (!isColisaoCaixa(c, cl))
      {
        if (!cl.isColisao)
        {
          cl.y = cl.y + vel;
        }
      }
    }
    if (abs(cl.y - c.y) < vel+1)
    {
      cl.isAndaY = false;
    }
  }
}

void andaFora()
{
  Queue <Cliente> terminados = new LinkedList();
  
  for(Cliente c: clientes){
    if(c.isAtendido && c.y > 0)
    {
      c.y = c.y -1;
    }
    if(c.isAtendido && c.y == 0)
    {
       c.isTerminado = true;
       terminados.add(c);
    }
  }
  
  for(Cliente c: terminados)
  {
    clientes.remove(c);
  }
}

boolean isColisaoCaixa(AbstractObjeto a, AbstractObjeto b)
{
  if (abs(b.getBordaEsquerda() - a.getBordaDireita()) <= distCaixaClient + vel)
  {
    return false;
  }

  if (a.getBordaInferior() > b.getBordaSuperior() && a.getBordaSuperior() < b.getBordaInferior())
  {
    return true;
  } else
  {
    return false;
  }
}

void verificaColisaoClientes()
{
  for (Cliente a : clientes)
  {
    for (Cliente b : clientes)
    {
      if (a == b)
      {
        continue;
      }

      if (abs(a.y - b.y) < ((a.tY + b.tY)/2) + distCaixaClient && abs(a.x - b.x) < 1)
      {
        //a.isColisao = true;
        break;
      } else
      {
        a.isColisao = false;
      }

      if (abs(a.x - b.x) < 5 && abs(a.y - b.y)<5)
      {
        a.y = a.y + a.tY*2;
      }
    }
  }
}

//abs(b.getBordaEsquerda() - a.getBordaDireita()) >= 1  
//abs(a.getBordaEsquerda() - b.getBordaDireita()) >= 1 

/*boolean isColisaoVetical(AbstractObjeto a, AbstractObjeto b)
 {
 if((b.x - b.tX) > (a.x + a.tX/2) && b.x - b.tX <= a.x + (a.tX/2) + (b.tX/2))
 {
 return false;
 }
 
 if((b.y + b.tY/2) > (a.y - a.tY/2) && (b.y - b.tY*3) < (a.y + a.tY/2))
 {
 return true;
 }
 else
 {
 return false;
 }
 }*/