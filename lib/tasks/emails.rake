namespace :emails do

  desc "Notifies players in peladas which are about to start. Run this task every minute using cron."

  task impending_pelada_notification: :environment do

    # need to find out a way so set this up so that
    # one pelada does not get selected twice
    time_from = (Time.now + 2.hours).beginning_of_minute
    time_to = (Time.now + 2.hours).beginning_of_minute + 59.seconds

    # need to account for timezones otherwise it doesnt work
    offset = Time.now.utc_offset

    Pelada.where(data: time_from+offset  .. time_to+offset ).each do |pelada|
      PeladaMailer.pelada_notification(pelada)
    end

  end

end
