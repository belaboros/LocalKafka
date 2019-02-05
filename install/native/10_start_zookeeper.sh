#!/bin/bash 


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"
source ${SCRIPT_DIR}/../../kafka.properties


cd ${KAFKA_HOME}
bin/zookeeper-server-start.sh config/zookeeper.properties

