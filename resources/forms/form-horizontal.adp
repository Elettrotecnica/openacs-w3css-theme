<div class="w3-container">
  <multiple name="elements">
    <if @elements.section@ not nil>
      <fieldset id="@elements.form_id;noi18n@:@elements.section;noi18n@"
                @elements.sec_fieldset;noquote@><!-- section fieldset -->
        <legend @elements.sec_legend;noquote@>
          <a name='@elements.section;noi18n@'>@elements.sec_legendtext@</a>
        </legend>
    </if>

    <div class="w3-row">
      <group column="section">
        <if @elements.widget;literal@ eq "hidden">
          <noparse><div><formwidget id="@elements.id@"></div></noparse>
        </if>
        <else>
          <div class="w3-col w3-container m6 l3">

            <if @elements.widget;literal@ eq "submit">
              <div class="w3-panel w3-bar">
                <group column="widget">
                  <noparse><formwidget
                             id="@elements.id@"
                             class="w3-button w3-round w3-light-grey w3-border">&nbsp;</noparse>
                </group>
              </div>
            </if>

            <else>
              <noparse>
	        <formerror id="@elements.id@">
                  <if \@formerror.@elements.id@\@ not nil>
                    <script <if @::__csp_nonce@ not nil> nonce="@::__csp_nonce;literal@"</if>>
                      window.addEventListener('load', () => {
                          const el = document.getElementById(`@elements.id@`);
                          el.setCustomValidity(`\@formerror.@elements.id@\@`);
                          el.addEventListener('input', () => {
                              el.setCustomValidity('');
                              el.classList.remove('w3-pale-red');
                          });
                          el.reportValidity();
                          el.classList.add('w3-pale-red');
                      });
                    </script>
                  </if>
	        </formerror>
	      </noparse>

	      <if @elements.widget;literal@ in radio checkbox and @elements.legendtext@ defined>
	        <fieldset @elements.fieldset;noi18n@>
                  <!-- radio button groups and checkbox groups get their own fieldsets -->
	          <legend @elements.legend;oni18n@><span>@elements.legendtext@</span></legend>
	      </if>

              <if @elements.label@ not nil>
	        <noparse>
                  <if @form_properties.mode;literal@ eq "display" or
                      @elements.widget;literal@ in "radio" "checkbox" "date" "inform">
                    <!-- no label tag -->
                  </if>
                  <else>
	            <label for="@elements.id@">
                  </else>

                  <span class="form-label">
                </noparse>

                <b>@elements.label;noquote@</b>

                <if @form_properties.show_required_p;literal@ true>
                  <if @elements.optional@ nil and
                      @elements.mode;literal@ ne "display" and
                      @elements.widget;literal@ ne "inform">
                    <strong class="form-required-mark">(#acs-templating.required#)</strong>
                  </if>
                </if>
                </span><!-- form-label -->
                <if @form_properties.mode;literal@ eq "display" or
                    @elements.widget;literal@ in "radio" "checkbox" "date" "inform">
                  <!-- no label tag -->
                </if>
                <else>
                </label>
                </else>

	      </if>
	      <else>
                <if @form_properties.show_required_p;literal@ true>
                  <if @elements.optional@ nil and
                      @elements.mode;literal@ ne "display" and
                      @elements.widget;literal@ ne "inform">
	            <span class="form-label form-required-mark">
		      #acs-templating.required#
	            </span>
	          </if>
	        </if>
	      </else>

              <noparse>
	        <if @elements.widget;literal@ eq "checkbox">
                  <formgroup id="@elements.id@" class="w3-check">
                    <div class="form-check">
                      \@formgroup.widget;noquote@
		      <label class="form-check-label"
                             for="@elements.form_id@:elements:@elements.id@:\@formgroup.option@">
		        \@formgroup.label;noquote@
		      </label>
		    </div>
	          </formgroup>
                </if>
	        <elseif @elements.widget;literal@ eq "radio">
                  <formgroup id="@elements.id@" class="w3-radio">
                    <div class="form-radio">
                      \@formgroup.widget;noquote@
		      <label class="form-radio-label"
                             for="@elements.form_id@:elements:@elements.id@:\@formgroup.option@">
		        \@formgroup.label;noquote@
		      </label>
		    </div>
	          </formgroup>
                </elseif>
                <elseif @elements.widget;literal@ in select>
                  <if @elements.mode;literal@ ne "display" and
                      @elements.widget;literal@ ne "inform">
                    <formwidget id="@elements.id@" class="w3-select">
                  </if>
                  <else>
                    <formwidget id="@elements.id@" class="w3-select w3-light-gray">
                  </else>
                </elseif>
                <else>
                  <if @elements.mode;literal@ ne "display" and
                      @elements.widget;literal@ ne "inform">
                    <formwidget id="@elements.id@" class="w3-input w3-border">
                  </if>
                  <else>
                    <formwidget id="@elements.id@" class="w3-input w3-border w3-light-gray">
                  </else>
                </else>
              </noparse>

              <if @elements.help_text@ not nil>
  	        <adp:icon name="form-info-sign">&nbsp;
                  <noparse><formhelp id="@elements.id@"></noparse>
              </if>

	      <if @elements.widget;literal@ in radio checkbox and  @elements.legendtext@ defined>
                <!-- radio button groups and checkbox groups get their own fieldsets -->
	      </fieldset>
              </if>
            </else>
          </div>
        </else>
      </group>
    </div>

    <if @elements.section@ not nil>
    </fieldset> <!-- section fieldset -->
    </if>
  </multiple>
</div>
