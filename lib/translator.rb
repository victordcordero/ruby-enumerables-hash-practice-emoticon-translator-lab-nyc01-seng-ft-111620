require "yaml"
require "pry"

def load_library (file_path)



  emoticon_dictionary = {}
  emoticon_dictionary["get_meaning"] = {} #get meaning keys are JP emoji and values are plain text
  emoticon_dictionary["get_emoticon"] = {} #get emoticon keys are usa emojis and keys are jp emojis


  # GET MEANING ==> { JP-EMOJI ==> PLAIN TEXT}
  # GET EMOTICON ==> { USA-EMOJI ==> JP-EMOJI}

  emoticon_file = YAML.load_file(file_path)


  emoticon_file.each do |emoticon_text, emoticon_icons_array|

    # emoticon_icon_array.each_with_index { |item, index|
    #   if index == 0
    #       usa = item
    #   elsif index == 1
    #       jp = item
    #   end
    # }

      usa, jp = emoticon_icons_array

      emoticon_dictionary["get_emoticon"][usa] = jp
      emoticon_dictionary["get_meaning"][jp] = emoticon_text

     # binding.pry
    emoticon_dictionary
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
