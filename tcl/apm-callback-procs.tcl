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

        set theme_colors [::openacs_w3css_theme_color::colors]

        foreach color $theme_colors {
            set css [subst -nocommands {
                {-href /resources/acs-subsite/site-master.css -media all -order 0}
                {-href urn:ad:css:w3css -media all -order 1}
                {-href urn:ad:css:w3theme-$color -media all -order 2}
                {-href /resources/acs-templating/forms.css -media all -order 4}
                {-href /resources/acs-templating/lists.css -media all -order 5}
            }]
            subsite::new_subsite_theme \
                -create_or_replace \
                -key openacs_w3css_$color \
                -name #openacs-w3css-theme.${color}_theme# \
                -template tabbed-master \
                -css $css \
                -js {} \
                -form_template standard \
                -list_template table \
                -list_filter_template filters \
                -dimensional_template dimensional \
                -resource_dir /packages/openacs-w3css-theme/resources \
                -streaming_head tabbed-streaming-head
        }

    }
}

ad_proc -private openacs_w3css_theme::apm::before_uninstall {} {
    Uninstall the package
} {
    if {[string match openacs_w3css* [subsite::get_theme]]} {
        subsite::set_theme -theme default_plain
    }
    foreach theme [db_list get_themes {
        select key from subsite_themes where key like 'openacs_w3css%'
    }] {
        subsite::delete_subsite_theme -key $theme
    }
}

ad_proc -private openacs_w3css_theme::apm::after_upgrade {
    -from_version_name
    -to_version_name
} {
    Upgrade logics
} {
    apm_upgrade_logic \
	-from_version_name $from_version_name \
	-to_version_name $to_version_name \
	-spec {
	    2.0.1 2.1.0 {
                set in_use_p [expr {[subsite::get_theme] eq "openacs_w3css"}]
                if {$in_use_p} {
                    subsite::set_theme -theme default_plain
                }
                subsite::delete_subsite_theme -key openacs_w3css
                openacs_w3css_theme::apm::after_install
                if {$in_use_p} {
                    subsite::set_theme -theme openacs_w3css_grey
                }
	    }
        }
}


# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
