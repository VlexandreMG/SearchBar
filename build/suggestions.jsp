<%@ page import="java.util.*" %>

<%
    String query = request.getParameter("q");
    if (query == null) query = "";
    
    List<String> history = (List<String>) session.getAttribute("history");
    //String[] newArray = new String[history.length];
     
    String[] donnee = new String[] {
        "animal", "arbre", "avion", "amour","ame","amere","amerde", "argent",
        "banane", "ballon", "bateau", "bonjour", "bouteille", 
        "chat", "chien", "ciel", "cœur", "couleur",
        "dormir", "danser", "dinde", "drapeau", "douceur"
    };

    // AFFICHER l'historiwque seulement si l'utilisateur a tapé quelque chose
    if (!query.trim().isEmpty()) {
        // 1. D'abord afficher l'historique si c'est pertinent
        
    if (history != null && !history.isEmpty()) {
        List<String> dejaVus = new ArrayList<>();
        
        for (String hist : history) {
            if (hist.toLowerCase().contains(query.toLowerCase())) {
                // Évite les doublons
                if (!dejaVus.contains(hist)) {
                    dejaVus.add(hist);
                    out.println("<div class='history-item' id='hist-"+ hist +"'>📜<a href='search.jsp?q=" + hist + "'>" + hist + "</a><button class='delete-button'>X</button></div>");   
                }
            }
        }
        
         
        if (!dejaVus.isEmpty()) {
            out.println("<hr>");
        }
    }
    <script>
document.addEventListener('click', function(e) {
    // Vérifie la classe du bouton
    if (e.target.classList.contains('delete-btn')) {
        const historyItem = e.target.closest('.history-item');
        console.log('History item:', historyItem);
        console.log('Mot:', historyItem ? historyItem.textContent : 'non trouvé');
    }
});
</script>
        
        // 2. Ensuite les suggestions normales
        for (String item : donnee) {
            if (item.startsWith(query.toLowerCase())) {
                out.println("<div><a href='search.jsp?q=" + item + "' class='suggestion-item'>" + item + "</a></div>");
            }
        }
    }
%>

<%-- <script> 
function erase(mot) {
var history = document.getElementById("hist-"+ mot);
console.log(history);
}
</script>  --%>

 <%-- <script>
    document.addEventListener('click', function (e) {
    const el = e.target.closest('.history-item');    
    console.log(el);
    });
</script> --%>

