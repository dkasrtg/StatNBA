package com.statnbaback.statnbaback.entity.statjoueurdynamic;

import java.util.List;

public class StatJoueurDynamic {
    private Integer idJoueur;
    private List<Double> typeActionValue;
    public Integer getIdJoueur() {
        return idJoueur;
    }
    public void setIdJoueur(Integer idJoueur) {
        this.idJoueur = idJoueur;
    }
    public List<Double> getTypeActionValue() {
        return typeActionValue;
    }
    public void setTypeActionValue(List<Double> typeActionValue) {
        this.typeActionValue = typeActionValue;
    }
    
    
}
