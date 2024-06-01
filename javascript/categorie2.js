 document.getElementById('produit3Link').addEventListener('click', function() {
            document.getElementById('histoireImage').style.display = 'none';
            document.getElementById('produit3').style.display = 'block';
            document.getElementById('produit4').style.display = 'none';
        });

       
        document.getElementById('produit4Link').addEventListener('click', function() {
            document.getElementById('histoireImage').style.display = 'none';
            document.getElementById('produit3').style.display = 'none';
            document.getElementById('produit4').style.display = 'block';
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