<master src="/www/blank-master">
  <property name="&doc">doc</property>
  <if @streaming_head@ defined><property name="streaming_head">@streaming_head;literal@</property></if>

  <script src="/resources/openacs-w3css-theme/js/master.js"></script>

  <style>
    .oacs-navbar a { color: black; }
  </style>

  <% set system_name [ad_system_name] %>

  <div class="w3-top w3-grey oacs-navbar" id="oacs-navbar-small">
    <div class="w3-bar-item w3-border w3-white w3-padding-small">
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

  <% # Because the content is open-ended when streaming, we do not close these tags %>
  <div id="oacs-main">
    <div class="w3-panel">
