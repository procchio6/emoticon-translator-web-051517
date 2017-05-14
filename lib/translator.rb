require 'yaml'
require 'byebug'
def load_library(path)
  library = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  emoticons = YAML.load_file(path)
  emoticons.each do | meaning, emoticons |
    english_emoticon = emoticons[0]
    japanese_emoticon = emoticons[1]
    library["get_meaning"][japanese_emoticon] = meaning
    library["get_emoticon"][english_emoticon] = japanese_emoticon
  end
  library
end

def get_japanese_emoticon(library_path, english_emoticon)
  library = load_library(library_path)
  japanese_emoticon = library["get_emoticon"][english_emoticon]
  if japanese_emoticon.nil?
    "Sorry, that emoticon was not found"
  else
    japanese_emoticon
  end
end

def get_english_meaning(library_path, japanese_emoticon)
  library = load_library(library_path)
  meaning = library["get_meaning"][japanese_emoticon]
  if meaning.nil?
    "Sorry, that emoticon was not found"
  else
    meaning
  end
end
