<list name="navigation_groups">
  <!-- @navigation_groups:item@ -->
  <if @navigation_groups:item@ eq "main">
    <multiple name="navigation">
      <if @navigation.parent@ eq "">
        <if @navigation.submenu@ not nil>
          <div class="w3-dropdown-click">
            <a href="#"
               <if @navigation.id@ not nil>
                 id="@navigation.id@"
                 style="font-weight: bold;"
               </if>
               class="w3-bar-item w3-button w3-padding-large <if @navigation.id@ not nil>w3-light-gray</if> <if @navigation.class@ not nil>@navigation.class;noquote@</if>"
               <if @navigation.class@ not nil> class="@navigation.class;noquote@"</if>
               <if @navigation.title@ not nil> title="@navigation.title;noquote@"</if>
               <if @navigation.lang@ not nil> lang="@navigation.lang;noquote@"</if>
               <if @navigation.accesskey@ not nil> accesskey="@navigation.accesskey;noquote@"</if>
               <if @navigation.tabindex@ not nil> tabindex="@navigation.tabindex;noquote@"</if>>
              <if @navigation.display_template@ not nil>@navigation.display_template;noquote@</if>
              <else>@navigation.label@</else>&#9660;
            </a>
            <div class="w3-dropdown-content w3-bar-block w3-card-4 w3-border">
              @navigation.submenu;noquote@
            </div>
          </div>
        </if>
        <else>
          <a href="@navigation.href@"
             class="w3-bar-item w3-button w3-padding-large <if @navigation.id@ not nil>w3-light-gray</if> @navigation.class;noquote@"
             <if @navigation.id@ not nil>
               id="@navigation.id@"
               style="font-weight: bold;"
             </if>
             <if @navigation.target@ not nil> target="@navigation.target;noquote@"</if>
             <if @navigation.title@ not nil> title="@navigation.title;noquote@"</if>
             <if @navigation.lang@ not nil> lang="@navigation.lang;noquote@"</if>
             <if @navigation.accesskey@ not nil> accesskey="@navigation.accesskey;noquote@"</if>
             <if @navigation.tabindex@ not nil> tabindex="@navigation.tabindex;noquote@"</if>>
            <if @navigation.display_template@ not nil>@navigation.display_template;noquote@</if>
            <else>@navigation.label@</else></a>
        </else>
      </if>
    </multiple>
  </if>
</list>
