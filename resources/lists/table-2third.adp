<if @list_properties.page_size@ not nil>
  <!-- top pagination -->
  <noparse>
    <if \@paginator.page_count@ gt 1 or \@list_properties.page_size_variable_p@ eq 1>
      <div class="list-paginator-top">
        <nav>
          <ul class="pagination">
            <if \@paginator.page_count@ gt 1>
              <if \@paginator.group_count@ gt 1 and \@paginator.groupsize@ gt 1>
                <if \@paginator.previous_group_url@ not nil>
                  <li class="page-item">
                    <a class="page-link"
                       href="\@paginator.previous_group_url@"
                       title="\@paginator.previous_group_context@">&laquo;</a>
                  </li>
                </if>
                <else>
                  <li class="page-item disabled">
                    <a class="page-link"
                       href="#"
                       aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                </else>
              </if>
              <if \@paginator.previous_page_url@ not nil>
                <li class="page-item">
                  <a class="page-link"
                     aria-label="Previous"
                     href="\@paginator.previous_page_url@"
                     title="\@paginator.previous_page_context@">
                    <span aria-hidden="true">&lsaquo;</span>
                  </a>
                </li>
              </if>
              <else>
                <li class="page-item disabled">
                  <a class="page-link"
                     href="#"
                     aria-label="Previous">
                    <span aria-hidden="true">&lsaquo;</span>
                  </a>
                </li>
              </else>

              <multiple name="paginator_pages">
                <if \@paginator.current_page@ ne \@paginator_pages.page@>
                  <li class="page-item">
                    <a class="page-link"
                       href="\@paginator_pages.url@"
                       title="\@paginator_pages.context@">\@paginator_pages.page@</a>
                  </li>
                </if>
                <else>
                  <li class="page-item active">
                    <a class="page-link"
                       href="#">\@paginator_pages.page@ <span class="visually-hidden">(current)</span>
                    </a>
                  </li>
                </else>
              </multiple>

              <if \@paginator.next_page_url@ not nil>
                <li class="page-item">
                  <a class="page-link"
                     aria-label="Next"
                     href="\@paginator.next_page_url@"
                     title="\@paginator.next_page_context@">
                    <span aria-hidden="true">&rsaquo;</span>
                  </a>
                </li>
              </if>
              <else>
                <li class="page-item disabled">
                  <a class="page-link"
                     href="#"
                     aria-label="Next">
                    <span aria-hidden="true">&rsaquo;</span>
                  </a>
                </li>
              </else>
              <if \@paginator.group_count@ gt 1 and \@paginator.groupsize@ gt 1>
                <if \@paginator.next_group_url@ not nil>
                  <li class="page-item">
                    <a class="page-link"
                       href="\@paginator.next_group_url@"
                       title="\@paginator.next_group_context@">&raquo;</a>
                  </li>
                </if>
                <else>
                  <li class="page-item disabled">
                    <a class="page-link"
                       href="#"
                       aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </else>
              </if>
            </if>

            <if \@list_properties.page_size_variable_p@ eq 1>
              <div align="right" width="5%">
                <form name="\@list_properties.name@_resize" method="GET" action="">
                  \@list_properties.page_size_export_chunk;noquote@
	          <tcl>template::add_event_listener -event change -id "$list_properties(name)_resize-control" -script [subst {
                    acs_ListBulkActionClick('$list_properties(name)_resize', '$list_properties(url)');
                    }]</tcl>
                  <select id='\@list_properties.name@_resize-control' name="page_size">
                    <multiple name="page_sizes">
                      <option value="\@page_sizes.value@"<if \@list_properties.page_size@ eq \@page_sizes.value@> selected</if>>\@page_sizes.name@
                    </multiple>
                  </select>
                </form>
	      </div>
            </if>
          </ul>
        </nav>
      </div>
    </if>
  </noparse>
  <!-- end of top pagination -->
</if>


<if @list_properties.bulk_actions@ not nil>
  <if @list_properties.bulk_action_method@ not nil>
    <form name="@list_properties.name@" method="@list_properties.bulk_action_method@" action="">
  </if>
  <else>
    <form name="@list_properties.name@" method="GET" action="">
  </else>
  @list_properties.bulk_action_export_chunk;noquote@
</if>


<if @actions:rowcount@ gt 0>
  <!-- list-button-bar-top div -->
  <div class="list-button-bar-top w3-bar">
    <multiple name="actions">
      <a href="@actions.url@"
         title="@actions.title@"
         class="w3-button w3-theme-l3">@actions.label@</a></li>
</multiple>
</div>
<!-- end of list-button-bar-top div -->
</if>

<div class="row">
  <div class="col-xl-8 col-lg-10 col-12">
    <table
      class="table table-striped"
      cellpadding="3" cellspacing="1"
      @list_properties.table_attributes;noquote@>
      <if "@list_properties.caption@" ne "">
        <caption>@list_properties.caption;noquote@</caption>
      </if>
      <multiple name="elements">
        <thead>
          <tr class="list-header">
            <group column="subrownum">
              <th class="@elements.class@"
                  @elements.cell_attributes;noquote@
                  id="@list_properties.name@_@elements.name@">
                <if @elements.orderby_url@ not nil>
                  <if @elements.ordering_p;literal@ true>
                    <a href="@elements.orderby_url@"
                       title="@elements.orderby_html_title@">@elements.label;noquote@</a>
                    <a href="@elements.orderby_url@"
                       title="@elements.orderby_html_title@">
                      <if @elements.orderby_direction@ eq "desc">
                        <span title="#acs-templating.descending_order#">↓</span>
                      </if>
                      <else>
                        <span title="#acs-templating.ascending_order#">↑</span>
                      </else>
                    </a>
                  </if>
                  <else>
                    <a href="@elements.orderby_url@"
                       title="@elements.orderby_html_title@">@elements.label;noquote@</a>
                    <a href="@elements.orderby_url@">
                      <span title="#acs-templating.not_ordered#">↑↓</span>
                    </a>
                  </else>
                </if>
                <else>
                  @elements.label;noquote@
                </else>
              </th>
            </group>
          </tr>
        </thead>
      </multiple>

      <!-- START TFOOT for Aggregate func -->
      <noparse>
        <multiple name="@list_properties.multirow@">
      </noparse>

      <if @list_properties.aggregates_p;literal@ true>
        <noparse>
          <if \@@list_properties.multirow@.rownum@ eq \@@list_properties.multirow@:rowcount@>
        </noparse>
        <multiple name="elements">
          <tfoot>
            <tr class="list-subheader last">
              <group column="subrownum">
                <td class="@elements.class@"@elements.cell_attributes;noquote@>
                  <if @elements.aggregate_label@ not nil>
                    @elements.aggregate_label@
                  </if>
                  <if @elements.aggregate@ not nil>
                    \@@list_properties.multirow@.@elements.aggregate_col@@
                  </if>
                </td>
              </group>
            </tr>
          </tfoot>
        </multiple>
        <noparse></if></noparse>
      </if>

      <noparse>
      </multiple>
      </noparse>
      <!-- END of TFOOT -->

      <noparse>
        <if \@@list_properties.multirow@:rowcount@ eq 0>
          <tbody>
            <tr class="list-last">
              <td colspan="@elements:rowcount@">
                @list_properties.no_data@
              </td>
            </tr>
          </tbody>
        </if>
        <else>

          <tbody>
            <multiple name="@list_properties.multirow@">
      </noparse>

      <if @list_properties.groupby@ not nil>

        <tr class="list-subheader">
          <td colspan="@elements:rowcount@"
              headers="@list_properties.name@_@list_properties.groupby@">
            <if @list_properties.groupby_label@ ne "">@list_properties.groupby_label@: </if>
            <listelement name="@list_properties.groupby@">
          </td>
        </tr>

        <noparse>
          <group column="@list_properties.groupby@">
        </noparse>
      </if>

      <multiple name="elements">

        <noparse>
          <if \@@list_properties.multirow@.rownum@ lt \@@list_properties.multirow@:rowcount@>
            <tr>
          </if>
          <else>
            <tr class="last">
          </else>
        </noparse>

        <group column="subrownum">
          <td class="@elements.class@"
              @elements.cell_attributes;noquote@
              headers="@list_properties.name@_@elements.name@">
            <listelement name="@elements.name@">
          </td>
        </group>
</tr>
</multiple>

<if @list_properties.groupby@ not nil>
  <noparse><if \@@list_properties.multirow@.groupnum_last_p@ true></noparse>
  <multiple name="elements">
    <tr class="list-subheader">
      <group column="subrownum">
        <td class="@elements.class@"@elements.cell_attributes;noquote@>
          <if @elements.aggregate_group_label@ not nil>
            @elements.aggregate_group_label@
          </if>
          <if @elements.aggregate@ not nil>
            \@@list_properties.multirow@.@elements.aggregate_group_col@@
          </if>
        </td>
      </group>
    </tr>
  </multiple>
  <noparse></if></noparse>

  <noparse>
</group>
</noparse>
</if>

<noparse>
</multiple>
</tbody>
</else>
</noparse>

</table>
</div>
</div>

<noparse><if \@@list_properties.multirow@:rowcount@ gt 0></noparse>
<if @bulk_actions:rowcount@ gt 0>
  <!-- list-button-bar-bottom div -->
  <div class="list-button-bar-bottom">
    <multiple name="bulk_actions">
      <% template::add_event_listener -id "$list_properties(name)-bulk_action-$bulk_actions(rownum)" -script [subst {
	 $list_properties(bulk_action_click_function)('$list_properties(name)', '$bulk_actions(url)');
	 }] %>
      <input type="submit"
             title="@bulk_actions.title@"
             id="@list_properties.name;literal@-bulk_action-@bulk_actions.rownum;literal@"
             value="@bulk_actions.label@"
             class="w3-btn w3-theme-l3">
    </multiple>
  </div>
  <!-- end of list-button-bar-bottom div -->
</if>
<noparse></if></noparse>

<if @list_properties.page_size@ not nil>
  <!-- bottom pagination -->
  <noparse>
    <if \@paginator.page_count@ gt 1>
      <div class="list-paginator-bottom">
        <nav>
          <ul class="pagination">
            <if \@paginator.page_count@ gt 1>
              <if \@paginator.group_count@ gt 1 and \@paginator.groupsize@ gt 1>
                <if \@paginator.previous_group_url@ not nil>
                  <li class="page-item">
                    <a class="page-link"
                       href="\@paginator.previous_group_url@"
                       title="\@paginator.previous_group_context@">&laquo;</a>
                  </li>
                </if>
                <else>
                  <li class="page-item disabled">
                    <a class="page-link"
                       href="#"
                       aria-label="Previous">
                      <span aria-hidden="true">&laquo;</span>
                    </a>
                  </li>
                </else>
              </if>
              <if \@paginator.previous_page_url@ not nil>
                <li class="page-item">
                  <a class="page-link"
                     aria-label="Previous"
                     href="\@paginator.previous_page_url@"
                     title="\@paginator.previous_page_context@">
                    <span aria-hidden="true">&lsaquo;</span>
                  </a>
                </li>
              </if>
              <else>
                <li class="page-item disabled">
                  <a class="page-link"
                     href="#"
                     aria-label="Previous">
                    <span aria-hidden="true">&lsaquo;</span>
                  </a>
                </li>
              </else>

              <multiple name="paginator_pages">
                <if \@paginator.current_page@ ne \@paginator_pages.page@>
                  <li class="page-item">
                    <a class="page-link"
                       href="\@paginator_pages.url@"
                       title="\@paginator_pages.context@">\@paginator_pages.page@</a>
                  </li>
                </if>
                <else>
                  <li class="page-item active">
                    <a class="page-link"
                       href="#">\@paginator_pages.page@ <span class="visually-hidden">(current)</span>
                    </a>
                  </li>
                </else>
              </multiple>

              <if \@paginator.next_page_url@ not nil>
                <li class="page-item">
                  <a class="page-link"
                     aria-label="Next"
                     href="\@paginator.next_page_url@"
                     title="\@paginator.next_page_context@">
                    <span aria-hidden="true">&rsaquo;</span>
                  </a>
                </li>
              </if>
              <else>
                <li class="page-item disabled">
                  <a class="page-link"
                     href="#"
                     aria-label="Next">
                    <span aria-hidden="true">&rsaquo;</span>
                  </a>
                </li>
              </else>
              <if \@paginator.group_count@ gt 1 and \@paginator.groupsize@ gt 1>
                <if \@paginator.next_group_url@ not nil>
                  <li class="page-item">
                    <a class="page-link"
                       href="\@paginator.next_group_url@"
                       title="\@paginator.next_group_context@">&raquo;</a>
                  </li>
                </if>
                <else>
                  <li class="page-item disabled">
                    <a class="page-link"
                       href="#"
                       aria-label="Next">
                      <span aria-hidden="true">&raquo;</span>
                    </a>
                  </li>
                </else>
              </if>
            </if>
          </ul>
        </nav>
      </div>
    </if>
  </noparse>
  <!-- end of bottom pagination -->
</if>

<if @list_properties.bulk_actions@ not nil>
</form>
</if>
