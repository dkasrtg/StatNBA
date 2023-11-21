package com.statnbaback.statnbaback.entity.statjoueurstatic;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StatJoueurStaticRepository extends JpaRepository<StatJoueurStatic,Integer> {
    List<StatJoueurStatic> findByIdEquipe(Integer idEquipe);
}
