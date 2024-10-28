<master src="/www/blank-master">
  <if @doc@ defined><property name="&doc">doc</property></if>
  <if @body@ defined><property name="&body">body</property></if>
  <if @head@ not nil><property name="head">@head;literal@</property></if>
  <if @focus@ not nil><property name="focus">@focus;literal@</property></if>
  <if @displayed_object_id@ not nil><property name="displayed_object_id">@displayed_object_id;literal@</property></if>

  <if @signatory@ defined>
    <property name="signatory">@signatory;literal@</property>
  </if>
  <if @focus@ defined>
    <property name="focus">@focus;literal@</property>
  </if>

  <widget src="header-bar" ds="0" &="subsite_logo" &="navigation" &="subsite_url" &="subsite_name">

  <!-- Page Content -->
  <div id="oacs-main">
    <header class="w3-container w3-theme-l1 w3-center">
      <div class="w3-panel">
        <widget src="search" ds="0">
      </div>
      <if @context_bar@ defined and @context_bar@ ne "">
        <div class="w3-panel oacs-navbar">
          @context_bar;noquote@
        </div>
      </if>

      <if @user_messages:rowcount@ gt 0>
        <div id="w3css-alert-message">
          <multiple name="user_messages">
            <div class="w3-panel w3-pale-green w3-left-align">
	      <a class="w3-btn" data-bs-dismiss="alert">×</a>
	      <i class="bi bi-info-square-fill"></i>
              @user_messages.message;noquote@
            </div>
          </multiple>
        </div>
      </if>
    </header>

    <div class="w3-panel">
      <!-- START MAIN CONTENT -->
      <slave>
        <!-- END MAIN CONTENT -->
    </div>

    <!-- START FOOTER -->
    <div class="w3-container w3-center w3-theme-l3">
      <p style="font-size: 80%">
        This website is maintained by the OpenACS community. Any problems, email <a href="mailto:@signatory@">webmaster</a> or <a href="https://openacs.org/bugtracker/openacs.org/">submit</a> a bug report.
        <br>
        (Powered by Tcl<a href="http://www.tcl.tk/"><img alt="Tcl Logo" src="/resources/openacs-w3css-theme/images/plume.png" width="14" height="13"></a>,
        Next Scripting <a href="https://next-scripting.org/"><img alt="NSF Logo" src="/resources/openacs-w3css-theme/images/next-icon.png" width="14" height="8"></a>,
        NaviServer <%= [ns_info patchlevel] %> <a href="http://sourceforge.net/projects/naviserver/"><img src="/resources/openacs-w3css-theme/images/ns-icon-16.png" alt="NaviServer Logo" width="12" height="12"></a>,
        <%= [expr {[ns_conn isconnected] && [string match *.* [ns_conn peeraddr]] ? "IPv4" : "IPv6"}] %>)
      </p>
    </div>
    <!-- END FOOTER -->
  </div>
  <script src="/resources/openacs-w3css-theme/js/master.js"></script>
