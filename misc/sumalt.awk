BEGIN {
    FS = ","
    print "Week_end,Indicator,High_industry,Value"
    sum = 0
    agri =0
    bank =0 
    rail =0 
    film = 0 
    manufac =0 
}
/Agriculture/{
    sum+=$4
    print $0
    agri+=$4
}
/Banking/{
    sum+=$4
    print $0
    bank+=$4
}
/Film/{
    sum+=$4
    print $0
    film+=$4
}
/Manufacturing/{
    sum+=$4
    print $0
    manufac+=$4
}
/Railways/{
    sum +=$4
    print $0
    rail += $4
}
END{
    print "====="
    printf "Net : %s\n",sum
    printf "Agriculture : %s\n",agri
    printf "Banking : %s\n",bank
    printf "Film : %s\n",film
    printf "Manufacturing : %s\n",manufac 
    printf "Railways : %s\n",rail
}
