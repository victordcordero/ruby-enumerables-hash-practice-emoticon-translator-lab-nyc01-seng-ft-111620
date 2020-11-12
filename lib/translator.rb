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
    return emoji[key][:english] if emoji[key][:japanese] == emoticon
  end
  end

  def get_english_meaning(path, emoticon)
    emoji = load_library(path)
    emoji.each do |key, value|
      return key if emoji[key][:japanese] == emoticon
    end

    # if emoji[:english].has_key?(emoticon)
    #   emoji[:english][emoticon]
    # else
    #   return "Sorry, that emoticon was not found"
    # end
end
