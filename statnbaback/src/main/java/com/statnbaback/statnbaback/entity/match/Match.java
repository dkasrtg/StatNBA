package com.statnbaback.statnbaback.entity.match;

import java.time.LocalDate;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Match {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nom;
    private Integer idEquipeA;
    private Integer idEquipeB;
    private LocalDate date;
    private Integer idSaison;

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

    public Integer getIdEquipeA() {
        return idEquipeA;
    }

    public void setIdEquipeA(Integer idEquipeA) {
        this.idEquipeA = idEquipeA;
    }

    public Integer getIdEquipeB() {
        return idEquipeB;
    }

    public void setIdEquipeB(Integer idEquipeB) {
        this.idEquipeB = idEquipeB;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Integer getIdSaison() {
        return idSaison;
    }

    public void setIdSaison(Integer idSaison) {
        this.idSaison = idSaison;
    }

}
