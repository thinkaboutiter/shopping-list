#!/bin/bash
set -e

LOGS_DIR="/opt/ShoppingList/Sources/ShoppingList/logs"
if [ ! -d ${LOGS_DIR} ]; then
mkdir ${LOGS_DIR}
fi

FILE_NAME="application.log"
if [ ! -f "${LOGS_DIR}/${FILE_NAME}" ]; then
touch "${LOGS_DIR}/${FILE_NAME}"
fi

exec "$@"