package com.statnbaback.statnbaback.entity.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ActionService {
    @Autowired
    private ActionRepository actionRepository;

    public Action create(Action action){
        return actionRepository.save(action);
    }

    public List<Action> list(){
        return actionRepository.findAll();
    }
}
