require 'spec_helper'
require 'Player'

RSpec.describe Player do
  subject { described_class.new }
  let(:without_money) { described_class.new(0) }

  context '#empty?' do
    it 'false on init' do
      expect(subject.empty?).to be_falsey
    end
    it 'true without money' do
      expect(without_money.empty?).to be_truthy
    end
  end

  context '#bet' do
    it do
      expect { subject.bet 20 }.to change { subject.money }
        .from(subject.money)
        .to(subject.money - 20)
    end
  end
end
