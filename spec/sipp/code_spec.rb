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
    context 'with invalid transmission_drive' do
      let(:code) { 'CC0W' }
      it { should_not be_valid }
      it 'raises TransmissionError with :invalid_transmission_drive' do
        expect { subject.validate! }.to raise_exception do |error|
          expect(error).to be_a SIPP::TransmissionDriveError
          expect(error.message).to eq 'invalid_transmission_drive'
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
      it { expect(subject.category.to_s).to eq 'Compact' }
    end
    describe '#type' do
      it { expect(subject.type.to_s).to eq '2/4 Door' }
    end
    describe '#transmission_drive' do
      it { expect(subject.transmission_drive.to_s).to eq 'Manual AWD' }
    end
    describe '#transmission' do
      it { expect(subject.transmission.to_s).to eq 'Manual' }
    end
    describe '#transmission_manual?' do
      it { expect(subject.transmission_manual?).to be_truthy }
    end
    describe '#transmission_auto?' do
      it { expect(subject.transmission_auto?).to be_falsey }
    end
    describe '#drive' do
      it { expect(subject.drive.to_s).to eq 'AWD' }
    end
    describe '#fuel_ac' do
      it { expect(subject.fuel_ac.to_s).to eq 'Electric Plus (Distance ≥ 250mi/400km) Air' }
    end
    describe '#fuel' do
      it { expect(subject.fuel.to_s).to eq 'Electric Plus (Distance ≥ 250mi/400km)' }
    end
    describe '#ac' do
      it { expect(subject.ac.to_s).to eq 'Air' }
    end
    describe '#ac?' do
      it { should be_truthy }
    end
  end

  context 'with only some letters valid' do
    it 'translates valid letters' do
      expect(SIPP::Code.new('XXXX').valid?).to be_falsey
      expect(SIPP::Code.new('XXXX').category.to_s).to eq 'Special'
      expect(SIPP::Code.new('XXXX').type.to_s).to eq 'Special'
      expect(SIPP::Code.new('99A9').valid?).to be_falsey
      expect(SIPP::Code.new('99A9').transmission_drive.to_s).to eq 'Auto Unspecified Drive'
      expect(SIPP::Code.new('99A9').transmission.to_s).to eq 'Auto'
      expect(SIPP::Code.new('99A9').transmission_auto?).to be_truthy
      expect(SIPP::Code.new('99A9').transmission_manual?).to be_falsey
      expect(SIPP::Code.new('99A9').drive.to_s).to eq 'Unspecified'

      expect(SIPP::Code.new('999D').valid?).to be_falsey
      expect(SIPP::Code.new('999D').fuel_ac.to_s).to eq 'Diesel Air'
      expect(SIPP::Code.new('999D').fuel.to_s).to eq 'Diesel'
      expect(SIPP::Code.new('999D').ac.to_s).to eq 'Air'
      expect(SIPP::Code.new('999D').ac?).to be_truthy
    end
  end

  describe '#to_s' do
    before {I18n.locale = :en}
    let(:code) { 'CCNV' }
    it 'returns human-readable code description' do
      expect(subject.to_s).to eq 'Compact - 2/4 Door - Manual 4WD - Petrol Air'
    end

    it 'is aware of current locale' do
      I18n.locale = :ru
      expect(subject.to_s).to eq 'компакт - 2/4 двери - МКПП, 4WD - бензин, кондиционер'
    end

    it 'for invalid codes puts "#N/A", the rest is translated' do
      expect(SIPP::Code.new('99DD').to_s).to eq "#N/A - #N/A - Auto AWD - Diesel Air"
    end

  end

  describe '#as_json' do

  end
end