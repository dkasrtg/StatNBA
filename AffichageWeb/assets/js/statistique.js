
// a row template
function getStatRow(classement, photoJoueur, nomJoueur, equipe, M, MJ, PPM, RPM, PDPM, MPM, EFF, FG, threeP, LF) {
    return `
            <td>
                <div>` + classement + `</div>
            </td>
            <td>
                <div class="d-flex profile align-items-center justify-content-left">
                    <img src="data:image;base64,` + photoJoueur + `" class="profile-img" alt="Image du Joueur">
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
    const url = "http://localhost:8080/nba/statistiques";

    // Faire l'appel
    fetch(url)
        .then(response => {
            return response.json();     // We should convert the response to json
        })
        .then(data => {
            const result = getResponseData(data);
            displayStatistique(result);
        })
        .catch(error => {
            console.log(error.message);
        });
}

// Fonction pour afficher les données dans l'affichage
function displayStatistique(data) {
    const joueurStatList = document.getElementById("joueurStatList");
    
    data.forEach(stat => {
        var row = document.createElement('tr');
        row.innerHTML =  getStatRow(stat.classement, stat.joueur.photo, stat.joueur.nom, stat.lf, stat.m, stat.mj, stat.ppm, stat.rpm, stat.pdpm, stat.mpm, stat.eff, stat.fg, stat.threeP, stat.lf);
        
        joueurStatList.appendChild(row);
    });

}

window.onload = function() {
    getStatistiques(); // Remplacez maFonction par le nom de votre fonction
};