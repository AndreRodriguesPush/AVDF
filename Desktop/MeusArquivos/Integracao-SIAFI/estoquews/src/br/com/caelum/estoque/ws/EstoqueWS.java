package br.com.caelum.estoque.ws;


import java.util.List;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
//import javax.xml.ws.RequestWrapper;
//import javax.xml.ws.ResponseWrapper;

import br.com.caelum.estoque.modelo.item.Filtro;
import br.com.caelum.estoque.modelo.item.Filtros;
import br.com.caelum.estoque.modelo.item.Item;
import br.com.caelum.estoque.modelo.item.ItemDao;
import br.com.caelum.estoque.modelo.item.ListaItens;
import br.com.caelum.estoque.modelo.usuario.AutorizationException;
import br.com.caelum.estoque.modelo.usuario.TokenDao;
import br.com.caelum.estoque.modelo.usuario.TokenUsuario;


@WebService
public class EstoqueWS {
	
	private ItemDao dao = new ItemDao();

	
	@WebMethod(operationName="TodosOsItens")
	@WebResult(name="itens")	
	public ListaItens getItens(@WebParam(name="filtros")Filtros filtros){		
		  List<Filtro>listaFiltros = filtros.getLista();
		  List<Item>lista = dao.todosItens(listaFiltros);

		  return new ListaItens(lista);		
	}
	
	@WebMethod(operationName="CadastrarItem")
	@WebResult(name="item")
	public Item cadastrarItem(
			@WebParam(name="tokenusuario", header=true) TokenUsuario token, 
			@WebParam(name="item")Item item) 
					throws AutorizationException {
		
		System.out.println("Cadastrando Item " + item + ", Token:" +token);
		
		boolean valido = new TokenDao().ehValido(token);
		
		if(!valido) {
			throw new AutorizationException("Autorização Falhou !");
		}
		
		this.dao.cadastrar(item);
		
		return item;
	}
}
