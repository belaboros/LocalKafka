#!/bin/bash 

MESSAGE=${1:-DEFAULT}
COUNT=${2:-10}
DELAY_IN_SEC=${3:-0.2}
TOPIC_NAME=${4:-test}


echo "Sending messages into topic. Topic name:\"${TOPIC_NAME}\"; message: ${MESSAGE}; message count:${COUNT} delay in sec: ${DELAY_IN_SEC}"



SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" #"
source ${SCRIPT_DIR}/../kafka.properties




for (( c=1; c<=${COUNT}; c++ ))
do
    echo "$c. sending message"
    if [ "${MESSAGE}" == "DEFAULT" ]; then
        ${SCRIPT_DIR}/10_send_message.sh 
    else
        ${SCRIPT_DIR}/10_send_message.sh ${MESSAGE} ${TOPIC_NAME} 
    fi
    sleep ${DELAY_IN_SEC}
done




#${KAFKA_HOME}/bin/kafka-console-producer.sh --broker-list ${KAFKA_BROKER_LIST} --topic ${TOPIC_NAME}


