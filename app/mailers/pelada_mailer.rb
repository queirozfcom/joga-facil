class PeladaMailer < ActionMailer::Base

  def pelada_notification(pelada)

    @pelada = pelada

    pelada.usuario.each do |usuario|
      @username = usuario.nome
      mail(:to => usuario.email, :subject => 'Notificação Joga Fácil').deliver
    end
  end

  default from: "from@example.com"

end
