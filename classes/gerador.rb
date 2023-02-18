require "./classes/db.rb"

class Gerador
    $db = DB.new("./database/lista.csv")
    
    def primeiro_ultimo_nome(nome)
        opcao = "1 - "

        numeracao = 1
        sugestao = nome[0].downcase << nome[2]
        sugestao_completa = "#{sugestao}" << "@id.uff.br"
        
        if $db.uffmail_cadastrado?(sugestao_completa)
            sugestao << numeracao.to_s
            sugestao_completa = "#{sugestao}" << "@id.uff.br"

            while $db.uffmail_cadastrado?(sugestao_completa)
                numeracao += 1
                sugestao << numeracao.to_s
                sugestao_completa = "#{sugestao}" << "@id.uff.br"
            end
        end
        return opcao + sugestao_completa
    end


    def primeiro_ponto_ultimo(nome)
        opcao = "2 - "

        numeracao = 1
        sugestao = nome[0] << "." << nome[2]
        sugestao_completa = "#{sugestao}@id.uff.br"

        if $db.uffmail_cadastrado?(sugestao_completa)
            sugestao << numeracao.to_s
            sugestao_completa = "#{sugestao}@id.uff.br"

            while $db.uffmail_cadastrado?(sugestao_completa)
                numeracao += 1
                sugestao << numeracao.to_s
                sugestao_completa = "#{sugestao}@id.uff.br"
            end
        end
        return opcao + sugestao_completa
    end

    
    def primeira_letra_ultimo_nome(nome)
        opcao = "3 - "

        numeracao = 0
        sugestao = nome[numeracao].chars[0].downcase << nome[2]
        sugestao_completa = "#{sugestao}@id.uff.br"

        if $db.uffmail_cadastrado?(sugestao_completa)
            numeracao += 1
            sugestao << nome[numeracao].chars[0].downcase
            sugestao_completa = "#{sugestao}@id.uff.br"

            while $db.uffmail_cadastrado?(sugestao_completa)
                if numeracao > 2
                    numeracao = 0
                    sugestao << numeracao.to_s
                    sugestao_completa = "#{sugestao}@id.uff.br"
                end
            end
        end
        return opcao + sugestao_completa
    end


    def opcoes_uffmail(aluno)
        nome = aluno.split(" ")
        opcoes = []
        opcoes << primeiro_ultimo_nome(nome)
        opcoes << primeiro_ponto_ultimo(nome)
        opcoes << primeira_letra_ultimo_nome(nome)
        return opcoes
    end

end
