require "application_system_test_case"

class ReceipeInfosTest < ApplicationSystemTestCase
  setup do
    @receipe_info = receipe_infos(:receipe_info_one)
  end

  test "visiting the index" do
    visit receipe_infos_url
    assert_selector "h1", text: "Receipe infos"
  end

  test "should create receipe info" do
    visit receipe_infos_url
    click_on "New receipe info"

    fill_in "Body", with: @receipe_info.body
    fill_in "Posted at", with: @receipe_info.posted_at
    fill_in "Title", with: @receipe_info.title
    click_on "Create Receipe info"

    assert_text "Receipe info was successfully created"
    click_on "Back"
  end

  test "should update Receipe info" do
    visit receipe_info_url(@receipe_info)
    click_on "Edit this receipe info", match: :first

    fill_in "Body", with: @receipe_info.body
    fill_in "Posted at", with: @receipe_info.posted_at
    fill_in "Title", with: @receipe_info.title
    click_on "Update Receipe info"

    assert_text "Receipe info was successfully updated"
    click_on "Back"
  end

  test "should destroy Receipe info" do
    visit receipe_info_url(@receipe_info)
    click_on "Destroy this receipe info", match: :first

    assert_text "Receipe info was successfully destroyed"
  end
end
