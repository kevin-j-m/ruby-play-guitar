# frozen_string_literal: true

module Blues
  RSpec.describe Guitar do
    describe "#tune" do
      it "tunes the strings to the tuning specified at instantiation" do
        guitar = Guitar.new(tuning: :standard)

        expect { guitar.tune }
          .to change { guitar.strings }
          .from([nil, nil, nil, nil, nil, nil])
          .to([:e, :a, :d, :g, :b, :e])
      end

      it "tunes the strings to the tuning specified when calling the method" do
        guitar = Guitar.new(tuning: nil)

        expect { guitar.tune(:standard) }
          .to change { guitar.strings }
          .from([nil, nil, nil, nil, nil, nil])
          .to([:e, :a, :d, :g, :b, :e])
      end
    end
  end
end
