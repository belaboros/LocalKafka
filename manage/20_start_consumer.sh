#!/bin/bash 

TOPIC_NAME=${1:-test}


echo "Consuming messages. Topic name:\"${TOPIC_NAME}\" "



SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"
source ${SCRIPT_DIR}/../kafka.properties


cd ${KAFKA_HOME}
bin/kafka-console-consumer.sh --bootstrap-server ${KAFKA_BROKER_LIST} --topic ${TOPIC_NAME} --from-beginning



