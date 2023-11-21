package com.statnbaback.statnbaback.entity.typeaction;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TypeActionRepository extends JpaRepository<TypeAction,Integer> {
    
}
