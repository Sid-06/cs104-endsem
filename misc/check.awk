BEGIN{
    FS = " ";  # Input field separator is a comma
    RS = "\n";  # Input record separator (default is newline)
    ORS = "\n"; # Output record separator (default is newline)
    string="";
    ans="YES";
    for(i=0;i<NUM_MAS;i++){
        Master[i]=1;
    }
    for(i=0;i<NUM_WOR;i++){
        Worker[i]=1;
    }
}

/Produced/{
        buffer+=1;
        if(Master[$5]==1){
            if(item[$2]==0){
                item[$2]+=1;
                string = string " " $2;
                print string;
            }else if(item[$2]==1){
                print string;
                ans="NO";
            }

        }else{
            ans = "NO";
            print string;
        }
}


/Consumed/{        
            buffer-=1;
            if(Worker[$5]==1){
                if(item[$2]==1){
                    n = split(string,arr," ")
                    string = "";
                    for(i=1;i<=n;i++){
                        if(arr[i] != $2){
                            string = string " " arr[i];
                        }
                    } 
                    print string; 
                }else{
                    print string;
                    ans = "NO";
                } 
            }else{
                ans="NO";
                print string;
            }
}



/exiting/{         
        if($1=="Master"){
            Master[$2]=0;
        }
        if($1=="Worker"){
            Worker[$2]=0;
        }
        print string;
}


{
    if(buffer > BUF_SIZE){
        ans="NO";
    
    }
}



END{
    for(i=0;i<TOTAL;i++){
        if(item[i]!=1){
            ans="NO";
        }
    }
    print ans;
}