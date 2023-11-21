import { StatEquipes } from "./SampleData";

export const getStatRelativeOneEquipe = (equipeId: number) => {
    const statEquipes = StatEquipes;
    // return statEquipes.filter(se => se.equipe.id === equipeId);
    return []
}

export const getStatRelativeOneEquipeHost = async (equipeId: number) => {

    var url = "https://statnba-production.up.railway.app/api/statglobal/" + equipeId;

    var header =    {
                        method: "GET",
                        headers: {
                            "Content-Type": "application/json"
                        },
                    } 

    return fetch(url, header)
        .then(response => response.json())
        .then(data => {
            return data;
        })
        .catch(error => {
            alert(error)
            return []       
        });
}
