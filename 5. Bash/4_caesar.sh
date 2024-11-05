# Write caesar cipher script accepting three parameters -s <shift> -i <input file> -o <output file>
#

usage() {
	echo "Usage: $0 -s <shift> -i <input file> -o <output file>"
	exit 1
}

shift_text() {
	local text=$1
	local shift=$2

	local shifted=""
	local character=""
	local ascii=0

	for ((i = 0; i < ${#text}; i++)); do
		character="${text:$i:1}"
		ascii=$(printf "%d" "'$character")

		if [ $ascii -ge 65 ] && [ $ascii -le 90 ]; then
			ascii=$((ascii + shift))
			if [ $ascii -gt 90 ]; then
				ascii=$((ascii - 26))
			fi
		elif [ $ascii -ge 97 ] && [ $ascii -le 122 ]; then
			ascii=$((ascii + shift))
			if [ $ascii -gt 122 ]; then
				ascii=$((ascii - 26))
			fi
		fi

		shifted="${shifted}$(printf \\$(printf '%03o' $ascii))"
	done

	echo $shifted
}

while getopts ":s:i:o:" opt; do
	case $opt in
	s)
		shift=$OPTARG
		;;
	i)
		input_file=$OPTARG
		;;
	o)
		output_file=$OPTARG
		;;
	\?)
		echo "Invalid option: $OPTARG"
		usage
		;;
	:)
		echo "Option -$OPTARG requires an argument."
		usage
		;;
	esac
done

if [ -z $shift ] || [ -z $input_file ] || [ -z $output_file ]; then
	usage
fi

if [ ! -f $input_file ]; then
	echo "Input file does not exist."
	exit 1
fi

source_text=$(cat $input_file)
new_text=$(shift_text "$source_text" $shift)
echo $new_text >$output_file

echo "Encrypted text written to $output_file"
