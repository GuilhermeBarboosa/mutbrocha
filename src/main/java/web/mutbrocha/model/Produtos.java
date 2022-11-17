package web.mutbrocha.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.DynamicUpdate;

@Entity
@Table(name = "produtos")
@DynamicUpdate
public class Produtos implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id
	@SequenceGenerator(name="gerador1", sequenceName="produtos_id_seq", allocationSize=1)
	@GeneratedValue(generator="gerador1", strategy=GenerationType.SEQUENCE)
	private Long id;
	
	private String produto;
	
	private String img;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "categoria")
	private Categorias categorias;
	
	@Enumerated(EnumType.STRING)
	private Situacoes situacao = Situacoes.DISPONIVEL;
	
	@Enumerated(EnumType.STRING)
	private Status status = Status.ATIVO;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProduto() {
		return produto;
	}

	public void setProduto(String produto) {
		this.produto = produto;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Categorias getCategorias() {
		return categorias;
	}

	public void setCategorias(Categorias categorias) {
		this.categorias = categorias;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	@Override
	public int hashCode() {
		return Objects.hash(categorias, id, img, produto, status);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Produtos other = (Produtos) obj;
		return Objects.equals(categorias, other.categorias) && Objects.equals(id, other.id)
				&& Objects.equals(img, other.img) && Objects.equals(produto, other.produto) && status == other.status;
	}

	@Override
	public String toString() {
		return "Produtos [id=" + id + ", produto=" + produto + ", img=" + img + ", categorias=" + categorias
				+ ", status=" + status + "]";
	}

}
