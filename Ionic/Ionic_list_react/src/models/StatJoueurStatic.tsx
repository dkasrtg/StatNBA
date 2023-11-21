import { Equipe } from "../models/Equipe";
import { Joueur } from "../models/Joueur";

export interface StatJoueurStatic {
    idJoueur:           string,
    nomJoueur:          string,
    idEquipe:           string,
    nomEquipe:          string,
    nombreMatchEquipe:  string,        
    nombreMatchJoueur:  string,        
    imageJoueur:        string,    
}