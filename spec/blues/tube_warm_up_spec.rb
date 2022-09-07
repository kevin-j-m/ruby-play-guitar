# frozen_string_literal: true
require "timecop"

module Blues
  RSpec.describe TubeWarmUp do
    describe "#complete?" do
      it "is false when the warm up time has not passed" do
        Timecop.freeze do
          warm_up = TubeWarmUp.new

          expect(warm_up.complete?).to eq false
        end
      end

      it "is true when the warm up time is met" do
        Timecop.freeze do
          warm_up = TubeWarmUp.new
          Timecop.travel(Time.now + TubeWarmUp::SECONDS_TO_WARM_UP)

          expect(warm_up.complete?).to eq true
        end
      end

      it "is true when the warm up time is exceeded" do
        Timecop.freeze do
          warm_up = TubeWarmUp.new
          Timecop.travel(Time.now + TubeWarmUp::SECONDS_TO_WARM_UP + 1)

          expect(warm_up.complete?).to eq true
        end
      end
    end

    describe "#volume_scale" do
      it "is 1 when the warm up is complete" do
        Timecop.freeze do
          warm_up = TubeWarmUp.new
          Timecop.travel(Time.now + TubeWarmUp::SECONDS_TO_WARM_UP)

          expect(warm_up.volume_scale).to eq 1
        end
      end

      it "scales down the volume by the proportion of warm up that's complete" do
        Timecop.freeze do
          warm_up = TubeWarmUp.new
          Timecop.travel(Time.now + (TubeWarmUp::SECONDS_TO_WARM_UP / 2))

          expect(warm_up.volume_scale).to eq 0.5
        end
      end
    end
  end
end
