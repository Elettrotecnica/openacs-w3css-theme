<if @results_paginator:rowcount@ gt 0>
  <div id="results-pages" class="@paginator_class@">
    <nav>
      <if @url_previous_group@ nil>
        <a href="#" class="w3-disabled" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a>
      </if>
      <else>
        <a href="@url_previous_group@" title="Previous Group">&laquo;</a>
      </else>
      <if @url_previous@ nil>
        <a href="#" class="w3-disabled" aria-label="Previous"><span aria-hidden="true">&lsaquo;</span></a>
      </if>
      <else>
        <a aria-label="Previous" href="@url_previous@" title="Previous"><span aria-hidden="true">&lsaquo;</span></a>
      </else>
      <multiple name="results_paginator">
        <if @results_paginator.current_p;literal@ true>
          <a style="font-weight:bold;" aria-label="Current" href="#">@results_paginator.item@</span></a>
        </if>
        <else>
          <a href="@results_paginator.link@" title="@results_paginator.item@">@results_paginator.item@</a>
        </else>
      </multiple>
      <if @url_next@ nil>
        <a href="#" class="w3-disabled" aria-label="Next"><span aria-hidden="true">&rsaquo;</span></a>
      </if>
      <else>
        <a aria-label="Next" href="@url_next@" title="Next"><span aria-hidden="true">&rsaquo;</span></a>
      </else>
      <if @url_next_group@ nil>
        <a href="#" class="w3-disabled" aria-label="Next"><span aria-hidden="true">&raquo;</span></a>
      </if>
      <else>
        <a href="@url_next_group@" title="Next Group">&raquo;</a>
      </else>
    </nav>
  </div>
</if>

