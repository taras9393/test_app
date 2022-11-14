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
                               
