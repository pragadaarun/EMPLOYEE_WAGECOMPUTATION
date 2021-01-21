#!/bin/bash

isPartTime=1
isFullTime=2
maxHrsPerMonth=100
empRatePerHr=20
numWorkingDays=20

totalEmpHours=0
totalWorkingDays=0

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

while [[ $totalEmpHours -le $maxHrsPerMonth && $totalWorkingDays -le $numWorkingDays ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3));
	empHrs="$( getWorkHrs  $empCheck )"
	totalEmpHours=$(($totalEmpHours+$empHrs))
done

totalSalary=$(($totalEmpHours*$empRatePerHr));
echo "TOTAL EMPLOYEE WORKED HOURS=$totalEmpHours"
echo "TOTAL SALARY=$totalSalary"
