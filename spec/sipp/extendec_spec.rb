require 'spec_helper'

RSpec.describe SIPP::Extended do
  let(:capabilities) {
    {
      category: :compact,
      type: :two_four_door,
      transmission: :manual,
      drive: :front,
      fuel: :petrol,
      ac: :air,
      doors: 5,
      seats: 5,
      bags_big: 2,
      bags_small: 5,
    }
  }
  subject { described_class.generate(capabilities)}
  it 'given a hash of capabilities returns an Extended-SIPP code' do
    is_expected.to eq('CCMFPA5525')
  end

  context 'with some values absent' do
    let(:capabilities) {
      {
        category: :compact,
        type: :two_four_door,
        transmission: :manual,
        drive: :front,
        fuel: :petroleum,
        ac: :air,
        bags: 4
      }
    }

    it 'emits them as `*`' do
      puts subject
      is_expected.to eq 'CCMF*A**4*'
    end

  end

end
