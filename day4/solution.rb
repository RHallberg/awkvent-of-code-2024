class Solution

  STATES = {
            "X"=>{
            "M"=>{
            "A"=>{
            "S"=>:xmas}}},

            "S"=>{
            "A"=>{
            "M"=>{
            "X"=>:xmas}}}
          }.freeze

  def initialize(file)
    @data = File.read(file).split("\n").map{|d| d.split("")}
  end

  def solve
    sum1 = 0
    sum2 = 0
    data.each_with_index do |row, y|
      row.each_with_index do |char, x|
        state = STATES[char]
        if char == "A" && x_mas?(y,x)
          sum2+=1
        end
        next if state.nil?
        sum1 += (xmas(state,y,x+1,:h) + xmas(state,y+1,x,:v) + xmas(state,y+1,x+1,:dp)+ xmas(state,y+1,x-1,:dn))
      end
    end
    puts sum1
    puts sum2
  end

  attr_accessor :data
  private


  def xmas(state,y,x,dir)
    return 0 if data[y].nil?
    state = state[data[y][x]]
    return 0 if state.nil? || x < 0 || y < 0
    return 1 if state == :xmas
    res = case dir
            when :h then xmas(state,y,x+1,dir)
            when :v then xmas(state,y+1,x,dir)
            when :dp then xmas(state,y+1,x+1,dir)
            when :dn then xmas(state,y+1,x-1,dir)
          end
    return res
  end

  def x_mas?(y,x)
    return false if x-1 < 0 || y-1 < 0 || data[y+1].nil?
    return false unless /SAM|MAS/ === data[y-1][x-1] + "A" + data[y+1][x+1].to_s
    return true if /SAM|MAS/ === data[y-1][x+1].to_s + "A" + data[y+1][x-1].to_s
    false
  end
end

Solution.new("input.txt").solve
