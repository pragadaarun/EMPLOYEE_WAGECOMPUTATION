#!/bin/bash

isPartTime=1
isFullTime=2
maxHrsPerMonth=100
empRatePerHr=20
numWorkingDays=20

totalEmpHours=0
totalWorkingDays=0

declare -A dailyWage

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

while [[ $totalEmpHours -lt $maxHrsPerMonth && $totalWorkingDays -lt $numWorkingDays ]]
do
	((totalWorkingDays++))
	empCheck=$((RANDOM%3))
	empHrs="$( getWorkHrs  $empCheck )"
	totalEmpHours=$(($totalEmpHours+$empHrs))
	dailyWage["$totalWorkingDays"]="$( getEmpWage $empHrs )"
done

totalSalary=$(($totalEmpHours*$empRatePerHr))

for (( day=1;day<=${#dailyWage[@]};day++ ))
do
	echo "Day ${!dailyWage[$day]} - ${dailyWage[$day]}"
done
echo "TOTAL EMPLOYEE HOURS = $totalEmpHours"
echo "TOTAL SALARY = $totalSalary"
