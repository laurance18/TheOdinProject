require 'pry-byebug'

hash = {
  ruby: { initial_release: 'December 25, 1996', is_beautiful?: true },
  javascript: { initial_release: 'December 4, 1995', is_beautiful?: false }
}

beautiful_languages = {}
hash.each do |lang, value|
  puts lang.class
  # if lang[:is_beautiful?]
  #   beautiful_languages[lang] = value
  # end
end


