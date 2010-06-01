xml = Builder::XmlMarkup.new

if params[:tp_rel]=="relAtividade" then
  xml.graph(:caption=>'Relatório por Atividade', :subcaption=>'por tempo') do
    rel.each do |x|
        xml.set(:name=>x.atividade,:value=>sec2time_grafico(x.tempo))
    end
  end
end