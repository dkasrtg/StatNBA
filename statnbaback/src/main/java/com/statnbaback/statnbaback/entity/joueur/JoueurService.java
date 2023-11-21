package com.statnbaback.statnbaback.entity.joueur;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class JoueurService {
    @Autowired
    private JoueurRepository joueurRepository;

    public Joueur create(Joueur joueur){
        return joueurRepository.save(joueur);
    }

    public List<Joueur> list(){
        return joueurRepository.findAll();
    }   
}
