namespace eval openacs_w3css_theme {}
namespace eval openacs_w3css_theme::apm {}

ad_proc -private openacs_w3css_theme::apm::after_install {} {
    Package after installation callback proc.

    Add our themes, and set the acs-subsite's default master template
    parameter's default value to our "plain" theme.
} {
    #
    # Insert this package's themes
    #
    db_transaction {
        subsite::new_subsite_theme \
            -create_or_replace \
            -key openacs_w3css \
            -name #openacs-w3css-theme.plain# \
            -template tabbed-master \
            -css {
                {-href /resources/acs-subsite/site-master.css -media all -order 0}
                {-href urn:ad:css:w3css -media all -order 1}
                {-href /resources/acs-templating/forms.css -media all -order 4}
                {-href /resources/acs-templating/lists.css -media all -order 5}
            } \
            -js {} \
            -form_template standard \
            -list_template table \
            -list_filter_template filters \
            -dimensional_template dimensional \
            -resource_dir /packages/openacs-w3css-theme/resources \
            -streaming_head tabbed-streaming-head
    }
}

ad_proc -private openacs_w3css_theme::apm::before_uninstall {} {
    Uninstall the package
} {
    if {[subsite::get_theme] eq "openacs_w3css"} {
        subsite::set_theme -theme default_plain
    }
    subsite::delete_subsite_theme -key openacs_w3css
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
