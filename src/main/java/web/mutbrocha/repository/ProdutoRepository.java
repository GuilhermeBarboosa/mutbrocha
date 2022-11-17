package web.mutbrocha.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import web.mutbrocha.model.Categorias;
import web.mutbrocha.model.Produtos;
import web.mutbrocha.model.Status;
import web.mutbrocha.repository.helper.categoria.CategoriaQueries;
import web.mutbrocha.repository.helper.produto.ProdutoQueries;


public interface ProdutoRepository extends JpaRepository<Produtos, Long>, ProdutoQueries {

	List<Produtos> findByStatus(Status ativo);

}
