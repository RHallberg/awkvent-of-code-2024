$0==""{FS=",";next}
FS=="|"{
  a[$1,$2]=1
  a[$2,$1]=0
  next
}
{
  valid=1
  split($0,str)
  for(i=2;i<=NF;i++){
    for(j=1;j<i;j++){
      if(!a[str[j],str[i]]){
        valid=0
        tmp = str[i]
        for(k=i-1;k>=j;k--){
          str[k+1] = str[k]
        }
        str[j] = tmp
        break
      }
    }
  }
  middle = sprintf("%d",NF/2+1)
  if(valid){
    sum1+=$(middle)
  }
  if(!valid){
    sum2+=str[middle]
  }
}
END{print sum1 "\n" sum2}

