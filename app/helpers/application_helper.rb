# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  require "fusioncharts_helper"
	include FusionChartsHelper

  def flash_message
    messages = ""
    [:notice, :info, :warning, :error].each {|type|
      if flash[type]
        messages += "<div id=\"msg_#{type}\" class=\"msg_#{type}\" align=\"center\"><h1>#{flash[type]}</h1></div>"
      end
    }
    messages
  end

  def sec2time_grafico(tempo)
      t=tempo.split(":")
      retorno=((((t[0].to_i*60)+(t[1].to_i))*60)+t[2].to_i)/60
    return retorno
  end

  def convert_hour(tempo)
    t = tempo.split(":")

    #converte hora em minutos
    horas = t[0].to_i*60
    minutos = t[1].to_i
    segundos = t[2].to_i/60

    retorno = ((horas.to_f+minutos.to_f+segundos.to_f)/60)
    return retorno
  end

end
