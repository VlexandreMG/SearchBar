<h3>Search bar : :D</h3>
<form action="search.jsp" method="post">
  <input type="text" name="search" id="searchInput" autocomplete="off">
  <button type="submit">Search</button>
</form>

<div id="suggestions" class="suggestions-container"></div>
<div id="history"></div>

<style> 
  .suggestions-container {
    background: white;
    border: 1px solid #ccc;
    border-radius: 5px;
    width: 300px;
    max-height: 200px;
    overflow-y: auto;
    box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    position: absolute;
    margin-top: 5px;
}
</style>

<script>
//let history = [];
  // Fonction une seule fois
//function handleSuggestionClick(e) {
    //console.log('Clicked on suggestion:', e.target.textContent);
    //e.preventDefault(); //si tu veux empêcher le lien
    //Maka an'ilay mot
    //const mot = e.target.textContent;

    //Mandefa ao anaty tableau
    //history.push(mot);

    // Affiche l'historique
    //document.getElementById('history').innerHTML = 
    //"Historique: " + history.join(", "); 

    // Met dans la barre et soumet
    //document.getElementById('searchInput').value = mot;
    //document.querySelector('form').submit();

//} 

document.getElementById('searchInput').addEventListener('input', function () {
    const query = this.value;

    if (query.length === 0) {
        document.getElementById('suggestions').innerHTML = '';
        return;
    } else {
        const xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                document.getElementById('suggestions').innerHTML = this.responseText;
                const container = document.querySelector('.suggestions-container');
                
                // Retire l'ancien écouteur d'abord (évite les doublons)
                    //container.removeEventListener('click', handleSuggestionClick);
                // Puis ajoute le nouvel
                    //container.addEventListener('click', handleSuggestionClick);
            }
        };
        xhr.open('GET', 'suggestions.jsp?q=' + encodeURIComponent(query), true);
        xhr.send();
    }
});
</script>