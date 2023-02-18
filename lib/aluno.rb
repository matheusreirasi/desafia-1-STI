class Aluno
    #attr_reader :nome, :matricula, :telefone, :email
    #attr_writer :uffmail, :status
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

    def uffmail_atualiza?
        return !uffmail_disponivel? && aluno_status?
    end

end
    