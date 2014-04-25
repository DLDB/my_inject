require 'my_inject'

describe 'my inject' do

  context 'when there are three or fewer Fixnum elements with no arguments ' do
    
    let(:ary) { [1,2,3] }
    

    it 'empty array be nil' do
      expect([].my_inject).to eq [].inject
    end

    it 'adds one plus two' do
      expect([1,2].my_inject(){|acc, num| acc + num }).to eq [1,2].inject(&:+)
    end

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

    it 'can find the longest word' do
      expect(words.my_inject { |memo, word| 
        memo.length > word.length ? memo : word
        } ).to eq ['apples', 'pears', 'bananas', 'watermelons', 'pomegranates' ].inject() { |memo, word|
        memo.length > word.length ? memo : word }
    end

    it 'can handle weird maths' do
      expect(ary.my_inject{|a,b| a = b + a * b % b - a} ).to eq (1..5).inject{|a,b| a = b + a * b % b - a} 
    end

  end
end
