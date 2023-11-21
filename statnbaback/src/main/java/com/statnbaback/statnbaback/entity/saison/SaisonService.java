package com.statnbaback.statnbaback.entity.saison;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SaisonService {
    @Autowired
    private SaisonRepository saisonRepository;

    public Saison create(Saison saison){
        return saisonRepository.save(saison);
    }

    public List<Saison> list(){
        return saisonRepository.findAll();
    }
}
