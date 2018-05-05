class CheerLeaderList
  def initialize(list)
    @list = list
  end
attr_reader :list

  def sort_by(sort_by = 'rank', asc = true)
    return [] if list.to_a.empty?
    case sort_by
      when 'name'
        asc ? list.sort_by {|x| x[1] } : list.sort {|x, y| y[1] <=> x[1] }
      when 'sent'
        asc ? list.sort_by {|x| x[2] } : list.sort_by {|x| -x[2] }  
      when 'received'
        asc ? list.sort_by {|x| x[3] } : list.sort_by {|x| -x[3] }  
      else
        asc ? list.sort_by {|x| x[0] } : list.sort_by {|x| -x[0] }  
    end
  end

  def search(text)
    return [] if text.nil?
    list.select {|x| x[1].match (text) }
  end
  
end
