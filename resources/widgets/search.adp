<div class="search">
  <form method="GET" action="/search/search">
    <div>
      <input type="search" name="q" title="#search.Enter_keywords_to_search_for#" maxlength="256" placeholder="Search">
      <if @::__csrf_token@ defined><input type="hidden" name="__csrf_token" value="@::__csrf_token;literal@"></if>
      <button type="submit">Go!</button>
    </div>
  </form>
</div>

