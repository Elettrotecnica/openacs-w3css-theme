<master>
<property name="doc(title)">@title;literal@</property>
<property name="context">@context;literal@</property>

<h1>@title;noquote@</h1>
<include src="/packages/acs-tcl/lib/check-installed" &=resource_info &=version>
<include src="/packages/acs-tcl/lib/check-installed"
         &resource_info="resource_color_info"
         &=version
         download_url="download-themes">
<include src="/packages/acs-templating/lib/registered-urns" match="*:w3*">
