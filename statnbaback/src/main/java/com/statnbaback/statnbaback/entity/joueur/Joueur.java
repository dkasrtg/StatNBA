package com.statnbaback.statnbaback.entity.joueur;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Joueur {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String nom;
    private Integer numero;
    private Integer idEquipe;
    private String image;
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getNom() {
        return nom;
    }
    public void setNom(String nom) {
        this.nom = nom;
    }
    public Integer getNumero() {
        return numero;
    }
    public void setNumero(Integer numero) {
        this.numero = numero;
    }
    public Integer getIdEquipe() {
        return idEquipe;
    }
    public void setIdEquipe(Integer idEquipe) {
        this.idEquipe = idEquipe;
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }        
}
