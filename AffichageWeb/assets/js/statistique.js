
// a row template
function getStatRow(classement, photoJoueur, nomJoueur, equipe, M, MJ, PPM, RPM, PDPM, MPM, EFF, FG, threeP, LF) {
    return `
            <td>
                <div>` + classement + `</div>
            </td>
            <td>
                <div class="d-flex profile align-items-center justify-content-left">
                    <img src="./assets/images/joueurs/` + photoJoueur + `.webp  " class="profile-img" alt="Image du Joueur">
                    <span>`+ nomJoueur + `</span>
                </div>
            </td>
            <td>
                <div>` + equipe + `</div>
            </td>
            <td>
                <div>` + M + `</div>
            </td>
            <td>
                <div>` + MJ + `</div>
            </td>
            <td>
                <div>` + PPM + `</div>
            </td>
            <td>
                <div>` + RPM + `</div>
            </td>
            <td>
                <div>` + PDPM + `</div>
            </td>
            <td>
                <div>` + MPM + `</div>
            </td>
            <td>
                <div>` + EFF + `</div>
            </td>
            <td>
                <div>` + FG + `</div>
            </td>
            <td>
                <div>` + threeP + `</div>
            </td>
            <td>
                <div>` + LF + `</div>
            </td>
    `;
}

// Prendre les données depuis la reponse
function getResponseData(response) {
    if (response.messages == "SUCCESS") {
        return response.data;
    } throw new Error(response.message);
}

// Fonction pour avoir les données en utilisant fetch
function getStatistiques() {
    console.log("FETCHING ALL DATA ...");

    // URL de l'API source des statistiques et l'entete du requete
    const url = "http://statnba-production.up.railway.app/api/statglobal";

    // Faire l'appel
    fetch(url)
        .then(response => {
            return response.json();     // We should convert the response to json
        })
        .then(data => {
            console.log(data);
            displayStatistique(data);
        })
        .catch(error => {
            console.log(error.message);
        });
}

// Arrondir nombre
function arrondirNombre(nombre) {
    // Utilisez la méthode toFixed pour arrondir le nombre
    var nombreArrondi = nombre.toFixed(1);
    
    // Convertissez le résultat en nombre pour vous assurer que le type est correct
    return parseFloat(nombreArrondi);
}


// Fonction pour afficher les données dans l'affichage
function displayStatistique(data) {
    const joueurStatList = document.getElementById("joueurStatList");
    var classement = 1;
    data.forEach(stat => {
        var row = document.createElement('tr');
        row.innerHTML =  getStatRow(classement, stat.statJoueurStatic.imageJoueur, stat.statJoueurStatic.nomJoueur, stat.statJoueurStatic.nomEquipe, stat.statJoueurStatic.nombreMatchEquipe, stat.statJoueurStatic.nombreMatchJoueur, arrondirNombre(stat.statJoueurDynamic.typeActionValue[0]), arrondirNombre(stat.statJoueurDynamic.typeActionValue[1]), arrondirNombre(stat.statJoueurDynamic.typeActionValue[2]), arrondirNombre(stat.statJoueurDynamic.typeActionValue[3]), arrondirNombre(stat.statJoueurDynamic.typeActionValue[4]), arrondirNombre(stat.statJoueurDynamic.typeActionValue[5]), arrondirNombre(stat.statJoueurDynamic.typeActionValue[6]), arrondirNombre(stat.statJoueurDynamic.typeActionValue[7]));
        joueurStatList.appendChild(row);
        classement++;
    });

}

window.onload = function() {
    getStatistiques(); // Remplacez maFonction par le nom de votre fonction
};