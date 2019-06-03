require 'rest-client'
require 'json'

class Tradutor < Dados

  def initialize texto, idioma
    @data = {api: 'trnsl.1.1.20190526T041355Z.e4fc7ff8b307b313.41b0488abf86394f8bbafb0c3190cef77a1df6c9',
             url: 'https://translate.yandex.net/api/v1.5/tr.json/translate',
            texto: texto,
            lang: lang_valida?(idioma)}
  end

  def lang_valida? lang
    /[A-z]{2}\-[A-z]{2}/.match(lang)
  end

  def traduzir
    begin
      response = RestClient.get("#{@data[:url]}?key=#{@data[:api]}&text=#{@data[:texto]}&lang=#{@data[:lang]}")
      res = JSON.parse(response)
      salvar_dados(@data[:texto], res["text"])
    rescue RestClient::BadRequest
      puts 'Formato invalido, tente novamente'
    end
  end

end