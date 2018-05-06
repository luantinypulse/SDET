require 'cheers_leader'

describe CheerLeaderList do
  before do 
    leader = Struct.new(:rank, :name, :sent, :received)
    arr = []
    arr << leader.new(2, "tuan", 2, 2)
    arr << leader.new(1, 'luan', 1, 1)
    arr << leader.new(3, 'ngoc', 3, 3)
    @list = CheerLeaderList.new(arr)
  end

  context 'Cheers Leader list contain rank, name, sent and received information' do

    it 'Return by default sorted by rank asc'
    # DONT KNOW HOW IT NOT WORKING ?? 

    it 'Container all information' do
      sample = @list.list[0]
      expect(sample.rank).to eq 2
      expect(sample.name).to eq "tuan"
      expect(sample.sent).to eq 2
      expect(sample.received).to eq 2
    end
  end

  context 'Sort feature for Cheers Leader list' do

    it 'Can be sorted by rank asc' do 
      result = []
      # WHY these below NOT WORKING ??? 
      # ranks = @list.sort_by_rank.each_with_object([]) {|x, ranks| ranks[x] = x.rank}
      # result = @list.sort_by_rank.each {|x| result[x] << x.rank}
      @list.sort_by_rank.each do |x|
        result << x.rank
      end
      expect(result).to eq [1,2,3]
    end
    
    it 'Can be sorted by rank desc' do 
      result = []
      @list.sort_by_rank(false).each do |x|
        result << x.rank
      end
      expect(result).to eq [3,2,1]
    end

    it 'Can be sorted by name asc' do 
      result = []
      @list.sort_by_name.each do |x|
        result << x.name
      end
      expect(result).to eq ["luan", "ngoc", "tuan"]
    end
    
    it 'Can be sorted by name desc' do 
      result = []
      @list.sort_by_name(false).each do |x|
        result << x.name
      end
      expect(result).to eq ["tuan", "ngoc", "luan"]
    end

    it 'Can be sorted by sent asc' do 
      result = []
      @list.sort_by_sent.each do |x|
        result << x.sent
      end
      expect(result).to eq [1,2,3]
    end

    it 'Can be sorted by sent desc' do 
      result = []
      @list.sort_by_sent(false).each do |x|
        result << x.sent
      end
      expect(result).to eq [3,2,1]
    end

    it 'Can be sorted by received asc' do 
      result = []
      @list.sort_by_received.each do |x|
        result << x.received
      end
      expect(result).to eq [1,2,3]
    end

    it 'Can be sorted by received desc' do 
      result = []
      @list.sort_by_received(false).each do |x|
        result << x.received
      end
      expect(result).to eq [3,2,1]
    end
  end

  context 'Search feature for Cheers Leader list' do

    it 'Return [] when there is no matched search' do 
      result = @list.search('a;dsklfjal;ksdjfal;')
      expect(result).to eq([])
    end

    it 'Return all name include text search' do 
      result = []
      @list.search('uan').each do |x|
        result << x.name
      end
      expect(result).to eq ["tuan", "luan"]
    end

    it 'Return only exact name for search text' do 
      expect(@list.search('ngoc')[0].name).to eq('ngoc')
    end

  end

end