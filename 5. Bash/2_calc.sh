#!/bin/bash
# 
# Write bash script accepting operation parameter (“-”, “+”, “*”, “%”), sequence of numbers and debug flag.
# For example:
#
#   ./your_script.sh -o % -n 5 3 -d > Result: 2
#   ./your_script.sh -o + -n 3 5 7 -d > Result: 15
#
# If -d flag is passed, script must print additional information:
#
#   User: <username of the user running the script>
#   Script: <script name>        
#   Operation: <operation>
#   Numbers: <all space-separated numbers>
#

#! task description doesn't use quotes for the sequence of numbers,
#! but optargs will parse them as a single argument if not quoted

operation=""
numbers=()
debug=""

while getopts "o:n:d" opt; do
  case $opt in
    o)
      operation=$OPTARG
      ;;
    n)
      numbers=($OPTARG)
      ;;
    d)
      debug="true"
      ;;
		:)
			echo "Option -$OPTARG requires an argument."
			exit 1
			;;
		?)
			echo "Invalid option: $OPTARG"
			exit 1
			;;
  esac
done

if [ -z "$operation" ] || [ ${#numbers[@]} -eq 0 ]; then
  echo "Operation or numbers are not provided"
  exit
fi

if [[ ! $operation =~ ^[\+\-\*\%]$ ]]; then
	echo "Operation is not supported"
	exit 1
fi

result=${numbers[0]}

for (( i=1; i<${#numbers[@]}; i++ )); do
  case $operation in
    +)
      result=$(($result + ${numbers[$i]}))
      ;;
    -)
      result=$(($result - ${numbers[$i]}))
      ;;
    \*)
      result=$(($result * ${numbers[$i]}))
      ;;
    %)
      result=$(($result % ${numbers[$i]}))
      ;;
    *)
      echo "Operation is not supported"
      exit
      ;;
  esac
done

if [ ! -z $debug ]; then
  echo "User: $USER"
  echo "Script: $0"
  echo "Operation: $operation"
  echo "Numbers: ${numbers[@]}"
fi

echo "Result: $result"