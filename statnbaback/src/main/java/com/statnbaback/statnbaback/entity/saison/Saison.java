package com.statnbaback.statnbaback.entity.saison;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Saison {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private Integer anneeDebut;
    private Integer anneeFin;
    public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public Integer getAnneeDebut() {
        return anneeDebut;
    }
    public void setAnneeDebut(Integer anneeDebut) {
        this.anneeDebut = anneeDebut;
    }
    public Integer getAnneeFin() {
        return anneeFin;
    }
    public void setAnneeFin(Integer anneeFin) {
        this.anneeFin = anneeFin;
    }
    
}
