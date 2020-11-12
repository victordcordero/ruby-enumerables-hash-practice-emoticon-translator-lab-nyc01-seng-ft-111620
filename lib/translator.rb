require "yaml"
require "pry"

def load_library(path)
  emoji_hash = {}
  emoji = YAML.load_file(path)
  emoji.each do |word, emojis|
    emoji_hash[word] = {}
    emoji_hash[word][:english] = emojis[0]
    emoji_hash[word][:japanese] = emojis[1]
    # emoji_hash["get_meaning"][emojis[1]] = word
    # emoji_hash["get_emoticon"][emojis[0]] = emojis[1]
  end
  emoji_hash
  end

def get_japanese_emoticon(path, emoticon)
  emoji = load_library(path)
  if emoji[:japanese].has_key?(emoticon)
    emoji[:english][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  end

  def get_english_meaning(path, emoticon)
    emoji = load_library(path)
    if emoji[:english].has_key?(emoticon)
      emoji[:japanese][emoticon]
    else
      return "Sorry, that emoticon was not found"
    end
  end
