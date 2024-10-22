<master src="/www/blank-master">
  <property name="&doc">doc</property>
  <if @streaming_head@ defined><property name="streaming_head">@streaming_head;literal@</property></if>

  <div class="w3-container w3-padding w3-gray">
    <a class="navbar-brand w3-btn w3-light-gray w3-bar-item w3-round w3-border"
       href="@subsite_url;literal@">
      <if @subsite_logo@ not nil>
        <img src="@subsite_logo;literal@" alt="Home">
      </if>
      <else>
        <div>#acs-subsite.Subsite_Home#</div>
      </else>
    </a>
    <button class="w3-button w3-border w3-round w3-xlarge w3-right sidebar-open">
      &#9776;
    </button>
  </div>

  <div class="w3-panel">
    <widget src="search" ds="0">
  </div>
  <if @context_bar@ defined and @context_bar@ ne "">
    <div class="w3-panel">@context_bar;noquote@</div>
  </if>
