
// https://developer.mozilla.org/en-US/docs/Web/API/Document/DOMContentLoaded_event

//https://www.digitalocean.com/community/tutorials/how-to-use-the-javascript-fetch-api-to-get-data

//https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/JSON/stringify

//https://www.w3schools.com/js/js_json_stringify.asp





document.addEventListener("DOMContentLoaded", () => {
    const formulaire = document.getElementById("abonnementForm");
    formulaire.addEventListener("submit", (event) => {
        event.preventDefault(); 

        
        const nom = document.getElementById("nom").value;
        const prenom = document.getElementById("prenom").value;
        const courriel = document.getElementById("courriel").value;
        const motdepasse = document.getElementById("motdepasse").value;

        
        const nomValide = /^[a-zA-Z\-]+$/.test(nom);
        const prenomValide = /^[a-zA-Z\-]+$/.test(prenom);
        const motdepasseValide = motdepasse.length >= 8;
        const courrielValide = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(courriel);

        
        if (!nomValide) {
            alert("Veuillez entrer un nom valide (lettres et tirets uniquement).");
            return;
        }
        if (!prenomValide) {
            alert("Veuillez entrer un prénom valide (lettres et tirets uniquement).");
            return;
        }
        if (!motdepasseValide) {
            alert("Le mot de passe doit contenir au moins 8 caractères.");
            return;
        }
        if (!courrielValide) {
            alert("Veuillez entrer une adresse courriel valide (exemple@abcd.com).");
            return;
        }
		 const formData = new FormData();
        formData.append("nom", nom);
        formData.append("prenom", prenom);
        formData.append("courriel", courriel);
        formData.append("motdepasse", motdepasse);
        // ca depent peut etre le lien url c est pas correcte
        fetch("http://localhost:8080/ords/hr2/client", {
            method: "POST",
            body: formData
        })
        .then(response => {
            if (!response.ok) {
                throw new Error("Erreur lors de l'envoi des données.");
            }
            return response.json();
        })
        .then(data => {
            console.log("Réponse du serveur :", data);
            alert("Formulaire soumis avec succès !");
        })
        .catch(error => {
            console.error("Erreur :", error);
            alert("Erreur!   Veuillez réessayer plus tard.");
        });

      
       
    });
});

function creerListe() {
    let nbreRangee = window.prompt("Entrez le nom du nouveau produit désiré", "A");
    let nbreColonne = window.prompt("Entrez le prix du produit désiré", 1);
    const maListe = document.getElementById("maListe");
  
    for (let r = 0; r < parseInt(nbreRangee); r++) {
      let rangeeInseree = maListe.insertRow(r);
      for (let c = 0; c < parseInt(nbreColonne); c++) {
        let cellule = rangeeInseree.insertCell(c);
        cellule.innerHTML = `Rangée: ${r} Colonne: ${c}`;
      }
    }
}
