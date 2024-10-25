ad_page_contract {
    @author Gustaf Neumann

    @creation-date Aug 1, 2018
} {
}

set resource_info1 [::openacs_w3css_theme::resource_info]
set version1 [dict get $resource_info1 configuredVersion]
set resoure_name1  [dict get $resource_info1 resourceName]
set download_url1 download

set resource_info2 [::openacs_w3css_theme_color::resource_info]
set version2 [dict get $resource_info2 configuredVersion]
set resoure_name2  [dict get $resource_info2 resourceName]
set download_url2 download-themes

set title "[dict get $resource_info1 resourceName] - Sitewide Admin"
set context [list $title]


# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
