#!/bin/bash
echo ""
inputEmail(){
    while true
    do
        read -p "Enter E-Mail : " email
        if [[ "$email" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]; then
                echo 'Ok'
                emailEncrypt "${email}"
                break
        else
            echo 'Invalid E-Mail format. Try again'
        fi
    done
}

#encript MD5&SHA256
emailEncrypt(){
    email=$1
    out=$(echo -n $email | openssl dgst -MD5 -hex | openssl dgst -SHA256 -hex)
    out=${out#*= }
    /bin/touch /home/test.txt > /dev/null 2>&1
    echo -n "${out}" > /home/test.txt
    #echo "enc out :" ${out}
}
