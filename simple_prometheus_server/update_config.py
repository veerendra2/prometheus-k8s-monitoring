#!/usr/bin/env python2
import yaml
import os
import io
import json

try:
    API_SERVER = os.environ['api']
    USERNAME = os.environ['username']
    PASSWORD = os.environ['password']
except KeyError:
    print "[!] Environmental variables wasn't set!"
    exit(1)


def read_yaml(file_name):
    if not os.path.exists(file_name):
        print "{} not found! Please check.".format(file_name)
        exit(1)
    with open(file_name) as f:
        data = yaml.load(f)
    return data


def write_yaml(data, yaml_file):
    with io.open(yaml_file, 'w', encoding='utf8') as outfile:
        yaml.dump(data, outfile, default_flow_style=False, allow_unicode=True)

data = {
    "relabel_configs": [
            {"source_labels": [
                  "__meta_kubernetes_pod_name"
               ],
               "target_label": "container_label_io_kubernetes_pod_name"
            },
            {
               "source_labels": [
                  "__meta_kubernetes_namespace"
               ],
               "target_label": "container_label_io_kubernetes_pod_namespace"
            },
            {
               "source_labels": [
                  "__meta_kubernetes_pod_container_port_number"
               ],
               "target_label": "container_label_port"
            }
         ],
    "job_name": "kubernetes",
    "kubernetes_sd_configs": [
            {
               "api_server": None,
               "role": "pod",
               "basic_auth": {
                  "username": None,
                  "password": None
               },
               "tls_config": {
                  "insecure_skip_verify": True
               }
            }
         ]
}

data["kubernetes_sd_configs"][0]["api_server"] = API_SERVER
data["kubernetes_sd_configs"][0]["basic_auth"]["username"] = USERNAME
data["kubernetes_sd_configs"][0]["basic_auth"]["password"] = PASSWORD
json_data = read_yaml("/opt/prometheus/prometheus.yml")
json_data["scrape_configs"].append(data)
write_yaml(json_data, "/opt/prometheus/prometheus.yml")