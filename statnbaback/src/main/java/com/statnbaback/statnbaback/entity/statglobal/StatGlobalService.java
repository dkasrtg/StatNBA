package com.statnbaback.statnbaback.entity.statglobal;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.statnbaback.statnbaback.entity.statjoueurdynamic.StatJoueurDynamic;
import com.statnbaback.statnbaback.entity.statjoueurdynamic.StatJoueurDynamicService;
import com.statnbaback.statnbaback.entity.statjoueurstatic.StatJoueurStatic;
import com.statnbaback.statnbaback.entity.statjoueurstatic.StatJoueurStaticService;
import com.statnbaback.statnbaback.entity.typeaction.TypeAction;
import com.statnbaback.statnbaback.entity.typeaction.TypeActionService;

@Service
public class StatGlobalService {
    @Autowired
    private TypeActionService typeActionService;

    @Autowired
    private StatJoueurDynamicService statJoueurDynamicService;

    @Autowired
    private StatJoueurStaticService statJoueurStaticService;

    public List<StatGlobal> list(){
        List<StatJoueurStatic> statJoueurStatics = statJoueurStaticService.list();
        List<TypeAction> typeActions = typeActionService.list();
        List<StatJoueurDynamic> statJoueurDynamics = statJoueurDynamicService.list(typeActions);
        List<StatGlobal> statGlobals = new ArrayList<>();
        for (StatJoueurDynamic statJoueurDynamic : statJoueurDynamics) {
            for (StatJoueurStatic statJoueurStatic : statJoueurStatics) {
                if (statJoueurDynamic.getIdJoueur()==statJoueurStatic.getIdJoueur()) {
                    StatGlobal statGlobal = new StatGlobal();
                    statGlobal.setStatJoueurDynamic(statJoueurDynamic);
                    statGlobal.setStatJoueurStatic(statJoueurStatic);
                    statGlobals.add(statGlobal);
                }
            }
        }
        return statGlobals;
    }

    public List<StatGlobal> findByIdEquipe(Integer idEquipe){
        List<StatJoueurStatic> statJoueurStatics = statJoueurStaticService.findByIdEquipe(idEquipe);
        List<TypeAction> typeActions = typeActionService.list();
        List<StatJoueurDynamic> statJoueurDynamics = statJoueurDynamicService.findByIdEquipe(typeActions,idEquipe);
        List<StatGlobal> statGlobals = new ArrayList<>();
        for (StatJoueurDynamic statJoueurDynamic : statJoueurDynamics) {
            for (StatJoueurStatic statJoueurStatic : statJoueurStatics) {
                if (statJoueurDynamic.getIdJoueur()==statJoueurStatic.getIdJoueur()) {
                    StatGlobal statGlobal = new StatGlobal();
                    statGlobal.setStatJoueurDynamic(statJoueurDynamic);
                    statGlobal.setStatJoueurStatic(statJoueurStatic);
                    statGlobals.add(statGlobal);
                }
            }
        }
        return statGlobals;
    }
}
