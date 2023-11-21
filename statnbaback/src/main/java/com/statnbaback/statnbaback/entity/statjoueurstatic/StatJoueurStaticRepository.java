package com.statnbaback.statnbaback.entity.statjoueurstatic;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StatJoueurStaticRepository extends JpaRepository<StatJoueurStatic,Integer> {

}
