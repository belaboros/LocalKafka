#!/bin/bash

KAFKA_VER=kafka_2.11-2.1.0


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"
cd ${SCRIPT_DIR}

KAFKA_DOWNLOAD_PATH=${SCRIPT_DIR}/${KAFKA_VER}.tgz


if [ ! -f ${KAFKA_DOWNLOAD_PATH} ]; then
    echo "Local kafka not found: ${KAFKA_DOWNLOAD_PATH}"
    wget http://apache.40b.nl/kafka/2.1.0/${KAFKA_VER}.tgz 
else
    echo "Using previously downloaded kafka: ${KAFKA_DOWNLOAD_PATH}"
fi


if [ ! -f ~/${KAFKA_VER} ]; then
    echo "Extracting Kafka into ~/"
    tar -xzf ${KAFKA_DOWNLOAD_PATH} -C ~/
    ln -s ~/${KAFKA_VER} ~/kafka

    rm -rf ${SCRIPT_DIR}/../../kafka.properties
    echo "KAFKA_HOME=~/kafka" > ${SCRIPT_DIR}/../../kafka.properties
    echo "ZOOKEEPER_HOST=localhost:2181" >> ${SCRIPT_DIR}/../../kafka.properties
    echo "KAFKA_BROKER_LIST=localhost:9092" >> ${SCRIPT_DIR}/../../kafka.properties
else
    echo "Previous Kafka installation detected: ~/${KAFKA_VER}"
fi

