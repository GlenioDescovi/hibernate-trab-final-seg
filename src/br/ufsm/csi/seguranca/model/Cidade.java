package br.ufsm.csi.seguranca.model;

import javax.persistence.*;

/**
 * Created by Glenio on 12/07/2018.
 */
@Entity
@Table(name = "CidadeAtua")
public class Cidade {

    private Long idCidade;
    private String Nome;
    private Empresa empresa;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_cidade")
    @SequenceGenerator(name = "seq_cidade", sequenceName = "seq_cidade")
    @Column(name = "ID_CIDADE")
    public Long getIdCidade() {
        return idCidade;
    }

    public void setIdCidade(Long idCidade) {
        this.idCidade = idCidade;
    }

    @Column(name = "NOME_CIDADE", length = 30)
    public String getNome() {
        return Nome;
    }

    public void setNome(String nome) {
        Nome = nome;
    }

    @ManyToOne
    @JoinColumn(columnDefinition = "ID_EMPRESA")
    public Empresa getEmpresa() {
        return empresa;
    }

    public void setEmpresa(Empresa empresa) {
        this.empresa = empresa;
    }
}
