<%
    String query = request.getParameter("q");

    String[] donnee = new String[] {
            "animal", "arbre", "avion", "amour","ame","amere","amerde", "argent",
            "banane", "ballon", "bateau", "bonjour", "bouteille", 
            "chat", "chien", "ciel", "cœur", "couleur",
            "dormir", "danser", "dinde", "drapeau", "douceur"
        };

    for (String item : donnee) {
        if (item.startsWith(query.toLowerCase())) {
            out.println("<div>" + "<a href='search.jsp?q=" + item + "' class='suggestion-item'>" + item + "</a>" + "</div>");
        }
    }

%>