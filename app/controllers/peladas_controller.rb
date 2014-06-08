class PeladasController < ApplicationController
  before_action :set_pelada, only: [:show, :edit, :update, :destroy, :join]

  # GET /peladas
  # GET /peladas.json
  def index
    @peladas_grid = initialize_grid(Pelada, 
     :include => [:usuario],  
     :order => 'peladas.local',
     :order => 'peladas.minimo_pessoas',
     :order => 'peladas.data',
     :order => 'peladas.maximo_pessoas',
     :order => 'peladas.email_responsavel',
     :order => 'peladas.custo',
     :order_direction => 'desc')
  end

  # GET /peladas/1
  # GET /peladas/1.json
  def show
    @usuarios_grid = initialize_grid(Usuario.where(peladas: {'id' => @pelada}).joins(:pelada))
  end

  # GET /peladas/new
  def new
    @pelada = Pelada.new( data: Time.zone.now )
  end

  # GET /peladas/1/edit
  def edit
  end

  # POST /peladas
  # POST /peladas.json
  def create
    @pelada = Pelada.new(pelada_params)

    respond_to do |format|
      if @pelada.save

        PeladaMailer.pelada_notification(@pelada).deliver

        format.html { redirect_to @pelada, notice: 'Pelada salva com sucesso.' }
        
        @usuario = Usuario.new(nome: pelada_params['nome_responsavel'], email: pelada_params['email_responsavel'])
        create_user_and_join(pelada_params['email_responsavel'])

        format.json { render :show, status: :created, location: @pelada }
      else
        format.html { render :new }
        format.json { render json: @pelada.errors, status: :unprocessable_entity }
      end
    end
  end

  def join
    @usuario = Usuario.new()

    if request.get?
      # just render
    elsif request.post?
      @usuario = Usuario.new(usuario_params)

      respond_to do |format|
        create_user_and_join(usuario_params['email'])

        format.html { redirect_to @pelada, :notice => 'Usuário adicionado a pelada com sucesso.' }
      end
    end
  end

  def create_user_and_join(email)
    usuario = Usuario.where(:email => email).take

    if usuario.nil?
      usuario = @usuario
      usuario.save!
    end

    cross_model = PeladasUsuarios.new(:usuario_id => usuario.id, :pelada_id => @pelada.id)
    cross_model.save!
  end

  # PATCH/PUT /peladas/1
  # PATCH/PUT /peladas/1.json
  def update
    respond_to do |format|
      if @pelada.update(pelada_params)
        format.html { redirect_to @pelada, notice: 'Pelada atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @pelada }
      else
        format.html { render :edit }
        format.json { render json: @pelada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peladas/1
  # DELETE /peladas/1.json
  def destroy
    @pelada.destroy
    respond_to do |format|
      format.html { redirect_to peladas_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pelada
    @pelada = Pelada.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pelada_params
    params.require(:pelada).permit(:data, :local, :minimo_pessoas, :custo, :nome_responsavel, :email_responsavel, :maximo_pessoas)
  end

  def usuario_params
    params.require(:usuario).permit(:nome,:email)
  end

end
