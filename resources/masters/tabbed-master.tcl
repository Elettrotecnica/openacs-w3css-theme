# Set the tabs then use the plain master to render the page.

subsite_navigation::define_pageflow -navigation_multirow navigation -group main -subgroup sub -include_all \
    -show_applications_p [parameter::get -package_id [ad_conn subsite_id] -parameter ShowApplications -default 1] \
    -no_tab_application_list [parameter::get -package_id [ad_conn subsite_id] -parameter NoTabApplicationList -default ""] \
    -initial_pageflow [parameter::get -package_id [ad_conn subsite_id] -parameter UserNavbarTabsList -default ""]

#set subsite_logo "/resources/openacs-w3css-theme/images/openacs2_xs.png"
set subsite_logo ""


# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
