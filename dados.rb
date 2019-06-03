class Dados

  @@imprimir =-> (texto, traducao) {
    puts '----------------------------------'
    puts "texto original: #{texto} "
    puts "traducão: #{traducao[0]} "
    puts '----------------------------------'
  }

  def salvar_dados texto ,traducao
    @@imprimir.call(texto, traducao) if set_Dados(texto, traducao) == 0
  end

  private
  def set_Dados texto ,traducao
    time = Time.now
    File.open("#{time.strftime('%d-%m-%y')}_#{time.strftime('%H:%M')}.txt", 'a') do |file|
      file.puts("texto original: #{texto}")
      file.puts("traducão: #{traducao[0]}")
    end
    return 0
  end

end