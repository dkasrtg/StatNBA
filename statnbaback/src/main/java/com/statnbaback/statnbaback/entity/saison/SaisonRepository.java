package com.statnbaback.statnbaback.entity.saison;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface SaisonRepository extends JpaRepository<Saison,Integer> {
    
}
