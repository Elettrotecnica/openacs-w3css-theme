<style>
  .oacs-navbar a { color: black; }
</style>

<% set system_name [ad_system_name] %>

<!-- Icon Bar (Sidebar - hidden on small screens) -->
<nav class="w3-sidebar w3-bar-block w3-hide-small w3-center w3-theme-l1 oacs-navbar"
     id="oacs-navbar-large">
  <div class="w3-bar-item w3-padding-large w3-border w3-theme-l5">
    <if @subsite_logo@ not nil>
      <img src="@subsite_logo;literal@" alt="Home">
    </if>
    <else>
      <b>@system_name@</b>
    </else>
  </div>
  <widget src="login" ds="0" &="subsite_url">
    <if @navigation:rowcount@ defined>
      <widget src="navigation" &="navigation" ds="0" &="subsite_url" &="subsite_name">
    </if>
</nav>

<!-- Navbar on small screens (Hidden on medium and large screens) -->
<div class="w3-top w3-hide-large w3-hide-medium w3-theme-l1 oacs-navbar" id="oacs-navbar-small">
  <div class="w3-bar-item w3-border w3-theme-l5 w3-padding-small">
    <if @subsite_logo@ not nil>
      <img src="@subsite_logo;literal@" alt="Home">
    </if>
    <else>
      <b>@system_name@</b>
    </else>
  </div>
  <div class="w3-bar w3-opacity w3-hover-opacity-off w3-center w3-small" style="display: flex;">
    <widget src="login" ds="0" &="subsite_url">
    <if @navigation:rowcount@ defined>
      <widget src="navigation" &="navigation" ds="0" &="subsite_url" &="subsite_name">
    </if>
  </div>
</div>
