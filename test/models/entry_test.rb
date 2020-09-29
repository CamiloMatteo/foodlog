require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test "is valid with valid attr" do
    entry = Entry.new(meal_type: "Brakfast", carbohydrates: 12, proteins: 23, fats: 23, calories: 300)
    assert entry.save
  end

  test "should not save entry without calories" do
    entry = Entry.new(meal_type: "Brakfast", carbohydrates: 12, proteins: 23, fats: 23)
    assert_not entry.save
  end

  test "should not save entry without fats" do
    entry = Entry.new(meal_type: "Brakfast", carbohydrates: 12, proteins: 23, calories: 300)
    assert_not entry.save
  end

  test "should not save entry without proteins" do
    entry = Entry.new(meal_type: "Brakfast", carbohydrates: 12, fats: 23, calories: 300)
    assert_not entry.save
  end

  test "should not save entry without carbohydrates" do
    entry = Entry.new(meal_type: "Brakfast", proteins: 23, fats: 23, calories: 300)
    assert_not entry.save
  end

  test "should not save entry without meal_type" do
    entry = Entry.new( carbohydrates: 12, proteins: 23, fats: 23, calories: 300)
    assert_not entry.save
  end
end
