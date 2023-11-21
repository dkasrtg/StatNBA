package com.statnbaback.statnbaback.entity.statjoueurstatic;

import org.hibernate.annotations.Immutable;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

@Entity
@Immutable
public class StatJoueurStatic {
    @Id
    private Integer idJoueur;
    private String nomJoueur;
    private Integer idEquipe;
    private String nomEquipe;
    private Integer nombreMatchEquipe;
    private Integer nombreMatchJoueur;
    
    public Integer getIdJoueur() {
        return idJoueur;
    }
    public void setIdJoueur(Integer idJoueur) {
        this.idJoueur = idJoueur;
    }
    public String getNomJoueur() {
        return nomJoueur;
    }
    public void setNomJoueur(String nomJoueur) {
        this.nomJoueur = nomJoueur;
    }
    public Integer getIdEquipe() {
        return idEquipe;
    }
    public void setIdEquipe(Integer idEquipe) {
        this.idEquipe = idEquipe;
    }
    public String getNomEquipe() {
        return nomEquipe;
    }
    public void setNomEquipe(String nomEquipe) {
        this.nomEquipe = nomEquipe;
    }
    public Integer getNombreMatchEquipe() {
        return nombreMatchEquipe;
    }
    public void setNombreMatchEquipe(Integer nombreMatchEquipe) {
        this.nombreMatchEquipe = nombreMatchEquipe;
    }
    public Integer getNombreMatchJoueur() {
        return nombreMatchJoueur;
    }
    public void setNombreMatchJoueur(Integer nombreMatchJoueur) {
        this.nombreMatchJoueur = nombreMatchJoueur;
    }
    
}
