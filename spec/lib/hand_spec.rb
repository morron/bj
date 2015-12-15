require 'spec_helper'
require 'Hand'
require 'Card'

RSpec.describe Hand do
  subject { described_class.new }
  let(:card_1) { Card.new(:hearts, 'K') }
  let(:card_2) { Card.new(:hearts, 6) }

  context '#push' do
    it { expect { subject.push(card_1) }.to change { subject.cards.size }.by(1) }
  end

  context '#score' do
    before do
      subject.push(card_1)
      subject.push(card_2)
    end
    it { expect(subject.score).to eq 16 }
  end
end
