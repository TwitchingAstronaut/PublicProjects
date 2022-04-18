#! /bin/bash

HOSTS='./hosts'

APPEND()
{
    cp $HOSTS $HOSTS.bak
    echo $1 $2 >> $HOSTS
}

REMOVE()
{
    cp $HOSTS $HOSTS.bak
    sed -i '/'$1'/d' $HOSTS
}

PRINT()
{
    cat $HOSTS
}

USAGE_INFO()
{    
    echo "Usage info:"
    echo "-h shows this help file"
    echo -e "-a Appends an entry to the Hosts file"
    echo -e "$0 -a <IPAddress Hostname>"
    echo -e "-d Removes an entry from the Hosts file"
    echo -e "$0 -d <IPAddress Hostname>"
    echo -e "-p Prints the Hosts file"
    echo -e "$0 -p"

}

if [[ $1 == "-h" || $1 == "" ]]; then USAGE_INFO
    elif [[ $1 == "-a" ]]; then APPEND $2 $3
    elif [[ $1 == "-d" ]]; then REMOVE $2 $3
    elif [[ $1 == "-p" ]]; then PRINT
fi
