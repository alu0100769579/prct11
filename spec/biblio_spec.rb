require 'spec_helper'
require 'biblio'
=begin
describe Libro do
	before :each do
		@libro1 = Book.new(["Dave Thomas","Andy Hunt","Chad Fowler"], "The pragmatic programmers guide", "the facets of ruby", "Pragmatic Bookshelf", "4 edition", "2013,7,7", ["isbn-13: 978-1937785499","isbn-10: 19937785491"])
		@libro2 = Book.new(["Scott Chacon"], "Pro Git 2009th Edition", "Pro", "Apress", "2009 edition", "2009,8,27", ["ISBN-13: 978-1430218333", "ISBN-10: 1430218339"])
        @libro3 = Book.new(["David Flanagan", "Yukihiro Matsumoto"], "The Ruby Programming Language", "Serie", "OReilly Media", " 1 edition", "2008,2,4", ["ISBN-10: 0596516177", "ISBN-13: 978-0596516178"])
        @libro4 = Book.new(["David Chelimsky", "Dave Astels", " Bryan Helmkamp", "Dan North", "Zach Dennis", "Aslak Hellesoy"], "The RSpec Book: Behaviour Driven Development with RSpec, Cucumber, and Friends", "The Facets of Ruby", "Pragmatic Bookshelf", "1 edition", "2010,12,25", ["ISBN-10: 1934356379", "ISBN-13: 978-1934356371",])
        @libro5 = Book.new(["Richard E. Silverman"], "Git Pocket Guide", "Serie", "OReilly Media", "1 edition",  "2013,8,2", ["ISBN-10: 1449325866", "ISBN-13: 978-1449325862"])    
        
        @revista = Magazine.new(["Raul Martin"], "LPP", "Tercero", "ULL", "2015 edition", "2015,11,19", "123456789")
		        
        @documento = Elec_Document.new(["Gaspar Machin"], "El trotamundos", "Buscadores", "LA", "2014 edition", "2014,6,18", "www.documentos-electronicos.com")
        
        @node1 = Node.new(@libro1)
        @node2 = Node.new(@libro2)
        @node3 = Node.new(@libro3)
        @node4 = Node.new(@libro4)
        @node5 = Node.new(@libro5)
        
        @node6 = Node_.new(nil, @libro1, nil)
        
        
        @lista = List.new()
        @lista_doble = Lista_doble.new()
       
	end

	context "Node" do
		
		describe "Debe existir un Nodo de la lista con sus datos y su siguiente" do
		
			it "Almacenando valores" do
					expect(@node1.value).to eq(@libro1)
					expect(@node1.next).to eq(nil)
			end
			
		end
		
	end
	
	context "Lista" do
		
		describe "Se extrae el primer elemento de la lista" do
			it "Se extrae correctamente" do
				@lista.insertar_elemento(@node1)
				@lista.insertar_elemento(@node2)
				@lista.extraer_elemento
				expect(@lista.elemento).to eq(@node1)
			end
		end
		
		describe "Se puede insertar un elemento" do
			it "Se inserta correctamente" do
				@lista.insertar_elemento(@node3)
				expect(@lista.elemento).to eq(@node3)
			end
		end
		
		describe "Se pueden insertar varios elementos" do
			it "Se insertaron correctamente" do
				@lista.insertar_elemento(@node1)
				expect(@lista.elemento).to eq(@node1)
				@lista.insertar_elemento(@node2)
				expect(@lista.elemento).to eq(@node2)
				@lista.insertar_elemento(@node3)
				expect(@lista.elemento).to eq(@node3)
				@lista.insertar_elemento(@node4)
				expect(@lista.elemento).to eq(@node4)
				@lista.insertar_elemento(@node5)
				expect(@lista.elemento).to eq(@node5)
			end
		end
		
		describe "Debe existir una lista con su cabeza" do
			it "Existe" do
				@lista.insertar_elemento(@node1)
				expect(@lista.elemento).to eq(@node1)
			end
		end
	end
	
	context "Lista_Doble" do
	
		describe "Comprobar nodo de la lista doblemente enlazada" do
			it "Existe el nodo" do
				expect(@node6.prev).to eq(nil)
				expect(@node6.next).to eq(nil)
			end
		end
		
		describe "Comprobar lista doblemente enlazada" do
			it "La lista esta vacia" do
				expect(@lista_doble.empty?).to eq(true)
			end
		end
		
		describe "Existe una lista doblemente enlazada" do
			it "Se puede insertar un nodo a la lista" do
				@lista_doble.insertar_elemento(@libro1)
				expect(@lista_doble.head.value).to eq(@libro1)
			end
		end
		
		describe "Se pueden insertar varior elementos a la dll" do
			it "Se insertan correctamente" do
				@lista_doble.insertar_elemento(@libro1)
				@lista_doble.insertar_elemento(@libro2)
				@lista_doble.insertar_elemento(@libro3)
				@lista_doble.insertar_elemento(@libro4)
				@lista_doble.insertar_elemento(@libro5)
				
				expect(@lista_doble.head.value).to eq(@libro5)
				expect(@lista_doble.head.next.value).to eq(@libro4)
				expect(@lista_doble.head.next.next.value).to eq(@libro3)
				expect(@lista_doble.head.next.next.next.value).to eq(@libro2)
				expect(@lista_doble.tail.value).to eq(@libro1)
			end
		end
		
		#describe "Se puede extraer un elemento de la dll" do
		#	it "Se extraer correctamente" do
		#		@lista_doble.insertar_elemento(@libro1)
		#		@lista_doble.extraer_elemento
		#		expect(@lista_doble.empty?).to eq(true)
		#	end
		#end
	
#		
#		describe "Se pueden extraer varios elementos de la dll" do
#			it "Se extraen correctamente" do
#				@lista_doble.insertar_elemento(@libro1)
#				@lista_doble.insertar_elemento(@libro2)
#				@lista_doble.extraer_elemento
#				@lista_doble.extraer_elemento
#				expect(@lista_doble.empty?).to eq(true)
#			end
#		end
		
		describe "Se puede recorrer la lista de izquierda a derecha" do
			it "Se recorre perfectamente" do
				@lista_doble.insertar_elemento(@libro1)
				@lista_doble.insertar_elemento(@libro2)
				
				expect(@lista_doble.head.value).to eq(@libro2)
				expect(@lista_doble.head.next.value).to eq(@libro1)
			end
		end
		
		describe "Se puede recorrer la lista de derecha a izquierda" do
			it "Se recorre perfectamente" do
				@lista_doble.insertar_elemento(@libro1)
				@lista_doble.insertar_elemento(@libro2)
				
				expect(@lista_doble.tail.value).to eq(@libro1)
				expect(@lista_doble.head.value).to eq(@libro2)
			end
		end
	
	end
	
	
	context "Jerarquia" do
	
		describe "Comprobar la herencia" do
			it "Magazine es una clase herencia de Libro" do
				expect(@revista.is_a? Magazine).to eq(true)
				expect(@revista.kind_of? Libro).to eq(true)
			end
			
			it "Book es una clase herencia de Libro" do
				expect(@libro1.is_a? Book).to eq(true)
				expect(@libro1.kind_of? Libro).to eq(true)
			end
			
			it "Magazine es una clase herencia de Libro" do
				expect(@documento.is_a? Elec_Document).to eq(true)
				expect(@documento.kind_of? Libro).to eq(true)
			end
			
			it "Comprobar que una revista no es una instancia de libro" do
				expect(@revista.instance_of? Libro).to eq(false)	
			end
			
			it "Comprobar que una libro no es una instancia de libro" do
				expect(@libro1.instance_of? Libro).to eq(false)	
			end
			
			it "Comprobar que una documento electronico no es una instancia de libro" do
				expect(@rdocumento.instance_of? Libro).to eq(false)	
			end
		end
	end
	
	context "Comparable" do
		
		describe "Comprobando clase Libro comparable" do
			
			it "Comprobando primer elemento es menor de fecha que el segundo" do
				expect(@libro2 < @libro1).to be true
			end
		
			it "Comprobando primer elemento es mayor de fecha que el segundo" do
				expect(@revista > @libro1).to be true
			end
			
			it "Comprobando primer elemento es menor o igual de fecha que el segundo" do
				expect(@documento <= @revista).to be true
			end
			
			it "Comprobando primer elemento es mayor o igual de fecha que el segundo" do
				expect(@documento >= @libro3).to be true
			end
			
			it "Comprobando primer elemento es distinto de fecha al segundo" do
				expect(@libro4 == @libro5).to be false	
			end
		end
	end
	
	
	context "Enumerable" do
		
		describe "Comprobancion clase Lista_doble enumerable" do
			
			it "Minimo de la lista" do
				@lista_doble.insertar_elemento(@libro1)
				@lista_doble.insertar_elemento(@libro2)
				@lista_doble.insertar_elemento(@libro3)
				@lista_doble.insertar_elemento(@libro4)
				@lista_doble.insertar_elemento(@libro5)
				@lista_doble.insertar_elemento(@revista)
				@lista_doble.insertar_elemento(@documento)
				
				expect(@lista_doble.min).to eq(@libro3)
			end
			
			it "Maximo de la lista" do
				@lista_doble.insertar_elemento(@libro1)
				@lista_doble.insertar_elemento(@libro2)
				@lista_doble.insertar_elemento(@libro3)
				@lista_doble.insertar_elemento(@libro4)
				@lista_doble.insertar_elemento(@libro5)
				@lista_doble.insertar_elemento(@revista)
				@lista_doble.insertar_elemento(@documento)
				
				expect(@lista_doble.max).to eq(@revista)
			end
			
			it "Orden de la lista" do
				@lista_doble.insertar_elemento(@libro1)
				@lista_doble.insertar_elemento(@libro2)
				@lista_doble.insertar_elemento(@libro3)
				@lista_doble.insertar_elemento(@libro4)
				@lista_doble.insertar_elemento(@libro5)
				@lista_doble.insertar_elemento(@revista)
				@lista_doble.insertar_elemento(@documento)
				
				expect(@lista_doble.sort).to eq([@libro3, @libro2, @libro4, @libro1, @libro5, @documento, @revista])
			end
		end
	end



	context "Libro" do
		
		describe "Debe existir uno o mas autores" do
			it "Se almacenan correctamente los autores y hay un metodo para obtenerlos" do
				expect(@libro1.autor).to eq(["Dave Thomas","Andy Hunt","Chad Fowler"])
				
			end
		end
		
		describe "Debe existir un titulo y hay un metodo para obtenerlo" do
			it "Se almacena correctamente el titulo" do
				expect(@libro1.titulo).to eq("The pragmatic programmers guide")
				
			end
		end
	
		describe "Debe existir o no una serie y hay un metodo para obtenerla" do
			it "En el libro 1 no debe haber serie" do
				expect(@libro1.serie).to eq("the facets of ruby")
			end
		
		end
	
		describe "Debe existir una editorial y hay un metodo para obtenerla" do
			it "Se almacena correctamente la editorial" do
				expect(@libro1.editorial).to eq("Pragmatic Bookshelf")
				
			end
		end
	
		describe "Debe existir un numero de edicion y hay un metodo para obtenerlo" do
			it "Se almacenan correctamente las ediciones" do
				expect(@libro1.edicion).to eq("4 edition")
				
			end
		end 
	
		describe "Debe existir una fecha de publicacion y hay un metodo para obtenerla" do
			it "Se almacenan correctamente las fechas" do
				expect(@libro1.publicacion).to eq("2013,7,7")
			
			end
		end
	
		describe "Debe existir uno o mas numeros ISBN y hay un metodo para obtenerlos" do
			it "En el libro 1 estan el ISB-10 y el 13" do
				expect(@libro1.isbn).to eq(["isbn-13: 978-1937785499","isbn-10: 19937785491"])
			end
		end
	  
	  #describe "Debe existir una referencia formateada" do
	    #it "Referencia formateada" do
	      #expect(@libro1.to_s).to eq("Dave Thomas, Andy Hunt, Chad Fowler\nThe pragmatic programmers guide\n(the facets of ruby)\nPragmatic Bookshelf; 4 edition (July 7, 2013)\nisbn-13, isbn-10")
	    #end
	  #end
	  
	end

end

=end