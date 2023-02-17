#!usr/bin/env ruby

require "./lib/aluno.rb"
require "./lib/db.rb"
require "./lib/gerador.rb"

db = DB.new

puts "Digite sua matricula:"
matricula = gets.chomp
puts "\n"

busca = db.busca(matricula)

if busca
    aluno = Aluno.new(busca)
    
    if aluno.aluno_status?
        puts "Olá #{aluno.nome}. \nAqui estão algumas opções de UFFmail para você escolher"
        puts "\n"

        opcoes = Gerador.new
        puts opcoes.opcoes_uffmail(aluno.nome)
    else
        puts "Aluno com matricula inativa"
    end

end

##aluno ativo com uffmail 105794
##aluno ativo sem uffmail 105226
##aluno inativo sem uffmail 100484