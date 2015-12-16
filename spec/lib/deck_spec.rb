RSpec.describe Deck do
  subject { described_class.new }

  context '#size' do
    it { expect(subject.size).to eq(52) }
    it do
      i = 10
      expect { i.times { subject.pop } }.to change { subject.size }.by(i * -1)
    end
  end

  context '#empty?' do
    it { expect(subject.empty?).to be_falsey }
    it 'should be true if no cards' do
      subject.cards = []
      expect(subject.empty?).to be_truthy
    end
  end
end
