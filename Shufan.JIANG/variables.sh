#!/bin/bash
export AWS_ACCESS_KEY_ID=AKIAJPSA5QJZWA6IFARA
export AWS_SECRET_ACCESS_KEY=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
export OUTPUT_BATCH_INTERVAL=3600
export OUTPUT_DIR=/home/sufian/spark_proj/spark-twitter-collection/tmp
echo "AWS_SECRET_ACCESS_KEY = " $AWS_SECRET_ACCESS_KEY
echo "AWS_ACCESS_KEY_ID = " $AWS_ACCESS_KEY_ID
echo "$OUTPUT_DIR = " $OUTPUT_DIR
echo "OUTPUT_BATCH_INTERVAL = " $OUTPUT_BATCH_INTERVAL

#sbt/sbt run

#What's the life period of the variables?
#just during the excution of this script? How to extend it (make it permanent?)