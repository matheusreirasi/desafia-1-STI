require "csv"

class DB
    attr_accessor :path
    
    def initialize(path)
        @path = path
    end
    
    def busca(matricula)
        CSV.foreach(@path, headers: true) do |conteudo|
            return conteudo if conteudo["matricula"] == matricula
        end
        puts "Matricula inexistente ou incorreta"
    end


    def uffmail_cadastrado? (uffmail)
        CSV.foreach(@path, headers:true) do |conteudo|
            if conteudo["uffmail"]==uffmail
              return true
            end
        end
        false
    end
end