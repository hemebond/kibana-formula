{%- set major_version = salt['pillar.get']('kibana:major_version', 5) %}

include:
  - elasticsearch.repo

{% from "kibana/map.jinja" import kibana with context %}

kibana_pkg:
  pkg.installed:
    - name: {{ kibana.pkg }}
    - version: {{ major_version }}.*
    - require:
      - sls: elasticsearch.repo
