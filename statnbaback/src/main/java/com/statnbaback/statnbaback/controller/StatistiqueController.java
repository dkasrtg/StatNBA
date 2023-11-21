package com.statnbaback.statnbaback.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.statnbaback.statnbaback.entity.statglobal.StatGlobalService;

@RestController
@RequestMapping("/api/statglobal")
@CrossOrigin
public class StatistiqueController {

    @Autowired
    private StatGlobalService statGlobalService;

    @GetMapping
    public ResponseEntity<Object> getAll() {
        return ResponseEntity.ok(statGlobalService.list());
    }
}
