package com.statnbaback.statnbaback.entity.statjoueurdynamic;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.statnbaback.statnbaback.entity.typeaction.TypeAction;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.Query;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class StatJoueurDynamicService {
    @PersistenceContext
    private EntityManager entityManager;

    public List<StatJoueurDynamic> list(List<TypeAction> typeActions) {
        String subquery = "";
        for (int i = 0; i < typeActions.size() - 1; i++) {
            subquery += "AVG(CASE WHEN ta.reference = '" + typeActions.get(i).getReference()
                    + "' THEN a.valeur END) AS \"" + typeActions.get(i).getReference() + "\", ";
        }
        subquery += "AVG(CASE WHEN ta.reference = '" + typeActions.get(typeActions.size() - 1).getReference()
                + "' THEN a.valeur END) AS \""
                + typeActions.get(typeActions.size() - 1).getReference() + "\" ";
        String allquery = "SELECT " +
                "id_joueur, " +
                subquery +
                "FROM \"action\" a " +
                "JOIN type_action ta ON a.id_type_action = ta.id " +
                "GROUP BY id_joueur " +
                "ORDER BY \"ppm\" DESC";
        Query query = entityManager.createNativeQuery(allquery);
        List<Object[]> resultList = query.getResultList();
        List<StatJoueurDynamic> statJoueurDynamics = new ArrayList<>();
        for (Object[] result : resultList) {
            Integer id_joueur = (Integer) result[0];
            List<Double> values = new ArrayList<>();
            for (int i = 1; i < result.length; i++) {
                Double value = (Double) result[i];
                values.add(value);
            }
            StatJoueurDynamic statJoueurDynamic = new StatJoueurDynamic();
            statJoueurDynamic.setIdJoueur(id_joueur);
            statJoueurDynamic.setTypeActionValue(values);
            statJoueurDynamics.add(statJoueurDynamic);
        }
        return statJoueurDynamics;
    }
}
