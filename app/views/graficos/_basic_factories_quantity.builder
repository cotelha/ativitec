xml = Builder::XmlMarkup.new

if params[:tp_rel]=="relDominioTempo" then
  xml.graph(:caption=>'Relatório de Domínio', :subcaption=>'por tempo (hrs)', :palette=>"4", :decimals=>"2", :enableSmartLabels=>"1", :enableRotation=>"0", :bgAlpha=>"0", :canvasBgAlpha=>"0", :showBorder=>"0", :startingAngle=>"70") do
    proxy_rel.each do |x|
        xml.set(:name=>x.dominio,:value=>sec2time_grafico(x.tempo))
    end
  end
end