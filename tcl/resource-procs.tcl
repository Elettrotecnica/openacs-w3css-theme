namespace eval openacs_w3css_theme {
    variable parameter_info
    #
    # The version configuration can be tailored via the OpenACS
    #
    set parameter_info {
        package_key openacs-w3css-theme
        parameter_name W3CSSVersion
        default_value 4.1.0
    }

    ad_proc -private ::openacs_w3css_theme::resource_info {
        {-version ""}
    } {

        Get information about available version(s) of the w3-css
        packages. The goal is to deliver resources either from the
        local filesystem, or from CDN.

        @return dict containing resourceDir, resourceName, cdn,
                cdnHost, prefix, cssFiles, jsFiles and extraFiles.

    } {
        variable parameter_info

        if {$version eq ""} {
            dict with parameter_info {
                set version [::parameter::get_global_value \
                                 -package_key $package_key \
                                 -parameter $parameter_name \
                                 -default $default_value]
            }
        }

        #
        # Provide paths for loading either via /resources/ or CDN
        #
        #   "resourceDir" is the absolute path in the filesystem
        #   "versionSegment" is the version-specific element both in the
        #                URL and in the filesystem.
        #
        set resourceDir    [acs_package_root_dir openacs-w3css-theme/www/resources/w3-css]
        set versionSegment $version
        set cdn            //cdnjs.cloudflare.com/ajax/libs/w3-css

        if {[file exists $resourceDir/$versionSegment]} {
            set prefix  /resources/openacs-w3css-theme/w3-css/$version
            set cdnHost ""
            set cspMap ""
        } else {
            #
            # Use CDN
            #
            set prefix $cdn/$version
            set cdnHost cdnjs.cloudflare.com
            dict set cspMap urn:ad:css:w3css style-src $cdnHost
            dict set cspMap urn:ad:css:w3css font-src $cdnHost
        }

        lappend result \
            resourceName "W3.CSS" \
            resourceDir $resourceDir \
            versionSegment $versionSegment \
            cdn $cdn \
            cdnHost $cdnHost \
            prefix $prefix \
            cssFiles {w3.min.css} \
            jsFiles  {} \
            extraFiles {} \
            urnMap {
                urn:ad:css:w3css w3.min.css
            } \
            cspMap $cspMap \
            versionCheckAPI {cdn cdnjs library w3-css count 1} \
            vulnerabilityCheck {service snyk library w3-css} \
            parameterInfo $parameter_info \
            configuredVersion $version

        return $result
    }
}

# Local variables:
#    mode: tcl
#    tcl-indent-level: 4
#    indent-tabs-mode: nil
# End:
