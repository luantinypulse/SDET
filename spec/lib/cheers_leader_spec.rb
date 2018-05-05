require 'cheers_leader'

describe CheerLeaderList do
  before do
    arr = [[2, "luan", 2, 2], [1, "tuan", 1, 1], [3, "mai", 2, 3]]  
    @list = CheerLeaderList.new(arr)
  end
  
  context "Cheers Leader list informations" do 

    it "By default, the Cheers Leader list is empty" do
      expect(CheerLeaderList.new(nil).sort_by('')).to eq([])
    end

    it "Cheers Leader list contain rank, name, sent and receiveed " do
      sub_arr = @list.sort_by('')[0]
      expect(sub_arr).to eq [1, "tuan", 1, 1]
    end

  end

  context "Cheer Leader list sorting" do

    it "Cheers Leader list default sorted by rank asc" do
      expect(@list.sort_by('rank')).to eq([[1, "tuan", 1, 1], [2, "luan", 2, 2], [3, "mai", 2, 3]])
    end

    it "Cheers Leader list can be sorted asc/desc by rank " do 
      expect(@list.sort_by('rank')).to eq([[1, "tuan", 1, 1], [2, "luan", 2, 2], [3, "mai", 2, 3]])
      expect(@list.sort_by('rank',false)).to eq([[3, "mai", 2, 3], [2, "luan", 2, 2], [1, "tuan", 1, 1]])
    end

    it "Cheers Leader list can be sorted asc/desc by name " do 
      expect(@list.sort_by('name')).to eq([[2, "luan", 2, 2], [3, "mai", 2, 3], [1, "tuan", 1, 1]])
      expect(@list.sort_by('name',false)).to eq([[1, "tuan", 1, 1], [3, "mai", 2, 3], [2, "luan", 2, 2]])
    end

    it "Cheers Leader list can be sorted asc/desc by sent " do 
      expect(@list.sort_by('sent')).to eq([[1, "tuan", 1, 1], [2, "luan", 2, 2], [3, "mai", 2, 3]])
      expect(@list.sort_by('sent',false)).to eq([[2, "luan", 2, 2], [3, "mai", 2, 3], [1, "tuan", 1, 1]])
    end

    it "Cheers Leader list can be sorted asc/desc by received " do 
      expect(@list.sort_by('received')).to eq([[1, "tuan", 1, 1], [2, "luan", 2, 2], [3, "mai", 2, 3]])
      expect(@list.sort_by('received',false)).to eq([[3, "mai", 2, 3], [2, "luan", 2, 2], [1, "tuan", 1, 1]])
    end

  end

  context "Search Cheers Leader list" do 

    it "It return [] when there's no matched search" do 
      expect(@list.search('a;dsklfjal;ksdjfal;')).to eq([])
    end

    it "It return all name include text search" do 
      expect(@list.search('uan')).to eq([[2, "luan", 2, 2], [1, "tuan", 1, 1]])
    end

    it "It return only exact name for search text" do 
      expect(@list.search('mai')).to eq([[3, "mai", 2, 3]])
    end

  end
  
end