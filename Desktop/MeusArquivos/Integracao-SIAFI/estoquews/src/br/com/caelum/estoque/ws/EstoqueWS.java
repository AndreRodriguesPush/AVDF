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
	public Item cadastrarItem(@WebParam(name="filtros")Item item) {	
		System.out.println("Cadastrando Item " + item);
		this.dao.cadastrar(item);
		
		return item;
	}
}
