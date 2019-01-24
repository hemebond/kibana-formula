{% from "kibana/map.jinja" import kibana with context %}


include:
  - kibana.pkg
  - kibana.config


kibana_service:
  service.running:
    - name: kibana
    - enable: True
{%- if "config" in kibana %}
    - watch:
      - file: kibana_cfg
{%- endif %}
    - require:
      - pkg: kibana
