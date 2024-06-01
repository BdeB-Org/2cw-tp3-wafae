function afficherHistoire(){
    const histoire = document.getElementById('histoire');
    const button = document.getElementById('toggleButton');
    if (histoire.style.display === "none") {
        histoire.style.display = "block";
        button.textContent = "Cacher l'histoire";
    } else {
        histoire.style.display = "none";
        button.textContent = "Afficher l'histoire";
    }

}
