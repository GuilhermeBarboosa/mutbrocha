package web.mutbrocha.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.data.web.SortDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import web.mutbrocha.model.*;
import web.mutbrocha.model.filter.ReservaFilter;
import web.mutbrocha.pagination.PageWrapper;
import web.mutbrocha.repository.ProdutoRepository;
import web.mutbrocha.repository.ReservaRepository;
import web.mutbrocha.repository.UserRepository;
import web.mutbrocha.service.ProdutoService;
import web.mutbrocha.service.ReservaProdutoService;
import web.mutbrocha.service.ReservaService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/reserva")
public class ReservaController {

    private static final Logger logger = LoggerFactory.getLogger(ReservaController.class);

    @Autowired
    private ReservaRepository reservaRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ProdutoRepository produtoRepository;

    @Autowired
    private ReservaProdutoService reservaProdutoService;

    @Autowired
    private ReservaService reservaService;

    @Autowired
    private ProdutoService produtoService;

    private Reservas buscarReservaNaSessao(HttpSession sessao) {
        Reservas reserva = (Reservas) sessao.getAttribute("reserva");
        if (reserva == null) {
            reserva = new Reservas();
        }
        return reserva;
    }

    private Produtos buscarProdutoNaSessao(HttpSession sessao) {
        Produtos produto = (Produtos) sessao.getAttribute("produto");
        if (produto == null) {
            produto = new Produtos();
        }
        return produto;
    }

    @GetMapping("/cadastrar")
    public String abrirCadastro(Reservas reservas, HttpSession sessao, Model model) {
        Reservas reserva = buscarReservaNaSessao(sessao);
        sessao.setAttribute("reserva", reserva);

        List<User> users = userRepository.findByStatus(Status.ATIVO);
        model.addAttribute("user", users);
        return "reservas/cadastrar";
    }

    @PostMapping("/cadastrar")
    public String cadastrar(Reservas reserva, HttpSession sessao) {
        reserva.setData_reserva(LocalDate.now());
        Reservas reservaSalva = reservaService.salvarComId(reserva);

//        Reservas reservaNaSessao = buscarReservaNaSessao(sessao);
//        reservaSalva.setUser(reserva.getUser());
        sessao.setAttribute("reserva", reservaSalva);


        return "redirect:/reserva/cadastro/sucesso";
    }

    @GetMapping("/cadastro/sucesso")
    public String mostrarMensagemCadastroSucesso(Model model, Produtos produtos, HttpSession sessao) {
        Reservas reservasSessao = (Reservas) sessao.getAttribute("reserva");


        List<Produtos> produtosList = produtoRepository.findByStatusAndSituacoes(Status.ATIVO, Situacoes.DISPONIVEL);

        model.addAttribute("listProdutos", produtosList);
        model.addAttribute("mensagem", "Cadastro de reserva de " + reservasSessao.getUser().getNome() + " efetuado com sucesso.");
        return "reservas/escolherproduto";
    }

    @PostMapping("/criarreservadoproduto")
    public String escolherProduto(Produtos produtos, HttpSession sessao, Model model) {

        if(produtos.getSituacao() != Situacoes.RESERVADO){
            ReservaProduto reservaProduto =  new ReservaProduto();
            reservaProduto.setProduto(produtos);
            reservaProduto.setReserva((Reservas) sessao.getAttribute("reserva"));

            produtos.setSituacao(Situacoes.RESERVADO);
            produtoService.alterar(produtos);

            reservaProdutoService.salvar(reservaProduto);

            String mensagem = "O " + reservaProduto.getReserva().getUser().getNome() + " reservou o produto " + reservaProduto.getProduto().getProduto();
            model.addAttribute("mensagem", mensagem);
            return "mostrarmensagem";
        }else{
            String mensagem = "O produto " + produtos.getProduto() +" já está reservado";
            model.addAttribute("mensagem", mensagem);
            return "mostrarmensagem";
        }
    }

    @GetMapping("/abrirpesquisar")
    public String abrirPesquisa(Model model) {
        List<User> users = userRepository.findByStatus(Status.ATIVO);
        model.addAttribute("users", users);
        return "reserva/pesquisar";
    }

    @GetMapping("/pesquisar")
    public String pesquisar(ReservaFilter filtro, Model model, @PageableDefault(size = 10) @SortDefault(sort = "id", direction = Sort.Direction.ASC) Pageable pageable, HttpServletRequest request) {

        Page<Reservas> pagina = reservaRepository.pesquisar(filtro, pageable);
        PageWrapper<Reservas> paginaWrapper = new PageWrapper<>(pagina, request);
        model.addAttribute("pagina", paginaWrapper);
        return "reservas/mostrartodas";
    }


    @PostMapping("/abriralterar")
    public String abrirAlterar(Reservas reservas, Model model) {
        List<User> users = userRepository.findByStatus(Status.ATIVO);
        model.addAttribute("users", users);
        return "reservas/alterar";
    }

    @PostMapping("/alterar")
    public String alterar(Reservas reservas) {
        reservaService.alterar(reservas);
        return "redirect:/produtos/alterar/sucesso";
    }

    @GetMapping("/alterar/sucesso")
    public String mostrarMensagemAlterarSucesso(Model model) {
        model.addAttribute("mensagem", "Alteração na reserva efetuada com sucesso.");
        return "mostrarmensagem";
    }

    @PostMapping("/abrirremover")
    public String abrirRemover(Reservas reservas) {
        return "reserva/remover";
    }

    @PostMapping("/remover")
    public String remover(Reservas reservas) {
        reservas.setStatus(Status.INATIVO);
        reservaService.alterar(reservas);
        return "redirect:/reserva/remover/sucesso";
    }

    @GetMapping("/remover/sucesso")
    public String mostrarMensagemRemoverSucesso(Model model) {
        model.addAttribute("mensagem", "Remoção (INATIVO) de reserva efetuada com sucesso.");
        return "mostrarmensagem";
    }
}
