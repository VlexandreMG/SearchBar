<%
    String query = request.getParameter("q");

    String[] donnee = new String[] {
            "animal", "arbre", "avion", "amour", "argent",
            "banane", "ballon", "bateau", "bonjour", "bouteille", 
            "chat", "chien", "ciel", "cœur", "couleur",
            "dormir", "danser", "dinde", "drapeau", "douceur"
        };

    for (String item : donnee) {
        if (item.startsWith(query.toLowerCase())) {
            out.println("<div>" + item + "</div>");
        }
    }
%>