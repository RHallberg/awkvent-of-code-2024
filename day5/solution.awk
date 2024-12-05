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
      if((str[j] SUBSEP str[i] in a) && !a[str[j],str[i]]){
        valid=0
      }
    }
  }
  if(valid)sum+=sprintf("%d\n",$(NF/2+1))
}
END{print sum}

