# in spec/aluno_spec.rb
require "./classes/aluno.rb"
require "./classes/db.rb"

RSpec.describe Aluno do
    db = DB.new("./database/lista.csv")
    aluno = Aluno.new(db.busca("105226"))

    describe "#initialize" do
        context "Classe está recebendo um aluno?" do
            it "retorna o nome se estiver funcinando" do
                expect(aluno.nome).to eq("Caua Melo Alves")
            end
        end
    end

    describe "#possui_uffmail?" do
        context "Aluno já possui UFFmail?" do
            it "por padrão deve retornar false caso haja uma conta cadastrada" do
                expect(aluno.possui_uffmail?).to eq(false)
            end
        end
    end

    describe "#aluno_status?" do
        context "O aluno possui matrícula ativa?" do
            it "retorna true se o aluno estiver ativo" do
                expect(aluno.aluno_status?).to eq(true)
            end
        end
    end
end