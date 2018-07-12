package br.ufsm.csi.seguranca.model;

import javax.persistence.*;

/**
 * Created by Glenio on 14/06/2018.
 */
@Entity
@Table(name = "ENDERECO")
public class Endereco {

    private Long id_endereco;
    private String uf;
    private String cidade;
    private String bairro;
    private String rua;
    private int numero;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_endereco")
    @SequenceGenerator(name = "seq_endereco", sequenceName = "seq_endereco")
    @Column(name = "ID_ENDERECO")
    public Long getId_endereco() {
        return id_endereco;
    }

    public void setId_endereco(Long id_endereco) {
        this.id_endereco = id_endereco;
    }

    @Column(name = "UF", length = 100)
    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    @Column(name = "CIDADE", length = 100)
    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    @Column(name = "BAIRRO", length = 100)
    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    @Column(name = "RUA", length = 100)
    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    @Column(name = "NUMERO", length = 100)
    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }
}
