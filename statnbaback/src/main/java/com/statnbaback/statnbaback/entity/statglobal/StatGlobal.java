package com.statnbaback.statnbaback.entity.statglobal;

import com.statnbaback.statnbaback.entity.statjoueurdynamic.StatJoueurDynamic;
import com.statnbaback.statnbaback.entity.statjoueurstatic.StatJoueurStatic;

public class StatGlobal {
    private StatJoueurStatic statJoueurStatic;
    private StatJoueurDynamic statJoueurDynamic;
    public StatJoueurStatic getStatJoueurStatic() {
        return statJoueurStatic;
    }
    public void setStatJoueurStatic(StatJoueurStatic statJoueurStatic) {
        this.statJoueurStatic = statJoueurStatic;
    }
    public StatJoueurDynamic getStatJoueurDynamic() {
        return statJoueurDynamic;
    }
    public void setStatJoueurDynamic(StatJoueurDynamic statJoueurDynamic) {
        this.statJoueurDynamic = statJoueurDynamic;
    }
    
}
