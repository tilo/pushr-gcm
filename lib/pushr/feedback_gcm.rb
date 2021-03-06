module Pushr
  class FeedbackGcm < Pushr::Feedback
    attr_accessor :type, :app, :device, :follow_up, :failed_at, :update_to

    validates :follow_up, inclusion: { in: %w(delete update), message: '%{value} is not a valid follow-up' }

    def to_json
      hsh = { type: 'Pushr::FeedbackGcm', app: app, device: device, follow_up: follow_up, failed_at: failed_at, update_to: update_to }
      MultiJson.dump(hsh)
    end
  end
end
