require 'spec_helper'

RSpec.describe SIPP::Extended do
  let(:capabilities) {
    {
      category:     :compact,
      type:         :two_four_door,
      transmission: :manual,
      drive:        :front,
      fuel:         :petrol,
      ac:           :air,
      doors:        5,
      seats:        5,
      bags_big:     2,
      bags_small:   5,
    }
  }
  describe '.generate' do
    subject { described_class.generate(capabilities) }
    it 'given a hash of capabilities returns an Extended-SIPP code' do
      is_expected.to eq('CCMFPA5525')
    end

    context 'with capabilities as string values' do
      let(:capabilities) {
        {
          category:     'compact',
          type:         'two_four_door',
          transmission: 'manual',
          drive:        'front',
          fuel:         'petrol',
          ac:           'air',
          doors:        5,
          seats:        5,
          bags_big:     2,
          bags_small:   5,
        }
      }
      it 'returns an Extended-SIPP code as well' do
        is_expected.to eq('CCMFPA5525')
      end

    end

    context 'with some values absent' do
      let(:capabilities) {
        {
          category:     :compact,
          type:         :two_four_door,
          transmission: :manual,
          drive:        :front,
          fuel:         :petroleum,
          ac:           :air,
          bags:         4
        }
      }

      it 'emits them as `*`' do
        puts subject
        is_expected.to eq 'CCMF*A**4*'
      end

    end

  end

  describe '#to_s' do
    subject { described_class.new('CCMFPA5525').to_s }
    it { is_expected.to eq 'Compact - 2/4 Door - Manual - Front - Petrol - Air - 5 - 5 - 2 - 5' }
  end

  describe '#as_json' do
    subject { described_class.new('CCMFPA5525').as_json }
    it { is_expected.to eq capabilities }
  end
end
