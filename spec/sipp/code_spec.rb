require 'spec_helper'

RSpec.describe SIPP::Code do
  subject { described_class.new(code) }
  let(:code) { 'CCCC' }

  describe "#valid?" do
    it "returns true when valid" do
      subject.validate!
      expect(subject.valid?).to be true
    end

    context "when code is invalid" do
      let(:code) { "1234" }

      it "returns false" do
        expect(subject.valid?).to be false
      end
    end
  end

  describe '#validate!' do
    context 'with invalid or blank code itself' do
      let(:code) { '' }
      it { should_not be_valid }
      it 'raises CodeError with :invalid_code' do
        expect { subject.validate! }.to raise_exception do |error|
          expect(error).to be_a SIPP::CodeError
          expect(error.message).to eq 'invalid_code'
        end
      end
    end
    context 'with invalid category' do
      let(:code) { '0WWW' }
      it { should_not be_valid }
      it 'raises CategoryError with :invalid_category' do
        expect { subject.validate! }.to raise_exception do |error|
          expect(error).to be_a SIPP::CategoryError
          expect(error.message).to eq 'invalid_category'
        end
      end
    end
    context 'with invalid type' do
      let(:code) { 'C0WW' }
      it { should_not be_valid }
      it 'raises TypeError with :invalid_type' do
        expect { subject.validate! }.to raise_exception do |error|
          expect(error).to be_a SIPP::TypeError
          expect(error.message).to eq 'invalid_type'
        end
      end
    end
    context 'with invalid transmission' do
      let(:code) { 'CC0W' }
      it { should_not be_valid }
      it 'raises TransmissionError with :invalid_transmission' do
        expect { subject.validate! }.to raise_exception do |error|
          expect(error).to be_a SIPP::TransmissionError
          expect(error.message).to eq 'invalid_transmission'
        end
      end
    end
    context 'with invalid fuel_ac' do
      let(:code) { 'CCC0' }
      it { should_not be_valid }
      it 'raises FuelACError with :invalid_fuel_ac' do
        expect { subject.validate! }.to raise_exception do |error|
          expect(error).to be_a SIPP::FuelACError
          expect(error.message).to eq 'invalid_fuel_ac'
        end
      end
    end
  end

  context 'with code as "CCCC"' do
    let(:code) { 'CCCC' }
    describe '#category' do
      it { expect(subject.category).to eq 'Compact' }
    end
    describe '#type' do
      it { expect(subject.type).to eq '2/4 Door' }
    end
    describe '#transmission_drive' do
      it { expect(subject.transmission_drive).to eq 'Manual AWD' }
    end
    describe '#transmission' do
      it { expect(subject.transmission).to eq 'Manual' }
    end
    describe '#transmission_manual?' do
      it { expect(subject.transmission_manual?).to be_truthy }
    end
    describe '#transmission_auto?' do
      it { expect(subject.transmission_auto?).to be_falsey }
    end
    describe '#drive' do
      it { expect(subject.drive).to eq 'AWD' }
    end
    describe '#fuel_ac' do
      it { expect(subject.fuel_ac).to eq 'Electric Plus (Distance ≥ 250mi/400km) Air' }
    end
    describe '#fuel' do
      it { expect(subject.fuel).to eq 'Electric Plus (Distance ≥ 250mi/400km)' }
    end
    describe '#ac' do
      it { expect(subject.ac).to eq 'Air' }
    end
    describe '#ac?' do
      it { should be_truthy }
    end
  end

  describe '#to_s' do
    let(:code) { 'CCNV' }
    it 'returns human-readable code description' do
      expect(subject.to_s).to eq 'Compact - 2/4 Door - Manual 4WD - Petrol Air'
    end
  end
end