BEGIN{
  FS=""
  dir = "initial"
  d["initial"] = "N"
  d["N"] = "E"
  d["E"] = "S"
  d["S"] = "W"
  d["W"] = "N"

  stp_y["N"] = -1 ;stp_x["N"] =  0
  stp_y["E"] =  0 ;stp_x["E"] =  1
  stp_y["S"] =  1 ;stp_x["S"] =  0
  stp_y["W"] =  0 ;stp_x["W"] = -1

  i_d["N"] = "↑"
  i_d["E"] = "→"
  i_d["S"] = "↓"
  i_d["W"] = "←"
}

{
  for(i=1;i<=NF;i++){
    grid[NR,i] = $i
    if($i == "^"){
      pos_y = NR; pos_x = i
      grid[NR,i] = "O"
    }
  }

}


function print_grid(h,w){
  p_h = sprintf("%d",h/2)
  p_w = sprintf("%d",w/2)
  printf "\033[H\033[J"
  for(i=pos_y-p_h;i<=pos_y+p_h;i++){
    for(j=pos_x-p_w;j<=pos_x+p_w;j++){
      printf("%s",grid[i,j])
    }
    printf "\n"
  }
}

END{
  visited[pos_y,pos_x] = 1
  dir = d[dir]
  while(grid[(pos_y+stp_y[dir]),(pos_x+stp_x[dir])] != ""){
    if(grid[(pos_y+stp_y[dir]),(pos_x+stp_x[dir])] == "#"){
      dir = d[dir]
    }
    grid[pos_y,pos_x] = "."
    pos_y += stp_y[dir]; pos_x += stp_x[dir]
    visited[pos_y,pos_x] = 1
    grid[pos_y,pos_x] = sprintf("\033[31m%s\033[0m",i_d[dir])
    # UNCOMMENT TO ANIMATE
    # print_grid(11,13)
    # rc = system("sleep 0.02")
    # if(rc){
    #  print
    #  break
    # }

  }
  print length(visited)


}
