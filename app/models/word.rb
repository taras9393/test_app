class Word < ApplicationRecord

 before_save {self.eng_word = self.eng_word.downcase}
 before_save {self.ua_word = self.ua_word.downcase}

 validates :eng_word, presence: true, length: {maximum: 22, minimum: 2}, uniqueness: {case_sensitive: false}
 validates :ua_word, presence: true, length: {maximum: 22, minimum: 2}

end
