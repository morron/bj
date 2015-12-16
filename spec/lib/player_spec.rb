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

  context '#bet_up_to' do
    it do
      expect { subject.bet_up_to 20 }.to change { subject.money }
        .from(subject.money)
        .to(subject.money - 20)
    end
  end

  context '#set_bet_on' do
    it do
      allow(subject).to receive(:ask).and_return(100)
      expect { subject.set_bet_on }.to change { subject.money }
        .from(subject.money).to(subject.money - 100)
    end
  end
end
