require "application_system_test_case"

class SurvivorsTest < ApplicationSystemTestCase
  setup do
    @survivor = survivors(:one)
  end

  test "visiting the index" do
    visit survivors_url
    assert_selector "h1", text: "Survivors"
  end

  test "creating a Survivor" do
    visit survivors_url
    click_on "New Survivor"

    check "Abducted" if @survivor.abducted
    fill_in "Age", with: @survivor.age
    fill_in "Gender", with: @survivor.gender
    fill_in "Latitude", with: @survivor.latitude
    fill_in "Longitude", with: @survivor.longitude
    fill_in "Name", with: @survivor.name
    click_on "Create Survivor"

    assert_text "Survivor was successfully created"
    click_on "Back"
  end

  test "updating a Survivor" do
    visit survivors_url
    click_on "Edit", match: :first

    check "Abducted" if @survivor.abducted
    fill_in "Age", with: @survivor.age
    fill_in "Gender", with: @survivor.gender
    fill_in "Latitude", with: @survivor.latitude
    fill_in "Longitude", with: @survivor.longitude
    fill_in "Name", with: @survivor.name
    click_on "Update Survivor"

    assert_text "Survivor was successfully updated"
    click_on "Back"
  end

  test "destroying a Survivor" do
    visit survivors_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Survivor was successfully destroyed"
  end
end
