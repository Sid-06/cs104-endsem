BEGIN{
      FS = ","; # Input field separator is a comma
      OFS = ","; # Output field separator is a tab
      print "Student ID,First Name,Middle Name,Last Name,Email-ID";
}
NR > 1{ 
    print $1,$2,$3,$4,$2$4"@surveycorps.com";
}