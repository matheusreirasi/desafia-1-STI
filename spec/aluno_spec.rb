require "aluno"
RSpec.describe Aluno do
    subject(:aluno) {false_class.new(bool)}
    describe "#uffmail_disponivel" do
        context "Uffmail está disponível?" do
            let(:aluno) {false}
            it "retorna a disponibilidade do Uffmail" do
                expect(aluno.uffmail_disponivel).to eq(false)
            end
        end
    end
end