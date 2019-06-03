require_relative 'dados'
require_relative 'tradutor'

puts '---------------------'
puts 'Digite o texto a ser traduzido'
texto = gets.to_s
puts 'Digite o idioma atual e o idioma para ser traduzido (Ex: pt-en '
idioma = gets.to_s

trd = Tradutor.new(texto, idioma)
trd.traduzir
