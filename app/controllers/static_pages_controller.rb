class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :status]
  skip_before_action :authenticate_normal!, only: [:home, :status]
  before_action :authenticate_system!, only: [:console]
  def home
  end

  def status
    render json: {
      status: "ok",
      hostname: Socket.gethostname,
      service: "period",
      commit: @@comment ||= `git log -1 --oneline`
    }
  end

  def console
  end
end
