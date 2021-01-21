#!/bin/bash

isFullTime=1
isPartTime=2
employeeRate=20
randomCheck=$((RANDOM%3))
if [[ $randomCheck -eq $isFullTime ]]
then
      echo Fulltime
      employeeHrs=8
elif [[ $randomCheck -eq $isPartTime ]]
then
      echo Parttime
      employeeHrs=4
else
      echo absent
      employeeHrs=0
fi

wage=$(( $employeeHrs*$employeeRate ))
echo "Wage = $wage"

