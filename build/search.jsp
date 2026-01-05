<% 
String query = request.getParameter("q");
String search = request.getParameter("search");

String[] tableau = new String[] {
    "animal", "arbre", "avion", "amour", "ame", "amere", "amerde", "argent",
    "banane", "ballon", "bateau", "bonjour", "bouteille", 
    "chat", "chien", "ciel", "cœur", "couleur",
    "dormir", "danser", "dinde", "drapeau", "douceur"
};

if (search != null && !search.trim().isEmpty()) {
    String searchLower = search.toLowerCase();
    boolean exactMatchFound = false;
    
    for (String tab : tableau) {
        String tabLower = tab.toLowerCase();
        
        if (tabLower.equals(searchLower)) {
            out.println("You searched for: " + tab);
            exactMatchFound = true;
            break; // Stop après match exact
        }
    }
    
    // Si pas de match exact, cherche les contenus
    if (!exactMatchFound) {
        for (String tab : tableau) {
            if (tab.toLowerCase().contains(searchLower)) {
                out.println(tab);
            }
        }
    }
    
} else if (query != null && !query.trim().isEmpty()) {
    out.println("You clicked on: " + query);
} else {
    out.println("No search query provided");
}
%>