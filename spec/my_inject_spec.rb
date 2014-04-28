require 'my_inject'

describe 'my inject' do

  context 'general properties' do

    it 'empty array be nil' do
      expect([].my_inject).to eq [].inject
    end

    it 'will return the element if passed array with one element and no block' do
      expect([1].my_inject).to eq [1].inject
    end

    it 'does not destroy original array' do
      array = [1,2]
      array.my_inject(&:+)
      expect(array).to eq [1,2]
    end

    it 'adds one plus two' do
      expect([1,2].my_inject(){|acc, num| acc + num }).to eq [1,2].inject(&:+)
    end
  end

  context 'when there are three Fixnum elements and a block' do
    
    let(:ary) { [1,2,3] }

    it 'adds one plus two plus three' do
      expect(ary.my_inject(&:+)).to eq [1,2,3].inject(&:+)
    end

    it 'subtracts one minus two minus three' do
      expect(ary.my_inject(&:-)).to eq [1,2,3].inject(&:-)
    end

    it 'multiplies one times two times three' do
      expect(ary.my_inject(&:*)).to eq [1,2,3].inject(&:*)
    end

   it 'divides one by two by three' do
      expect(ary.my_inject(&:/)).to eq [1,2,3].inject(&:/)
    end
  end

  context 'when there are five elements in an array' do
  
    let(:ary) { [1,2,3,4,5]}
    let(:words) { ['apples', 'pears', 'bananas', 'watermelons', 'pomegranates' ] }

    it 'adds five elements' do
      expect(ary.my_inject(&:+)).to eq [1,2,3,4,5].inject(&:+)
    end

    it 'divides five elements' do
      expect(ary.my_inject(&:/)).to eq [1,2,3,4,5].inject(&:/)
    end

    it 'divides five elements in reverse' do
      expect([5,4,3,2,1].my_inject(&:/)).to eq [5,4,3,2,1].inject(&:/)
    end

    it 'can find the longest word' do
      expect(words.my_inject { |memo, word| 
        memo.length > word.length ? memo : word
        } ).to eq ['apples', 'pears', 'bananas', 'watermelons', 'pomegranates' ].inject() { |memo, word|
        memo.length > word.length ? memo : word }
    end

    it 'can write a bunch of nonsense if given a bunch of nonsense' do
      expect(['a ', 'bunch ', 'of ', 'nonsense!'].my_inject('writing ', &:+)).to eq ['a ', 'bunch ', 'of ', 'nonsense!'].inject('writing ', &:+)
    end

    it 'can handle weird maths' do
      expect(ary.my_inject{|a,b| a * b + a ** b % b - a -a -a / a + b} ).to eq (1..5).inject{|a,b| a * b + a ** b % b - a -a -a / a + b} 
    end
  end
  context 'long arrays' do

    it 'can handle an array with 20 elements' do
      ary = (1..20).to_a
      expect(ary.my_inject(&:+)).to eq ary.inject(&:+)
    end

    it 'can handle an array with 200 elements' do
      ary = (1..200).to_a
      expect(ary.my_inject(&:+)).to eq ary.inject(&:+)
    end
  end
end
