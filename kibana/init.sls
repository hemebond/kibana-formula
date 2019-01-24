{% from "kibana/map.jinja" import kibana with context %}

include:
  - kibana.pkg
  - kibana.config
  - kibana.service
