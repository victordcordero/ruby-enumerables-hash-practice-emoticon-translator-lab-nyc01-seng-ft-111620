require "yaml"
require "pry"

def load_library(path)
  emoji_hash = {}
  emoji_hash["get_meaning"] = {}
  emoji_hash["japanese"] = {}
  emoji = YAML.load_file(path)
  emoji.each do |word, emojis|
      binding.pry
    emoji_hash["get_meaning"][emojis[1]] = word
    emoji_hash["japanese"][emojis[0]] = emojis[1]
  binding.pry
  end
  emoji_hash
end

def get_japanese_emoticon(path, emoticon)
  emoji = load_library(path)
  if emoji["get_emoticon"].has_key?(emoticon)
    emoji["get_emoticon"][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
  end

  def get_english_meaning(path, emoticon)
    emoji = load_library(path)
    if emoji["get_meaning"].has_key?(emoticon)
      emoji["get_meaning"][emoticon]
    else
      return "Sorry, that emoticon was not found"
    end
  end
