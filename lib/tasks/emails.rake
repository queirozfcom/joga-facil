namespace :emails do

  desc "Notifies players in peladas which are about to start. Run this task every 10 minutes using cron."

  task impending_pelada_notification: :environment do

    # need to find out a way so set this up so that
    # one pelada does not get selected twice
    time_from = (Time.now + 2.hours).beginning_of_minute
    time_to = (Time.now + 2.hours + 10.minutes).beginning_of_minute + 59.seconds

    zone_offset = Time.zone_offset(Time.now.zone)

    PeladaMailer.pelada_notification(Pelada.find(9))

    # Pelada.where(data: time_from + zone_offset .. time_to + zone_offset).each do |pelada|
    #   PeladaMailer.pelada_notification(pelada)
    # end

  end

end
