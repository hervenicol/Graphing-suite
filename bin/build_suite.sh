#!/bin/bash

##########################
# Builds a graphing suite
# as described on
# https://github.com/hervenicol/Graphing-suite
##########################

# Autodetected, but can be overridden here
# work_dir=/home/me/git/Graphing-suite



setup_base_env() {
	[[ -d "$workdir" ]] || work_dir="$(readlink -f "$(dirname "$(readlink -f "$0")")/../")"
}


install_collectd() {
	dnf install collectd

	# Setup collectd
}

download_dependencies() {
	mkdir -p "$work_dir"/downloads
	wget -nv -O "$work_dir"/downloads/start_influxdb.sh https://github.com/hervenicol/docker-influxdb/raw/master/start.sh
	wget -nv -O "$work_dir"/downloads/start_grafana.sh https://github.com/hervenicol/docker-grafana/raw/master/start.sh
}

run_influxdb() {
	"$work_dir"/downloads/start_influxdb.sh
}

run_grafana() {
	"$work_dir"/downloads/start_grafana.sh
}



setup_base_env
echo $work_dir

echo "Downloading dependencies"
download_dependencies


