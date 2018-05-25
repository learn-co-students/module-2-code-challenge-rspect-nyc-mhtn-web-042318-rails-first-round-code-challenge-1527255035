class SuperheroesController < ApplicationController
  def index
    @superheroes = Superhero.all
    if params[:search]
      @superheroes = Superhero.search(params[:search])
    else
      @superheroes = Superhero.all
    end
  end

  def new
    @superhero = Superhero.new
    @superpowers = Superpower.all
  end

  def show
    @superhero = Superhero.find(params[:id])
  end

  def create
    @superhero = Superhero.create(superhero_params)
    if @superhero.valid?
      redirect_to @superhero
    else
      flash[:errors] = @superhero.errors.full_messages
      redirect_to new_superhero_path
    end
  end


  private

  def superhero_params
    params.require(:superhero).permit(:name, :super_name, :superpower_id)
  end


end
