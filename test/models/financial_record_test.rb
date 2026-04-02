require "test_helper"

class FinancialRecordTest < ActiveSupport::TestCase
  def setup
    @user = User.create(
      name: "Jack Sparrow",
      email: "jack@test.com",
      role: "admin",
      status: "active"
    )

    @record = FinancialRecord.new(
      amount: 5000,
      record_type: "income",
      category: "salary",
      date: Date.today,
      user: @user
    )
  end

  test "valid record should save" do
    assert @record.save
  end

  test "should not save without amount" do
    @record.amount = nil
    assert_not @record.save
  end

  test "should not allow negative amount" do
    @record.amount = -100
    assert_not @record.save
  end

  test "should not save without category" do
    @record.category = nil
    assert_not @record.save
  end

  test "should not save without user" do
    @record.user = nil
    assert_not @record.save
  end
end
