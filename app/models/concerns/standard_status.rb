module StandardStatus
  extend ActiveSupport::Concern

  included do

    self::DEFAULT_STATUS = self::STATUSES.first

    validates :status, presence: true, inclusion: { in: self::STATUSES }

    after_initialize :assign_status

    def assign_status
      self.status ||= self.class::DEFAULT_STATUS
    end

    self::STATUSES.each do |s|
      scope s, -> { where status: s }
      scope "not_#{s}", -> { where.not status: s }
    end

    self::STATUSES.each do |s|
      define_method "#{s}?" do
        status == s
      end
    end
  end
end
