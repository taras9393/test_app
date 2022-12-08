require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
   @usr = User.new(name: "Bob", nick: "bobik@example.com", password: "tt123", password_confirmation: "tt123")
  end

  test "sould be valid" do
    assert @usr.valid?
  end

#  context 'nick is empty' do
#    @user.nick = nil

#    it 'user should be invalid' do
#      expect { @usr.invalid? }.to_eql true
#    end
#  end

#  context 'nick has length 51' do
#    @user.nick  = "w" * 51

#    it 'user should be invalid' do
#      expect { @usr.invalid? }.to_eql true
#    end
  #end

  #context 'nick is Artur' do
  #  @user.nick  = 'Artur'

  #  it 'user should be valid' do
  #    expect { @usr.invalid? }.to_eql false
  #  end
  #end

 test "validate attribute name" do
    @usr.name = ""
    assert @usr.invalid?
  end

 test "validate attribute nick" do
    @usr.nick = ""
    assert @usr.invalid?
 end

 test "check name length" do
  @usr.name = "w" * 51
  assert @usr.valid? == false
 end

 test "check nick length" do
 @usr.nick = "d" *  151
 assert @usr.valid? == false
 end

 test "should accept nicknames" do
  good_addresses = %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org
 first.last@foo.jp alice+bob@baz.cn)

   good_addresses.each do |g_addr|
   @usr.nick = g_addr
   assert @usr.valid? == true
   end
 end

 test "should reject nicknames" do
  bad_addresses = %w(user@example,com user_at_foo.org user.name@example.
  foo@bar_baz.com foo@bar+baz.com)

  bad_addresses.each do |b_addr|
  @usr.nick = b_addr
  assert @usr.invalid?
  end
 end

 test "email addresses should be unique" do
 duplicate_usr = @usr.dup
 duplicate_usr.nick = @usr.nick.upcase
 @usr.save
 assert duplicate_usr.invalid?
 end

 test "password minimum length" do
 @usr.password = @usr.password_confirmation = "w" * 5
 assert @usr.invalid? == true
 end

end
