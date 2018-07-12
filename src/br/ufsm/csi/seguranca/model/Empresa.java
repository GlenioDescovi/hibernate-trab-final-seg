package br.ufsm.csi.seguranca.model;

import javax.persistence.*;

/**
 * Created by Glenio on 14/06/2018.
 */
@Entity
@Table(name = "EMPRESA")
public class Empresa {

    private Long idEmpresa;
    private String razaoSocial;
    private String cnpj;
    private Usuario representanteEmpresa;
    private Endereco endereco;

    public Empresa(Long idEmpresa, String razaoSocial, String cnpj, Usuario representanteEmpresa, Endereco endereco) {
        this.idEmpresa = idEmpresa;
        this.razaoSocial = razaoSocial;
        this.cnpj = cnpj;
        this.representanteEmpresa = representanteEmpresa;
        this.endereco = endereco;
    }

    public Empresa() {
    }

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_empresa")
    @SequenceGenerator(name = "seq_empresa", sequenceName = "seq_empresa")
    @Column(name = "ID_EMPRESA")
    public Long getIdEmpresa() {
        return idEmpresa;
    }

    public void setIdEmpresa(Long idEmpresa) {
        this.idEmpresa = idEmpresa;
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
    public Usuario getRepresentanteEmpresa() {
        return representanteEmpresa;
    }

    public void setRepresentanteEmpresa(Usuario representanteEmpresa) {
        this.representanteEmpresa = representanteEmpresa;
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
