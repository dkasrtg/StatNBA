package com.statnbaback.statnbaback.entity.action;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Action {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer idTypeAction;
    private Integer idMatch;
    private Integer idJoueur;
    private Double valeur;
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getIdTypeAction() {
        return idTypeAction;
    }
    public void setIdTypeAction(Integer idTypeAction) {
        this.idTypeAction = idTypeAction;
    }
    public Integer getIdMatch() {
        return idMatch;
    }
    public void setIdMatch(Integer idMatch) {
        this.idMatch = idMatch;
    }
    public Integer getIdJoueur() {
        return idJoueur;
    }
    public void setIdJoueur(Integer idJoueur) {
        this.idJoueur = idJoueur;
    }
    public Double getValeur() {
        return valeur;
    }
    public void setValeur(Double valeur) {
        this.valeur = valeur;
    }
    
}
