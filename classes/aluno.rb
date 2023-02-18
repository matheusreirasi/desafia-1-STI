class Aluno
    attr_accessor :nome, :matricula, :telefone, :email, :uffmail, :status

    def initialize(aluno)
        @nome = aluno["nome"]
        @matricula = aluno["matricula"]
        @telefone = aluno["telefone"]
        @email = aluno["email"]
        @uffmail = aluno["uffmail"]
        @status = aluno["status"]
    end

    def possui_uffmail?
        return @uffmail != nil
    end

    def aluno_status?
        return @status == "Ativo"
    end
end
    