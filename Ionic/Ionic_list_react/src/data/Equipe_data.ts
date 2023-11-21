import { Equipes } from "./SampleData";

export const getEquipes = () => Equipes;

export const getEquipesHost = async () => {

    var url = "https://statnba-production.up.railway.app/api/equipe";
    
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
};

export const getEquipe = (id: number) => Equipes.find(m => m.id === id);

export const getEquipeHost = async (id: number) => {
    const equipes = await getEquipesHost();
    return equipes.find(m => m.id === id);
}

