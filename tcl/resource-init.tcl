#
# Register some URNs that we are providing for sharing.
#
::util::resources::register_urns -prefix openacs_w3css_theme

::template::CSS registerCSSclasses w3css {
    action "w3-button w3-border w3-round w3-text-theme"
    btn-default "w3-button w3-border w3-round w3-theme-l3"
    bulk-action "w3-button w3-border w3-round w3-text-theme"
    checkbox-inline w3-check
    close "w3-button w3-border w3-theme"
    cog gear
    form-action "w3-button w3-border w3-round w3-text-theme"
    margin-form ""
    navbar-default "w3-sidebar w3-bar-block w3-theme-l1 w3-card"
    navbar-right "w3-sidebar w3-bar-block w3-theme-l1 w3-card"
    print printer
    radio-inline w3-radio
    card "w3-card w3-margin"
    card-header "w3-container w3-theme-l1"
    card-body "w3-container"
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
