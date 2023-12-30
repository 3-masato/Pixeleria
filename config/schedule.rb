# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

env :PATH, ENV["PATH"]
set :output, "log/cron_log.log"

# 日本時間で午前2時に実行
# UTC 5:00 pm -> JST 2:00 am
every 1.day, at: "5:00 pm" do
  runner "GuestUserCleanupJob.perform_now"
end