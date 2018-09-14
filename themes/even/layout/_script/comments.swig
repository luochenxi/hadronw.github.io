{% if !is_home() and !is_archive() %}
  {% include "_comments/valine.swig" %}
{% endif %}
