BEGIN{e=1}
$0 == "do" {e=1;next}
$0 == "don't" {e=0;next}
  {sum1+=$1*$2}
e {sum2+=$1*$2}
END{print sum1 "\n" sum2}
