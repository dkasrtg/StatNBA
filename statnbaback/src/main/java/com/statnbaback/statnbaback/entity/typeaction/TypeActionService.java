package com.statnbaback.statnbaback.entity.typeaction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TypeActionService {
    @Autowired
    private TypeActionRepository typeActionRepository;

    public TypeAction create(TypeAction typeAction){
        return typeActionRepository.save(typeAction);
    }

    public List<TypeAction> list(){
        return typeActionRepository.findAll();
    }
}
