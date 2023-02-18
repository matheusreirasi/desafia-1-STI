require "csv"

class DB


    def busca(matricula)
        CSV.foreach("./database/lista.csv", headers: true) do |conteudo|
            return conteudo if conteudo["matricula"] == matricula
        end
    end


    def busca_tabela(matricula)
        table = CSV.parse(File.read("./database/lista.csv"), headers: true)
        puts table
        for matricula_aluno in table.by_col[1]
            if matricula.to_s == matricula_aluno
                puts table[matricula_aluno]
            end
            next
        end
    end


    def uffmail_cadastrado? (uffmail)
        CSV.foreach("./database/lista.csv", headers:true) do |conteudo|
            if conteudo["uffmail"]==uffmail
              return true
            end
        end
        false
    end
end