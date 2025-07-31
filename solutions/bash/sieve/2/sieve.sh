limit=$1
output=""

if (( limit >= 2 )); then
    output="2"
fi

for (( i=3; i<=limit; i+=2 )); do
    is_prime=1
    for (( j=3; j*j<=i; j+=2 )); do
        if (( i % j == 0 )); then
            is_prime=0
            break
        fi
    done
    if (( is_prime == 1 )); then
        output+=" $i"
    fi
done

echo "$output"