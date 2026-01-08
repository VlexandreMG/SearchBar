<%@ page import="java.util.*" %>

<%
    String query = request.getParameter("q");
    if (query == null) query = "";
    
    List<String> history = (List<String>) session.getAttribute("history");
    
    String[] donnee = new String[] {
        "animal", "arbre", "avion", "amour","ame","amere","amerde", "argent",
        "banane", "ballon", "bateau", "bonjour", "bouteille", 
        "chat", "chien", "ciel", "cœur", "couleur",
        "dormir", "danser", "dinde", "drapeau", "douceur"
    };

    // AFFICHER l'historique seulement si l'utilisateur a tapé quelque chose
    if (!query.trim().isEmpty()) {
        // 1. D'abord afficher l'historique si c'est pertinent
        if (history != null && !history.isEmpty()) {
            for (String hist : history) {
                out.println("<div class='history-item'>📜<a href='search.jsp?q=" + hist + "'>" + hist + "</a></div>");
            }
            out.println("<hr>"); // Séparateur
        }
        
        // 2. Ensuite les suggestions normales
        for (String item : donnee) {
            if (item.startsWith(query.toLowerCase())) {
                out.println("<div><a href='search.jsp?q=" + item + "' class='suggestion-item'>" + item + "</a></div>");
            }
        }
    }
%>