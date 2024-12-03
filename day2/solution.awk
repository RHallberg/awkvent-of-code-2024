{
  prev = $1
  asc = 1; desc = 1; safe1 = 1; safe2 = 1
  nbr_bad = 0
  for(i=2;i<=NF;i++){
    v = $i
    d = prev-v
    d_abs = d >=0 ? d : -d
    if(((asc && d<0) || (desc && d>0)) && d_abs <= 3){
      asc = d<0; desc = d>0
      prev = v
    }
    else if(nbr_bad<1){
      nbr_bad++
      safe1 = 0
      if(i==2)prev = v
    }
    else{
      safe2 = 0
      break
    }
  }
  if(!safe1 && !safe2)print $0
  sum1+=safe1
  # sum2+=safe2
}
END{print sum1"\n"sum2}
