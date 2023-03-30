require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @recipe = recipes(:recipe_one)
  end

  test 'should get index' do
    get recipes_url
    assert_response :success
  end

  test 'should get new' do
    get new_recipe_url
    assert_response :success
  end

  test 'should create recipe' do
    assert_difference('Recipe.count') do
      post recipes_url,
           params: { recipe: { title: 'Assam Tea',
                               instructions: 'Next', ratings: 4,
                               price: 300, status: 'approved' } }
    end
    assert_redirected_to recipe_url(Recipe.last)
    assert 'Assam Tea', Recipe.last.title
  end

  test 'should show recipe' do
    get recipe_url(@recipe)
    assert_response :success
  end

  test 'should get edit' do
    get edit_recipe_url(@recipe)
    assert_response :success
  end

  test 'should update recipe' do
    patch recipe_url(@recipe),
          params: { recipe: { instructions: @recipe.instructions,
                              ratings: @recipe.ratings,
                              title: 'Burger' } }
    # binding.pry
    assert_redirected_to recipe_url(@recipe)
  end

  test 'should destroy recipe' do
    assert_difference('Recipe.count', 1) do
      delete recipe_url(@recipe)
    end
    Recipe.reload
    assert_redirected_to recipes_url
  end
end
