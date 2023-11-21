package com.statnbaback.statnbaback.entity.equipe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EquipeService {
    @Autowired
    private EquipeRepository equipeRepository;

    public Equipe create(Equipe equipe){
        return equipeRepository.save(equipe);
    }

    public List<Equipe> list(){
        return equipeRepository.findAll();
    }
}
