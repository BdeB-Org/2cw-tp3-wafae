 
        document.getElementById('produit1Link').addEventListener('click', function() {
            document.getElementById('histoireImage').style.display = 'none';
            document.getElementById('produit1').style.display = 'block';
            document.getElementById('produit2').style.display = 'none';
        });

       
        document.getElementById('produit2Link').addEventListener('click', function() {
            document.getElementById('histoireImage').style.display = 'none';
            document.getElementById('produit1').style.display = 'none';
            document.getElementById('produit2').style.display = 'block';
        });

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

    