{% if theme.disqus_shortname %}
    {% include "_comments/disqus.swig" %}
  {% elseif theme.changyan and theme.changyan.appid and theme.changyan.appkey %}
    {% include "_comments/changyan.swig" %}
  {% elseif theme.valine.appid and theme.valine.appkey %}
    {% include "_comments/valine.swig" %}
  {% endif %}