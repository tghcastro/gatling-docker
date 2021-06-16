#!/bin/bash

echo "Preparing runner configuration"
SIMULATION=perftest.ExampleSimulation
TEST_REPORT=/opt/gatling/test-report

mkdir -p $TEST_REPORT

echo "Starting gatling"
gatling.sh --simulation $SIMULATION

echo "Extracting report"
mv /opt/gatling/results/* $TEST_REPORT/report

zip -r $TEST_REPORT/perf-report.zip $TEST_REPORT/report/