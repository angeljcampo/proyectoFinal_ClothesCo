class StatsController < ApplicationController
  def my_stats
    @buyers = User.group(:name).count
  end
end
