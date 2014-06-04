class PeladaMailer < ActionMailer::Base

  # sendgrid_category :use_subject_lines
  # sendgrid_enable   :ganalytics, :opentrack
  # sendgrid_unique_args :key1 => "value1", :key2 => "value2"

  def pelada_notification(pelada)


    @pelada = pelada
    @username = pelada.responsavel
    # sendgrid_category "Welcome"
    # sendgrid_unique_args :key2 => "newvalue2", :key3 => "value3"
    mail( :to => pelada.responsavel, :subject => 'Notificação Joga Fácil' )
  end

  default from: "from@example.com"
end
