package web.mutbrocha.model.filter;

import java.time.LocalDate;

public class ReservaProdutoFilter {

	private Long id;
	private Long reserva;
	private Long produto;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getReserva() {
		return reserva;
	}

	public void setReserva(Long reserva) {
		this.reserva = reserva;
	}

	public Long getProduto() {
		return produto;
	}

	public void setProduto(Long produto) {
		this.produto = produto;
	}

	@Override
	public String toString() {
		return "ReservaProdutoFilter{" +
				"id=" + id +
				", reserva=" + reserva +
				", produto=" + produto +
				'}';
	}
}
