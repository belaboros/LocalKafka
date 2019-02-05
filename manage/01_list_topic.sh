#!/bin/bash 


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"
source ${SCRIPT_DIR}/../kafka.properties


${KAFKA_HOME}/bin/kafka-topics.sh --list --zookeeper ${ZOOKEEPER_HOST}



