<div class="dimensional dimensional-list">
  <ul class="w3-ul">
    <multiple name="dimensional">
      <li>
        <span style="font-weight:bold">@dimensional.label@</span>
        <group column="key">
          <if @dimensional.selected@ true>
            <span
              class="w3-button w3-round w3-light-grey w3-border">@dimensional.group_label@</span>
          </if>
          <else>
            <a
              class="w3-button w3-round w3-white w3-border"
              href="@dimensional.href@">@dimensional.group_label@</a>
          </else>
        </group>
      </li>
    </multiple>
  </ul>
</div>

