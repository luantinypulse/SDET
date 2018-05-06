class CheerLeaderList
  attr_reader :list
  
  def initialize(list)
    raise ArgumentError if !list.is_a?(Array) || list.any? { |x| x.any? { |i| i.nil? } }
    @list = list
  end

  def sort_by_rank(asc = true)
    asc ? list.sort_by { |x| x[:rank] } : list.sort_by { |x| -x[:rank] }
  end

  def sort_by_name(asc = true)
    #  WHY -x[:name] NOT WORKING here ? 
    asc ? list.sort_by { |x| x[:name] } : list.sort { |x, y| y[:name] <=> x[:name] }
  end

  def sort_by_sent(asc = true)
    asc ? list.sort_by { |x| x[:sent] } : list.sort_by { |x| -x[:sent] }
  end

  def sort_by_received(asc = true)
    asc ? list.sort_by { |x| x[:received] } : list.sort_by { |x| -x[:received] }
  end

  def search(text)
    list.select { |x| x[:name].match(text) }
  end
  
end
