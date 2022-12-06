package web.mutbrocha.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import web.mutbrocha.service.RelatorioService;


@Controller
@RequestMapping("/print")
public class RelatoriosController {
	
private static final Logger logger = LoggerFactory.getLogger(RelatoriosController.class);
	
	@Autowired
	private RelatorioService relatorioService;
	
	@GetMapping("/simples")
	public ResponseEntity<byte[]> gerarRelatorioSimplesTodasReservas() {

		byte[] relatorio = relatorioService.gerarRelatorioSimplesTodasReservas();
		
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=ReservasSimples.pdf")
				.body(relatorio);
	}
	
	@GetMapping("/porusuario")
	public ResponseEntity<byte[]> gerarRelatorioComplexoTodasReservasPorUsuario() {

		byte[] relatorio = relatorioService.gerarRelatorioComplexoTodasReservasPorUsuario();

		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_PDF_VALUE)
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=ReservasPorUsuario.pdf")
				.body(relatorio);
	}


}