require "yaml"
require "pry"

def load_library(library)
  new_hash = {
   "get_meaning" => {},
   "get_emoticon" => {}
 }
 library.each do |meaning, translation|
   english = translation[0]
   japanese = translation[1]
   new_hash["get_meaning"][japanese] = meaning
   new_hash["get_emoticon"][english] = japanese
 end
  return new_hash
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
