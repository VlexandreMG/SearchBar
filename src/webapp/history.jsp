<%@ page import="java.util.*" %>
<% 
   List<String> history = (List<String>) session.getAttribute("history");
   List<String> newArray = new ArrayList<>();
%>

<h3>Historique de recherches : </h3>

<ul> 
    <% for (String his : history) { 
         boolean detecteur = false; 
         for (String vao : newArray) {
            if (his.equals(vao)) {
                detecteur = true;
                break;
            }

            if (!detecteur) {
                newArray.add(his);
            }
        } 
    } %>
        <% for (String vaovao : newArray) { %>
            <li><%= vaovao %></li>
        <% } %>
</ul>
