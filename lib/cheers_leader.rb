class CheerLeaderList
  attr_reader :list
  
  def initialize(list)
    raise ArgumentError if !list.is_a?(Array) || list.any? {|x| x.any? { |i| i.nil? } }
    @list = list
    sort_by_rank # Why this not WORKING ?? 
  end

  def sort_by_rank(asc = true)
    asc ? list.sort_by {|x| x[:rank] } : list.sort_by {|x| -x[:rank] }
  end

  def sort_by_name(asc = true)
    #  WHY -x[1] NOT WORKING here ? 
    asc ? list.sort_by {|x| x[:name] } : list.sort {|x, y| y[:name] <=> x[:name] }
  end

  def sort_by_sent(asc = true)
    asc ? list.sort_by {|x| x[2] } : list.sort_by {|x| -x[2] }
  end

  def sort_by_received(asc = true)
    asc ? list.sort_by {|x| x[3] } : list.sort_by {|x| -x[3] }
  end

  def search(text)
    list.select {|x| x[1].match (text) }
  end
  
end
