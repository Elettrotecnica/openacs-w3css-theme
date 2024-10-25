<master>
  <property name="doc(title)">@title;literal@</property>
  <property name="context">@context;literal@</property>

  <h1>@title;noquote@</h1>

  <ul class="list-group">
    <li class="list-group-item">
      <h4>@resoure_name1@</h4>
      <include src="/packages/acs-tcl/lib/check-installed"
               &resource_info=resource_info1
               &download_url=download_url1>
    </li>

    <li class="list-group-item">
      <h4>@resoure_name2@</h4>
      <include src="/packages/acs-tcl/lib/check-installed"
               &resource_info=resource_info2
               &download_url=download_url2>
    </li>
  </ul>

  <include src="/packages/acs-templating/lib/registered-urns" match="*:w3*">
