{% if page.comments and not is_home() %}
  <div class="comments" id="comments">
    {% if theme.valine.appid and theme.valine.appkey %}
      <div id="vcomments"></div>  
    {% endif %}
  </div>
{% endif %}
