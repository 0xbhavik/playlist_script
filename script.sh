#! /bin/bash
func() {
    local target_sum=$1
    local index=$2
    local current_sum=$3

    if [ $current_sum -eq $target_sum ]; then
        echo  "${subset[*]}"
        return
    fi

    if [ $index -eq ${#array[@]} ] || [ $current_sum -gt $target_sum ]; then
        return
    fi

    subset+=("${array[$index]}")
    func $target_sum $((index + 1)) $((current_sum + array[$index]))

    unset 'subset[${#subset[@]}-1]'
    func $target_sum $((index + 1)) $current_sum
}


echo "how many songs you want to listen"
read  songs
echo $songs

echo "here are your songs:"

array=()

for i in $(seq 1 $songs);
do
mins=$(($RANDOM%6))
secs=$(($RANDOM%60))
echo "$mins min $secs sec"

x=$((($mins*60) +$secs))
echo $x
array+=("$x")
done

echo "how many secs you want to listen"
read target_sum

subset=()
func $target_sum 0 0
