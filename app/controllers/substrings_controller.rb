class SubstringsController < ApplicationController

  def new
    @substring = Substring.new
  end

  def index
    @substrings = Substring.all
  end

  def show
    @substring = Substring.last
  end

  def create
    @sol=Solution.new
    @substring = Substring.new(substring_params)
    @res = @sol.find_pattern(@substring.inputstr)
    @substring.uniqstr=@res
    @substring.uniqsize=@res.length
    if  @substring.save
      redirect_to controller: 'substrings', action: 'show', id: @substring.inputstr    
    else
      redirect_to new_substring_path
    end
  end

  
  def substring_params
    params.require(:substring).permit(:inputstr, :uniqstr, :uniqsize)
  end
end
