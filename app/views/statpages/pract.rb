a = {dog6: "kko"}
a[:dog1] = "rrr"
a[:dog2] = "sdgsf"
puts(a)

                              !!!!!!!  Вложенные хэши !!!!

h = {:user1 => {:name => "Bob", :email => "kdfj@mail.com"}}
h[:user2] = {:name => "John", :email => "sfdklff@mail.com"}
puts(h)
puts(h[:user2][:name])
************************************************************
hash = {:nice => "good result", :fail => "bad result", :medium => "not so bad"}
hash.each do |k, v|
  puts "Key #{k.inspect} has value #{v.inspect}"
end

                                                                                                            /bin/bash --login
                                   !!!!!!!   OOП  !!!!!!!!!

a = "ttrree"
b = String.new("ttrree")
puts(b == a)
***********************************
h = Hash.new("key not found")
h[:key1] = "sdffwe"
puts(h[:ssdf])
puts(h[:key1])
**************************************************

class Word < String
 def plndrm
  self == self.reverse
 end
end
a = Word.new()
a = "level"                         ????????????????????????????????????????/
puts(a.plndrm)
******************************************************************

<%= link_to image_tag("rails.png", alt: "Rails logo"),
'http://rubyonrails.org/' %>

******************************************************************

           !!!!!!    Добавление гема bootstrap-sassgem в файл Gemfile !!!!!!

 gem 'bootstrap-sass', '3.2.0.0

 Добавление стилей из Bootstrap
 (app/assets/stylesheets/custom.css.scss)

 @import "bootstrap-sprockets";
 @import "bootstrap";

******************************************************************************

                                !!!!  Частичные шаблоны !!!!

<%= render "layouts/header"%>
У layouts створюємо шаблон  _header.html.erb

******************************************************************************

 def upcaser
  self.tr("a-z", "A-Z")
 end

a = "sdfgdhj"
puts(a.upcaser)
******************************************************************************
                                      MODELS

User.create(name: "sodkfjj", email: "lkdfj@com")      Створює нового юзера

                Можна добавити в змінну напр.
ussser1 = User.create(n..............)

        Або в 2 кроки:
uswer1 = User.new(...............)
uswer1.save

uswer1.destroy  ---  видаляє юзера
*************************************

User.find(id)   --- знайти по id-шці
User.find_by(name: "Bob")   ---- знайти по інших атрибутах
USer.all   ---- вивести список всіх
User.first ----- first
********************************

                       !!!!!!!! Обновление объектов User !!!!!!!

uswer1.name = "new_name"
uswer1.save
                АБО !!
uswer1.update_attribute(name: "new_name")

     Якщо треба змінити ДЕКІЛЬКА атрибутів !!

uswer1.update_attributes(name: "new_name", nick: "new_nick")

**************************************************

                         !!!!!!! Проверка объектов User !!!!!!!!
                                     TESTS   !!!!!!!!!


                          Проверка допустимости

class UserTest < ActiveSupport::TestCase
    def setup
          @usr = User.new(name: "Example User", email: "user@example.com")
    end

    test "should bee valid" do
    assert @usr.valid?
    end

                                Проверка наличия


    test "validate attribute name" do
       @usr.name = ""                                     <= if
       assert @usr.invalid?                              <= then
     end

    test "validate attribute nick" do
       @usr.nick = ""                                  <= if
       assert @usr.invalid?                             <= then
    end

                                   Проверка длины

    test "check name length" do
     @usr.name = "w" * 51
     assert @usr.valid? == false
    end

    test "check nick length" do
    @usr.nick = "d" *  151
    assert @usr.valid? == false
    end

                                    Проверка формата
    test "should accept nicknames" do
     good_addresses = %w(user@example.com USER@foo.COM A_US-ER@foo.bar.org
    first.last@foo.jp alice+bob@baz.cn)
     good_addresses.each do |addr|
     @usr.nick = addr                                            <= if
     assert @usr.valid? == true                                  <= then
    end
end

                                     Проверка уникальности

test "email addresses should be unique" do
duplicate_user = @user.dup
@user.save
assert_not duplicate_user.valid?
end

                             VALIDATES (models/user.rb) !!!!!!!!!!!!!!!
before_save {self.nick = self.nick.downcase}
validates :name, presence: true, length: { maximum: 50 }

VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: {case_sensitive: false}

has_secure_password
validates :password,  length: {minimum: 6}



****************************************************************
a = "fk"
arr = %w(3 4 dfg wer skdmfv)
arr.each do |el|
ol = "#{el} and #{a}"
puts ol
end
*****************************************************
duplicate_usr = @usr.dup                                      DUP !!!!!!!!!!!!!!!
**************************************************

rails g migration adding_index_to_email

class AddingIndexToEmail < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :nick, unique: true
  end        (табл)   (стовб.)
end

***************************************************************
before_save {self.nick = self.nick.downcase}
***********************************************************

                                            !!!!! Добавление безопасного пароля

 Миграция для добавления столбца password в таблицу users :

rails g migrate add_password_to_user password_digest:string

class AddPasswordToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_digest, :string
  end
end
***********
Чтобы создать дайджест пароля, метод has_secure_password использует хэш-
функцию bcrypt

Включение гема bcrypt в файл Gemfile

 gem "bcrypt" , "3.1.7"
*************************************************
                                       !! Очистить базу данных
rails db:migrate:reset
**************************************************
                                !!!   Форма регистрации !!!!!!!!!!!!!!!!!!!!!!!

  <%= form_for(@us_new) do |f|%>

  <%= f.label :name %>
  <%= f.text_field :name %>

  <%= f.label :nick, "Enter email" %>
  <%= f.email_field :nick %>

  <%= f.label :password %>
  <%= f.password_field :password %>

  <%= f.label :password_confirmation, "Confirm Password" %>
  <%= f.password_field :password_confirmation %>

  <%= f.submit "Create account", class: "btn btn-primary" %>


<% end %>
**************
   Kод на встроенном Ruby
 <%= f.label :name %>
 <%= f.text_field :name %>
    производит разметку HTML:
<label for="user_name">Name</label>
<input id="user_name" name="user[name]" type="text" />
***********************************************************************************

a = "skdfj"
b = a.tr('a-z', 'A-Z')
puts(b)



class String
  def upcaser
    self.tr("a-z", "A-Z")
  end
end

a = "lplololol"
puts(a.upcaser)
****************************************************
wine ~/.wine/drive_c/Games/EI/starter.exe

LC_ALL="ru_RU.UTF-8" wine ~/.wine/drive_c/Games/EI/starter.exe

***************************************************
tarik@ukr.net
qwerty
*************************************************
