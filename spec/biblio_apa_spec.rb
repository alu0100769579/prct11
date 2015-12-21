require "spec_helper"

describe Apa do
    before :all do 
    	@libro = Book.new(["Raul Martin","Adolfo Dominguez"], "El Secreto De Los Perfumes", "Perfumes SA", "2011/7/02", 1, 1)
		@periodico = Libro::Periodico.new(["Elvira Lindo","Pedro Piqueras"], "La Influencia de internet en los jovenes", "2011/7/02", "ABC", 130)
		@documento = Libro::Elec_Document.new(["Juan Mata"], "El futbolero", "Marca libros SA", "Futbolistas de hoy", "2014/7/02", "PDF", "http://marca.com", "2014/7/02")
    end

    before :each do
        @APA = Apa.new
    end
    
    describe "Insertar elementos" do
        it "Insertar libro y bien formateado" do
            @APA.insertar(@libro)
            expect(@APA.to_s).to eq("Martin, R. & Dominguez, A. (2011/7/02). El Secreto de los Perfumes (1) (1). Perfumes SA.\n")
        end
        it "Insertar periodico y bien formateado" do
            @APA.insertar(@periodico)
            expect(@APA.to_s).to eq("Lindo, E. & Piqueras, P. (ABC). La Influencia de Internet en los Jovenes. 2011/7/02, pp. 130.\n")
        end
        it "Insertar documento electronico" do
            @APA.insertar(@documento)
            expect(@APA.to_s).to eq("Mata, J. (2014/7/02). El FutboleroPDF. Marca libros SA: Futbolistas de hoy. Disponible en: http://marca.com (2014/7/02). \n")
        end
        it "Insertar todo y bien formateado" do
        @APA.insertar(@documento)
        @APA.insertar(@periodico)
        @APA.insertar(@libro)
    
        expect(@APA.to_s).to eq("Martin, R. & Dominguez, A. (2011/7/02). El Secreto de los Perfumes (1) (1). Perfumes SA.\nMata, J. (2014/7/02). El FutboleroPDF. Marca libros SA: Futbolistas de hoy. Disponible en: http://marca.com (2014/7/02). \nLindo, E. & Piqueras, P. (ABC). La Influencia de Internet en los Jovenes. 2011/7/02, pp. 130.\n")
        end
    end
end