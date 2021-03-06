require "yaml"
require "pry"

def load_library(path)
  emoji_hash = {}
  emoji = YAML.load_file(path)
  emoji.each do |word, emojis|
    emoji_hash[word] = {}
    emoji_hash[word][:english] = emojis[0]
    emoji_hash[word][:japanese] = emojis[1]
  end
  emoji_hash
  end

def get_japanese_emoticon(path, emoticon)
  japanese = nil
  emoji = load_library(path)
  emoji.each do |key, value|
    japanese = emoji[key][:japanese] if emoji[key][:english] == emoticon
  end
  if japanese
    return japanese
  else
    return "Sorry, that emoticon was not found"
  end
  end

  def get_english_meaning(path, emoticon)
    english = nil
    emoji = load_library(path)
    emoji.each do |key, value|
      english = key if emoji[key][:japanese] == emoticon
    end
    if english
      return english
    else
      return "Sorry, that emoticon was not found"
    end
    end
    # if emoji[:english].has_key?(emoticon)
    #   emoji[:english][emoticon]
    # else
    #   return "Sorry, that emoticon was not found"
    # end
