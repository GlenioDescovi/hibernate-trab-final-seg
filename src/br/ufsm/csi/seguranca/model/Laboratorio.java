package br.ufsm.csi.seguranca.model;

import javax.persistence.*;

/**
 * Created by Glenio on 14/06/2018.
 */
@Entity
@Table(name = "LABORATORIO")
public class Laboratorio {

    private Long idLaboratorio;
    private String razaoSocial;
    private String cnpj;
    private Usuario representanteLab;
    private Endereco endereco;

    public Laboratorio(Long idLaboratorio, String razaoSocial, String cnpj, Usuario representanteLab, Endereco endereco) {
        this.idLaboratorio = idLaboratorio;
        this.razaoSocial = razaoSocial;
        this.cnpj = cnpj;
        this.representanteLab = representanteLab;
        this.endereco = endereco;
    }

    public Laboratorio() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_lab")
    @SequenceGenerator(name = "seq_lab", sequenceName = "seq_lab")
    @Column(name = "ID_LABORATORIO")
    public Long getIdLaboratorio() {
        return idLaboratorio;
    }

    public void setIdLaboratorio(Long idLaboratorio) {
        this.idLaboratorio = idLaboratorio;
    }

    @Column(name = "RAZAO_SOCIAL", length = 100)
    public String getRazaoSocial() {
        return razaoSocial;
    }

    public void setRazaoSocial(String razaoSocial) {
        this.razaoSocial = razaoSocial;
    }

    @Column(name = "CNPJ", length = 100)
    public String getCnpj() {
        return cnpj;
    }

    public void setCnpj(String cnpj) {
        this.cnpj = cnpj;
    }

    @ManyToOne
    @JoinColumn(columnDefinition = "ID_USUARIO")
    public Usuario getRepresentanteLab() {
        return representanteLab;
    }

    public void setRepresentanteLab(Usuario representanteLab) {
        this.representanteLab = representanteLab;
    }

    @ManyToOne
    @JoinColumn(columnDefinition = "ID_ENDERECO")
    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }
}
