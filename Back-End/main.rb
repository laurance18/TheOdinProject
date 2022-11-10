require 'pry-byebug'

def yell_greeting(string)
  name = string
  name = name.downcase

  # binding.pry

  greeting = "WASSAP, #{name}!"
end

p yell_greeting("BOB")