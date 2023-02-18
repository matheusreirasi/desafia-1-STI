require "csv"
require "./classes/db.rb"

RSpec.describe DB do
    db = DB.new("./database/lista.csv")

    describe "#busca" do
        context "Procura no database a matricula do aluno" do
            it "retorna um array contendo todos os dados do aluno" do
                expect(db.busca("105226")).to eq(CSV)
            end
        end
    end
end