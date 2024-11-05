# Write script with following functionality:
#
#   If -v tag is passed, replaces lowercase characters with uppercase and vise versa
#   If -s is passed, script substitutes <A_WORD> with <B_WORD> in text (case sensitive)
#   If -r is passed, script reverses text lines
#   If -l is passed, script converts all the text to lower case
#   If -u is passed, script converts all the text to upper case
#   Script should work with -i <input file> -o <output file> tags
#

mode=""

while getopts "vsluri:o:" opt
do
    case $opt in
        v) mode="${mode}v" ;;
				s) mode="${mode}s" ;;
				r) mode="${mode}r" ;;
				l) mode="${mode}l" ;;
				u) mode="${mode}u" ;;
        i) input_file=$OPTARG ;;
        o) output_file=$OPTARG ;;
    esac
done

if [ ${#mode} -ne 1 ]; then
		echo "Error: only one mode can be used"
		exit 1
fi

if [ -z $input_file ] || [ -z $output_file ]; then
		echo "Error: input and output files must be specified"
		exit 1
fi

if [ ! -f $input_file ]; then
		echo "Error: input file does not exist"
		exit 1
fi

if [ -f $output_file ]; then
		echo "Error: output file already exists"
		exit 1
fi

case $mode in
		v)
				cat $input_file | tr '[:upper:][:lower:]' '[:lower:][:upper:]' > $output_file
				;;
		s)
				read -p "Enter word A: " wordA
				read -p "Enter word B: " wordB
				cat $input_file | sed "s/$wordA/$wordB/g" > $output_file
				;;
		r)
				cat $input_file | rev > $output_file
				;;
		l)
				cat $input_file | tr '[:upper:]' '[:lower:]' > $output_file
				;;
		u)
				cat $input_file | tr '[:lower:]' '[:upper:]' > $output_file
				;;
esac

