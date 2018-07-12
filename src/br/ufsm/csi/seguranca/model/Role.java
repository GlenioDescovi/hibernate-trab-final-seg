package br.ufsm.csi.seguranca.model;

import javax.persistence.*;

/**
 * Created by Glenio on 12/06/2018.
 */
@Entity
@Table(name = "ROLES")
public class Role {

    private int id_role;
    private String role;

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_role")
    @SequenceGenerator(name = "seq_role", sequenceName = "seq_role")
    @Column(name = "ID_ROLE")
    public int getId_role() {
        return id_role;
    }

    public void setId_role(int id_role) {
        this.id_role = id_role;
    }

    @Column(name = "NOME_ROLE", length = 20)
    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
