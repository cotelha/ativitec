xml = Builder::XmlMarkup.new

if params[:tp_rel]=="relAtividade" then
  xml.graph(:caption=>'Relatório por Atividade', :subcaption=>'por tempo') do
    rel.each do |x|
        xml.set(:name=>x.nome,:value=>(if x.tempo==nil then "00:00:00" else sec2time_grafico(x.tempo) end))
    end
  end
end

if params[:tp_rel]=="relMotivoAtividade" then
  xml.graph(:caption=>'Relatório por Motivo de Atividade', :subcaption=>'por tempo') do
    rel.each do |x|
        xml.set(:name=>x.nome,:value=>(if x.tempo==nil then "00:00:00" else sec2time_grafico(x.tempo) end))
    end
  end
end

if params[:tp_rel]=="relUsuario" then
  xml.graph(:caption=>'Relatório por Usuário', :subcaption=>'por tempo') do
    rel.each do |x|
        xml.set(:name=>x.nome,:value=>(if x.tempo==nil then "00:00:00" else sec2time_grafico(x.tempo) end))
    end
  end
end