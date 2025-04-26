BEGIN{
    FS = ","; # Input field separator is a comma
    OFS = "\t"; # Output field separator is a tab
    RS = "\n"; # Input record separator (default is newline)
    ORS = "\n"; # Output record separator (default is newline)
    sum=0;
     print "Week_end,Indicator,High_industry,Value";
}
NR >= 2 {
    print $0
    sum+=$4;
    array[$3]+=$4;
}
END{
    print "=====";
    printf "Net : %s\n",sum
    asorti(array,sorted);
    for(i=1;i<=length(sorted);i++){
        key = sorted[i];
        printf "%s : %s\n",key,array[key];
    }
}

