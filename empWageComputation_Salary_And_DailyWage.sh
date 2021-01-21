#!/bin/bash

isPartTime=1
isFullTime=2
maxHrsPerMonth=100
empRatePerHr=20
numWorkingDays=20

totalEmpHours=0;
totalWorkingDays=0;

function getWorkHrs() {
   case $1 in
      $isFullTime)
         empHrs=8
      ;;
      $isPartTime)
         empHrs=4
      ;;
      *)
         empHrs=0
      ;;
   esac
   echo $empHrs
}

function getEmpWage() {
	wage=$(($1*$empRatePerHr))
	echo $wage
}

while [[ $totalEmpHours -le $maxHrsPerMonth && $totalWorkingDays -le $numWorkingDays ]]
do
   ((totalWorkingDays++))
   empCheck=$((RANDOM%3));
   empHrs="$( getWorkHrs  $empCheck )"
   totalEmpHours=$(($totalEmpHours+$empHrs))
   dailyWage[$totalWorkingDays]="$( getEmpWage $empHrs )"
done

totalSalary=$(($totalEmpHours*$empRatePerHr))

echo "Daily Wages are ${dailyWage[@]}"
echo "TOTAL EMPLOYEE HOURS=$totalEmpHours"
echo "TOTAL SALARY = $totalSalary"
