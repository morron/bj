require 'spec_helper'
require 'Player'

RSpec.describe Player do
  subject { described_class.new(name) }
  let(:name) { 'SlimShady' }
  let(:without_money) { described_class.new(name, 0) }

  context '#empty?' do
    it 'false on init' do
      expect(subject.empty?).to be_falsey
    end
    it 'true without money' do
      expect(without_money.empty?).to be_truthy
    end
  end

  context '#to_s' do
    it { expect(subject.name).to eq(name) }
  end

  context '#bet' do
    it do
      expect { subject.bet 20 }.to change { subject.money }
        .from(subject.money)
        .to(subject.money - 20)
    end
  end

  context '#setup_bet' do
    it do
      allow(subject).to receive(:gets).and_return('100')
      expect { subject.setup_bet }.to change { subject.money }
        .from(subject.money).to(subject.money - 100)
    end
  end
end
