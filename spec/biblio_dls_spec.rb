require 'spec_helper'


describe Referencias do
    before :all do 
    	@libro = Libro.new('El secreto de los perfumes') do
    	    autor       :apellido => "Martin",
    	                :nombre => "Raul"
    	    autor       :apellido => "Dominguez",
    	                :nombre => "Adolfo"
    	    publicacion "2011/7/02"
    	    editorial   "Perfumes SA"
    	    edicion     "1"
    	    volumen     "1"
    	end
    	
    	@periodico = Periodico.new('La influencia de internet en los jovenes') do
    	    autor       :apellido => "Lindo",
    	                :nombre => "Elvira"
    	    autor       :apellido => "Piqueras",
    	                :nombre => "Pedro"
    	    publicacion "2011/7/02"
    	    editorial   "ABC"
    	    paginas     "130"
    	    
    	end
    	 
    	@doc_elec = Documento_elec.new('El futbolero') do
    	    autor       :apellido => "Mata",
    	                :nombre => "Juan"
    	    publicacion "2014/7/02"
    	    editorial   "Marca libros SA"
    	    edicion     "Futbolistas de hoy"
    	    formato     "PDF"
    	    url         "http://marca.com"
    	    fechacceso  "2014/7/02"
    	end
		
    		
	end
	
	describe "Insertar elementos" do
        it "Insertar libro y bien formateado" do
            @APA.insertar(@libro)
            expect(@APA.to_s).to eq("Martin, R. & Dominguez, A. (2011/7/02). El Secreto de los Perfumes (1) (1). Perfumes SA.\n")
        end
    end

end