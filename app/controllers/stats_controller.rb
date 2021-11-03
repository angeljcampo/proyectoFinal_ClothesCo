class StatsController < ApplicationController
  def my_stats
    @weekly_buyers = Order.where(status: "completed").group_by_week(:created_at).count
    @weekly_users = User.group_by_week(:created_at).count
    @diary_buyers = Order.where(status: "completed").group_by_day(:created_at).count
    @diary_users = User.group_by_day(:created_at).count
  end
end
