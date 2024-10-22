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

  <div
    class="w3-sidebar w3-bar-block w3-card w3-animate-right"
    style="width:200px;right:0;display:none;">
    <button class="w3-bar-item w3-button w3-large w3-border w3-light-grey sidebar-close">
      &times;
    </button>
    <!-- NAVBAR START -->
    <if @navigation:rowcount@ defined>
      <widget src="navigation" &="navigation" ds="0" &="subsite_url" &="subsite_name">
    </if>
    <!-- NAVBAR END -->
    <widget src="login" ds="0" &="subsite_url">
  </div>

  <div class="w3-main">
    <!-- START HEADER -->
    <div class="w3-container w3-padding w3-gray">
      <a class="navbar-brand w3-btn w3-light-gray w3-bar-item w3-border w3-padding-16"
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
    <!-- END HEADER -->

    <div class="w3-container">

      <if @user_messages:rowcount@ gt 0>
        <div id="w3css-alert-message">
          <multiple name="user_messages">
            <div class="w3-panel w3-pale-green">
	      <a class="w3-btn" data-bs-dismiss="alert">×</a>
	      <i class="bi bi-info-square-fill"></i>
              @user_messages.message;noquote@
            </div>
          </multiple>
        </div>
      </if>
    </div>

    <div class="w3-container w3-margin-bottom">
      <!-- START MAIN CONTENT -->
      <slave>
        <!-- END MAIN CONTENT -->
    </div>

    <!-- START FOOTER -->
    <div class="w3-container w3-center w3-light-gray">
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
  <script <if @::__csp_nonce@ not nil> nonce="@::__csp_nonce;literal@"</if>>
    window.addEventListener('load', () => {
        const sidebar = document.querySelector('.w3-sidebar');
        for (const el of document.querySelectorAll('.sidebar-close')) {
            el.addEventListener('click', function (evt) {
                sidebar.style.display = 'none';
            });
        }
        for (const el of document.querySelectorAll('.sidebar-open')) {
            el.addEventListener('click', function (evt) {
                sidebar.style.display = 'block';
            });
        }
        for (const el of document.querySelectorAll('.w3-dropdown-click a.w3-button')) {
            const subMenu = el.nextElementSibling;
            if (subMenu && subMenu.matches('.w3-dropdown-content')) {
                el.addEventListener('click', function (evt) {
                    subMenu.classList.toggle('w3-show');
                });
            }
        }
    });
    window.addEventListener('click', (e) => {
        if (e.target.closest('.w3-dropdown-click')) {
            return;
        }
        for (const el of document.querySelectorAll('.w3-show')) {
            el.classList.remove('w3-show');
        }
    });
  </script>
