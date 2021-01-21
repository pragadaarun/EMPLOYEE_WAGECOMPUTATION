#!/bin/bash

isPartTime=1
isFullTime=2
maxHrsPerMonth=100
empRatePerHr=20
numWorkingDays=20

totalEmpHr=0
totalWorkingDays=0

while [[ $totalEmpHr -le $maxHrsPerMonth && $totalWorkingDays -le $numWorkingDays ]]
do
   ((totalWorkingDays++))
   empCheck=$((RANDOM%3))
	case $empCheck in
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
   totalEmpHrs=$(($totalEmpHrs+$empHrs))
done

totalSalary=$(($totalEmpHrs*$empRatePerHr));
echo "TOTAL EMPLOYEE WORKED HOURS=$totalEmpHrs"
echo "TOTAL SALARY=$totalSalary"

