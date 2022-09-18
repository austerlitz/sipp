require 'spec_helper'

RSpec.describe SIPP::Inverted do

  describe '.generate' do
    let(:code) { 'CCMV' }
    let(:capabilities) { SIPP::Code.new(code).as_json }
    subject { described_class.generate(capabilities)}
    it 'given a hash of capabilities returns a SIPP code' do
      is_expected.to eq(code)
    end

    context 'given an invalid capability' do
      let(:code){'CC9V'}
      it 'returns "*" in place' do
        is_expected.to eq 'CC*V'
      end
    end
  end
end
