// https://developer.mozilla.org/en-US/docs/Web/API/Document/DOMContentLoaded_event




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

      
        alert("Formulaire soumis avec succès !");
        formulaire.submit();
    });
});
