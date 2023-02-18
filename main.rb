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
        if !aluno.possui_uffmail?
            puts "Olá #{aluno.nome}. \nAqui estão algumas opções de UFFmail para você escolher"
            puts "\n"

            opcoes = Gerador.new.opcoes_uffmail(aluno.nome)
            puts opcoes
            puts "\n"

            loop do
                escolha = gets.chomp.to_i
                if escolha > opcoes.length || escolha < 1
                    puts "Digite um dos números acicma referente ao UFFmail"
                    next
                else
                    puts "\n"
                    puts "Email #{opcoes[escolha - 1].split[2]} cadastrado com sucesso.\nSua senha de accesso foi encaminhada para seu número #{aluno.telefone}."
                    break
                end
            end

        else
            puts "Aluno já possui UFFmail cadastrado"
        end
    else
        puts "Aluno com matricula inativa"
    end

end

##aluno ativo com uffmail 105794
##aluno ativo sem uffmail 105226
##aluno inativo sem uffmail 100484