def word_count(text)
  spaces = 0
  text.each_char do |character|
    if character == " "
      spaces += 1
    end
  end
  return spaces + 1
end

def sentence_count(text)
  sentences = 0
  text.each_char do |character|
    if character == "." || character == "?" || character == "!"
      sentences += 1
    end
  end
  return sentences
end

def other_punctuation_count(text)
  punct = 0
  text.each_char do |character|
    if character == "," || character == "\"" || character == "\'" || character == '-' || character == ';' || character == ':' || character == " "
      punct += 1
    end
  end
  return punct

end 

def avg_word_length(text)
  (text.length - other_punctuation_count(text) - sentence_count(text)).to_f/ word_count(text)
end

def avg_words_per_sentence(text)
  word_count(text).to_f / sentence_count(text)
end

def coleman_liau_index(text)
  index = (0.0588 * avg_word_length(text) * 100 - 0.296 * 100 / avg_words_per_sentence(text) - 15.8).round()
  if index >= 16
    "Grade 16+" 
  elsif index < 1
    "Before Grade 1"
  else
    "Grade #{index}"
  end 
end

def display_index(text)
  puts text + "(" + coleman_liau_index(text) + ")"
end

display_index("One fish. Two fish. Red fish. Blue fish.")
display_index("Would you like them here or there? I would not like them here or there. I would not like them anywhere.")
display_index("Congratulations! Today is your day. You're off to Great Places! You're off and away!")
display_index("Harry Potter was a highly unusual boy in many ways. For one thing, he hated the summer holidays more than any other time of year. For another, he really wanted to do his homework, but was forced to do it in secret, in the dead of the night. And he also happened to be a wizard.")
display_index("In my younger and more vulnerable years my father gave me some advice that I've been turning over in my mind ever since.")
display_index("Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, \"and what is the use of a book,\" thought Alice \"without pictures or conversation?\"")
display_index("When he was nearly thirteen, my brother Jem got his arm badly broken at the elbow. When it healed, and Jem's fears of never being able to play football were assuaged, he was seldom self-conscious about his injury. His left arm was somewhat shorter than his right; when he stood or walked, the back of his hand was at right angles to his body, his thumb parallel to his thigh.")
display_index("There are more things in Heaven and Earth, Horatio, than are dreamt of in your philosophy.")
display_index("It was a bright cold day in April, and the clocks were striking thirteen. Winston Smith, his chin nuzzled into his breast in an effort to escape the vile wind, slipped quickly through the glass doors of Victory Mansions, though not quickly enough to prevent a swirl of gritty dust from entering along with him.")
display_index("A large class of computational problems involve the determination of properties of graphs, digraphs, integers, arrays of integers, finite families of finite sets, boolean formulas and elements of other countable domains.")

# One fish. Two fish. Red fish. Blue fish. (Before Grade 1)
# Would you like them here or there? I would not like them here or there. I would not like them anywhere. (Grade 2)
# Congratulations! Today is your day. You're off to Great Places! You're off and away! (Grade 3)
# Harry Potter was a highly unusual boy in many ways. For one thing, he hated the summer holidays more than any... (Grade 5)
# In my younger and more vulnerable years my father gave me some advice that I've been turning over in my mind ever... (Grade 7)
# Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or... (Grade 8)
# When he was nearly thirteen, my brother Jem got his arm badly broken at the elbow. When it healed, and Jem's... (Grade 8)
# There are more things in Heaven and Earth, Horatio, than are dreamt of in your philosophy. (Grade 9)
# It was a bright cold day in April, and the clocks were striking thirteen. Winston Smith, his chin nuzzled... (Grade 10)
# A large class of computational problems involve the determination of properties of graphs, digraphs, integers... (Grade 16+)