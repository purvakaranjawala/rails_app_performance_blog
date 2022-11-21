class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  # GET /recipes
  def index
    # @recipes = Recipe.joins(:comments)
    #                  .select('recipes.*, COUNT(comments.*) AS comments_count')
    #                  .group('recipes.id')
    @recipes = Recipe.includes(:comments)
  end

  # GET /recipes/1
  def show
    fresh_when last_modified: @recipe.updated_at.utc, etag: @recipe.cache_key
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    # @recipe = Recipe.find(params[:id])
    @recipe = Recipe.includes(comments: %i[user]).find(params[:id]) # tFor N+1 query
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:title, :instructions, :ratings, :price)
  end
end
