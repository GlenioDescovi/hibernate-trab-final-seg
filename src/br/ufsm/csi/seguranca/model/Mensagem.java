package br.ufsm.csi.seguranca.model;

/**
 * Created by Glenio on 14/06/2018.
 */
public class Mensagem {

    private String estado;
    private String mensagem;

    public Mensagem(String estado, String mensagem) {
        this.estado = estado;
        this.mensagem = mensagem;
    }

    public Mensagem() {
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }

}
