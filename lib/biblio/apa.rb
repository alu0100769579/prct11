require "biblio/class"

class Apa
    include Enumerable
    
    def initialize()
        @lista = Lista_doble.new
    end
    
    def insertar(referencia)
        @lista.insertar_elemento(referencia)
        @lista.ordenar!
    end
    
    def each
        @lista.each{ |i| yield i}
    end
    
    def to_s
		string = ""
		@lista.each do |i|
			string << i.to_s
			string << "\n"
		end
		return string
	end    
end