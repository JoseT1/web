class LibrosController < ApplicationController
  before_action :set_libro, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :update, :destroy]
  
 
  # GET /libros
  # GET /libros.json

  def ubicacion
  end
  
  def index 
    find
    @libros = Libro.all
  end
  
  def index2 
    @libros = Libro.all
  end

  def find
    if !user_signed_in? 
     redirect_to "/"
	 end
  end
  
  def ultimos
      @ultimos = Libro.order('created_at DESC').limit(3)
  end
  
  def vendidos
    @vendidos = Libro.order('created_at').limit(4)
  end
  
  # GET /libros/1
  # GET /libros/1.json
  def show
  end
  
  
  # GET /libros/new
  def new
    @libro = Libro.new
  end

  # GET /libros/1/edit
  def edit
  end

  # POST /libros
  # POST /libros.json
  def create
    @libro = Libro.new(libro_params)

    respond_to do |format|
      if @libro.save
        format.html { redirect_to @libro, notice: 'Libro was successfully created.' }
        format.json { render :show, status: :created, location: @libro }
      else
        format.html { render :new }
        format.json { render json: @libro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /libros/1
  # PATCH/PUT /libros/1.json
  def update
    respond_to do |format|
      if @libro.update(libro_params)
        format.html { redirect_to @libro, notice: 'Libro was successfully updated.' }
        format.json { render :show, status: :ok, location: @libro }
      else
        format.html { render :edit }
        format.json { render json: @libro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /libros/1
  # DELETE /libros/1.json
  def destroy
    @libro.destroy
    respond_to do |format|
      format.html { redirect_to libros_url, notice: 'Libro was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_libro
      @libro = Libro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def libro_params
      params.require(:libro).permit(:nombre, :editorial, :autor, :isbn, :precio)
    end
end
