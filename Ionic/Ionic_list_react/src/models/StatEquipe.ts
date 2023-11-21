import { Equipe } from "../models/Equipe";
import { Joueur } from "../models/Joueur";
import { StatJoueurStatic } from "./StatJoueurStatic";
import { StatJoueurDynamic } from "./StatJoueurDynamic";

export interface StatEquipe {
    statJoueurStatic: StatJoueurStatic,
    statJoueurDynamic: StatJoueurDynamic,
}