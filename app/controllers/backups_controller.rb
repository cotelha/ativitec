class BackupsController < ApplicationController
  def index
    @backup = Backup.last
  end

  def dump
    %x[rm public/ativitec.sql; pg_dump ativitec -f public/ativitec.sql -F p -v -U postgres]
    #dropdb -U postgres ativitec
    #createdb -U postgres -E UTF8 ativitec
    #psql -d ativitec -f ativitec.sql -U postgres
    
    @backup = Backup.new(params[:backup])
    @backup.save
    send_file "#{RAILS_ROOT}/public/ativitec.sql"
  end

end
