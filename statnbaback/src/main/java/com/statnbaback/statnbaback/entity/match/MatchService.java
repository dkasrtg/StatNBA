package com.statnbaback.statnbaback.entity.match;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MatchService {
    @Autowired
    private MatchRepository matchRepository;

    public Match create(Match match){
        return matchRepository.save(match);
    }

}
