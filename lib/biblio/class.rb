require 'biblio'

class Referencias
	
		include Comparable
		
		def editorial(editorial)
			
			@editorial = editorial
		end
		
		
		def publicacion(publicacion)
			
			@publicacion = publicacion
		end
		
		
		def autor(autor)
			
			str = "#{apellido}, "
			str << "#{nombre[0]}."
			str << " & "
			
			@autor << str(autor[:nombre], autor[:apellido])
		end
		
		
		def initialize(titulo)
			
			tit = titulo.split(' ')
			tit.each do |word|
				if word.length > 3
					word.capitalize!
				else
					word.downcase!
				end
				if word == tit[0]
					word.capitalize!
				end
			end

			@titulo = tit.join(' ')
		end
		
		
		def <=> (other)
			
			@publicacion <=> other.publicacion	
		end
end

class Libro < Referencias


	def initialize(titulo, &block)

		if block_given?
			if block.arity == 1
				yield self
				
			else
				instance_eval &block
			end
		end
		
		super(titulo)
	end
	
	def edicion(edicion)
		
		@edicion = edicion
	end
	
	def volumen(volumen)
		
		@volunmen = volumen
	end
	
	def to_s
			"#{@autor} (#{@publicacion}). #{@titulo} (#{@edicion.to_s}) (#{@volumen.to_s}). #{@editorial}."
	end
end

class Periodico < Referencias
	
	attr_accessor :paginas, :formato
	
	def initialize(autor, titulo, editorial, publicacion, paginas)
		formato = "Papel"
		super(autor,titulo,editorial,publicacion)
	
			@paginas = paginas
	end
	
	def to_s
		string = ""
		string << @autor << " (" << @publicacion << "). " << @titulo << ". " << @editorial << ", pp. " << @paginas.to_s << "."
	end
end



class Documento_elec < Referencias
	
	attr_accessor :formato, :url, :fechacceso
	
	def initialize(autor, titulo, editorial, edicion, publicacion, formato, url, fechacceso)
		super(autor,titulo,editorial,publicacion)
		@formato = formato
		@url = url
		@fechacceso = fechacceso
		@edicion = edicion
	end
		
	def to_s
		string = ""
		string << @autor << " (" << @publicacion << "). " << @titulo << @formato << ". " << @editorial << ": " << @edicion << ". Disponible en: " << @url << " (" << @fechacceso << "). "
	end
end
