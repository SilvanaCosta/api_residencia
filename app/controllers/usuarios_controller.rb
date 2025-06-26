class UsuariosController < ApplicationController
  before_action :set_usuario, only: [:update, :destroy]

  # GET /saudacao
  def saudacao
    render json: { mensagem: "Bem-vindo à API Residência" }
  end

  # POST /usuarios
  def create
    usuario = Usuario.new(usuario_params)
    if usuario.save
      render json: usuario, status: :created
    else
      render json: usuario.errors, status: :unprocessable_entity
    end
  end

  # GET /usuarios
  def index
    render json: Usuario.all
  end

  # PUT /usuarios/:id
  def update
    if @usuario.update(usuario_params)
      render json: @usuario
    else
      render json: @usuario.errors, status: :unprocessable_entity
    end
  end

  # DELETE /usuarios/:id
  def destroy
    @usuario.destroy
    head :no_content
  end

  private

  def set_usuario
    @usuario = Usuario.find_by(id: params[:id])
    render json: { erro: "Usuário não encontrado" }, status: 404 unless @usuario
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :email)
  end
end

