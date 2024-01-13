#!/bin/bash
NUMBER1=$1
NUMBER2=$2

SUM=$((NUMBER1+NUMBER2))
echo "Addition is: $SUM"

DIFF=$((NUMBER1-NUMBER2))
echo "Difference is: $DIFF"

MUL=$((NUMBER1*NUMBER2))
echo "Multiplication is: $MUL"

DIV=$((NUMBER2/NUMBER1))
echo "Division is: $DIV"