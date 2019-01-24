{% from "kibana/map.jinja" import kibana with context %}


include:
  - kibana.pkg


{%- if "config" in kibana %}
kibana_cfg:
  file.serialize:
    - name: /etc/kibana/kibana.yml
    - dataset: {{ kibana.config | yaml }}
    - formatter: yaml
    - user: root
    - require:
      - sls: kibana.pkg


{%-   if 'path' in kibana.config %}
{%-     for dir in (kibana.config.path.data, kibana.config.path.logs) %}
{%-       if dir %}
{{ dir }}:
  file.directory:
    - user: kibana
    - group: kibana
    - mode: 0700
    - makedirs: True
{%-       endif %}
{%-     endfor %}
{%-   endif %}

{%- endif %}