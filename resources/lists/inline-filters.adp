<div class="list-inline-filters">
  <ul class="list-inline">
    <multiple name="filters">
      <li>
        <span
          class="list-inline-filter-label"
          style="font-weight:bold">@filters.filter_label@:</span>
        <if @filters.filter_clear_url@ not nil>
          (<a href="@filters.filter_clear_url@"
              title="Clear the currently selected @filters.filter_label@">clear</a>)
        </if>

        <group column="filter_name">

          <if @filters.selected_p;literal@ true>
            <span class="w3-btn w3-teal">@filters.label@</span>
          </if>
          <else>
            <a class="w3-btn w3-theme-l3"
               href="@filters.url@"
               title="@filters.url_html_title@">@filters.label@</a>
          </else>

          <if @filters.count@ not nil and @filters.count@ ne "0">(@filters.count@)</if>

          <if @filters.add_url@ not nil>
            <a href="@filters.add_url@" class="list-inline-filter">+</a>
          </if>

        </group>
    </multiple>
  </ul>
</div>
