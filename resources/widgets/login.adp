<if @login_p;literal@ true>
  <div class="w3-dropdown-click">
    <a href="#"
       class="w3-bar-item w3-button"
       style="text-decoration:none;">@photo;noquote@ &#9660;</a>
    <div class="w3-dropdown-content w3-bar-block w3-card-4">
      <!-- user greeting or login message -->
      <a class="w3-bar-item w3-button"
         href="@subsite_url;literal@pvt/home">#acs-subsite.Welcome_user#  </a>

      <a class="w3-bar-item w3-button"
         href="@whos_online_url@"
         title="#acs-subsite.Whos_Online_link_label#">
        @num_users_online;noquote@
        <if @num_users_online@ eq 1>
          #acs-subsite.Member#
        </if>
        <else>
          #acs-subsite.Members#
        </else>
        #acs-subsite.Online#
      </a>
      <a
        class="w3-bar-item w3-button"
        href="@logout_url@"
        title="#acs-subsite.Logout_from_system#">#acs-subsite.Logout#</a>
    </div>
  </div>
</if>
<else>
  <a
    class="w3-bar-item w3-button"
    href="@login_url@">Log In</a>
</else>
