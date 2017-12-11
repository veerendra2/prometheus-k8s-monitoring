#!/usr/bin/env bash
python /opt/update_config.py
/opt/prometheus/prometheus --config.file=/opt/prometheus/prometheus.yml