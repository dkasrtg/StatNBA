package com.statnbaback.statnbaback.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.statnbaback.statnbaback.entity.action.Action;
import com.statnbaback.statnbaback.entity.action.ActionService;

@RestController
@RequestMapping("/api/action")
@CrossOrigin
public class ActionController {
    @Autowired
    private ActionService actionService;


    @PostMapping
    public ResponseEntity<Object> create(@RequestBody Action action){
        return ResponseEntity.ok(actionService.create(action));
    }
}
