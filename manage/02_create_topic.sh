#!/bin/bash 

TOPIC_NAME=${1:-test}
NUM_PARTITIONS=${2:-1}
NUM_REPLICATION_FACTOR=${3:-1}

echo "Creating Kafka topic: name:\"${TOPIC_NAME}\"; number of partitions: ${NUM_PARTITIONS}; replication factor: ${NUM_REPLICATION_FACTOR}"



SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"
source ${SCRIPT_DIR}/../kafka.properties



${KAFKA_HOME}/bin/kafka-topics.sh --create --zookeeper ${ZOOKEEPER_HOST} --replication-factor ${NUM_REPLICATION_FACTOR} --partitions ${NUM_PARTITIONS} --topic ${TOPIC_NAME}

