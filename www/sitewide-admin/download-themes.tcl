ad_page_contract {
    @author Gustaf Neumann

    @creation-date Aug 1, 2018
} {
    {version:token,notnull ""}
}

::util::resources::download \
    -resource_info [::openacs_w3css_theme_color::resource_info -version $version]

ad_returnredirect .

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
