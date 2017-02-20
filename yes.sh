if [ $# == 0 ]
then
    while :
    do
        echo "y"
    done
else
    while :
    do
        for i in "$@"
        do
            echo -n "$i "
        done
        echo ""
    done
fi
