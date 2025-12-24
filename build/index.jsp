<h3>Search bar : :D</h3>
<form action="" method="post">
  <input type="text" name="search" id="searchInput" autocomplete="off">
  <button type="submit">Search</button>
</form>

<div id="suggestions"></div>

<script>
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
        }
      };
      xhr.open('GET', 'suggestions.jsp?q=' + encodeURIComponent(query), true);
      xhr.send();
    }
  });
</script>