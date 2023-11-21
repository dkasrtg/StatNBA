import { Equipe } from "../models/Equipe";
import { Joueur } from "../models/Joueur";
import { StatEquipe } from "../models/StatEquipe";

// Données de test pour l'interface Equipe
const Equipes: Equipe[] = [
    { id: 1, nom: 'Lakers' },
    { id: 2, nom: 'Celtics' },
    { id: 3, nom: 'Warriors' },
    { id: 4, nom: 'Bulls' },
    { id: 5, nom: 'Spurs' },
    { id: 6, nom: 'Heat' },
    { id: 7, nom: 'Rockets' },
    { id: 8, nom: 'Clippers' },
    { id: 9, nom: 'Raptors' },
    { id: 10, nom: 'Mavericks' },
];

// Données de test pour l'interface Joueur
const Joueurs: Joueur[] = [
    { id: 1, idEquipe: 1, nom: 'LeBron James', numero: 23 },
    { id: 2, idEquipe: 1, nom: 'Anthony Davis', numero: 3 },
    { id: 3, idEquipe: 2, nom: 'Jayson Tatum', numero: 0 },
    { id: 4, idEquipe: 2, nom: 'Jaylen Brown', numero: 7 },
    { id: 5, idEquipe: 3, nom: 'Stephen Curry', numero: 30 },
    { id: 6, idEquipe: 3, nom: 'Klay Thompson', numero: 11 },
    { id: 7, idEquipe: 4, nom: 'Michael Jordan', numero: 23 },
    { id: 8, idEquipe: 4, nom: 'Scottie Pippen', numero: 33 },
    { id: 9, idEquipe: 5, nom: 'Tim Duncan', numero: 21 },
    { id: 10, idEquipe: 5, nom: 'Manu Ginobili', numero: 20 },
];

// Données de test pour l'interface StatEquipe
const StatEquipes: StatEquipe[] = [
{
    equipe: Equipes[0],
    joueur: Joueurs[0],
    M: 20,
    MJ: 15,
    PPM: 25,
    RPM: 10,
    PDPM: 5,
    MPM: 30,
    EFF: 40,
    'FG%': 50,
    '3P%': 35,
    '%LF': 80,
},
{
    equipe: Equipes[1],
    joueur: Joueurs[2],
    M: 18,
    MJ: 12,
    PPM: 22,
    RPM: 8,
    PDPM: 4,
    MPM: 28,
    EFF: 36,
    'FG%': 48,
    '3P%': 32,
    '%LF': 78,
},
{
    equipe: Equipes[2],
    joueur: Joueurs[4],
    M: 22,
    MJ: 18,
    PPM: 28,
    RPM: 12,
    PDPM: 6,
    MPM: 35,
    EFF: 45,
    'FG%': 52,
    '3P%': 38,
    '%LF': 82,
},
];

export { Equipes, Joueurs, StatEquipes };
