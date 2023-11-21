package com.statnbaback.statnbaback.entity.statjoueurstatic;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatJoueurStaticService {
    @Autowired
    private StatJoueurStaticRepository statJoueurStaticRepository;

    public List<StatJoueurStatic> list(){
        return statJoueurStaticRepository.findAll();
    }

    public StatJoueurStatic findById(Integer id){
        return statJoueurStaticRepository.findById(id).orElse(null);
    }
}
