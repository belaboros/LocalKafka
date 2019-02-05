#!/bin/bash 

MESSAGE=${1:-sample-message-$(date +"%Y-%m-%d_%H-%M-%S")}
TOPIC_NAME=${2:-test}


echo "Sending message into topic. Topic name:\"${TOPIC_NAME}\"; message: ${MESSAGE}"



SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"
source ${SCRIPT_DIR}/../kafka.properties



echo ${MESSAGE} | ${KAFKA_HOME}/bin/kafka-console-producer.sh --broker-list ${KAFKA_BROKER_LIST} --topic ${TOPIC_NAME}


