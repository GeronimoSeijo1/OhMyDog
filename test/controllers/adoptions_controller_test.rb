require "test_helper"

class AdoptionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adoption = adoptions(:one)
  end

  test "should get index" do
    get adoptions_url
    assert_response :success
  end

  test "should get new" do
    get new_adoption_url
    assert_response :success
  end

  test "should create adoption" do
    assert_difference("Adoption.count") do
      post adoptions_url, params: { adoption: { description: @adoption.description, name: @adoption.name, race: @adoption.race, sex: @adoption.sex, situation: @adoption.situation, size: @adoption.size, user_id: @adoption.user_id } }
    end

    assert_redirected_to adoption_url(Adoption.last)
  end

  test "should show adoption" do
    get adoption_url(@adoption)
    assert_response :success
  end

  test "should get edit" do
    get edit_adoption_url(@adoption)
    assert_response :success
  end

  test "should update adoption" do
    patch adoption_url(@adoption), params: { adoption: { description: @adoption.description, name: @adoption.name, race: @adoption.race, sex: @adoption.sex, situation: @adoption.situation, size: @adoption.size, user_id: @adoption.user_id } }
    assert_redirected_to adoption_url(@adoption)
  end

  test "should destroy adoption" do
    assert_difference("Adoption.count", -1) do
      delete adoption_url(@adoption)
    end

    assert_redirected_to adoptions_url
  end
end
