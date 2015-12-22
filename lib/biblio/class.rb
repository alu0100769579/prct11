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
			
			@autor = "" if @autor.nil?
			@autor << autores(autor[:nombre], autor[:apellido])
		end
		
		def autores(nombre, apellido)
			str = "#{apellido}, "
			str << "#{nombre[0]}."
			str << " & "
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
			@autor = @autor[0...-3]
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
		
		@volumen = volumen
	end
	
	def to_s
			"#{@autor} (#{@publicacion}). #{@titulo} (#{@edicion.to_s}) (#{@volumen.to_s}). #{@editorial}."
	end
end

class Periodico < Referencias
	
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
	
	def paginas(paginas)
		
		@paginas = paginas
	end
	
	def to_s
		
		"#{@autor} (#{@editorial}). #{@titulo}. #{@publicacion}, p. #{@paginas}."
	end
end


class Documento_elec < Referencias
	
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
	
	def formato(formato)
		
		@formato = formato
	end
	
	def url(url)
		
		@url = url
	end
	
	def fechacceso(fechacceso)
		
		@fechacceso = fechacceso
	end
	
	def edicion(edicion)
		
		@edicion = edicion
	end
	
	def to_s
		
		"#{@autor} (#{@publicacion}). #{@titulo} (#{@formato}). #{@editorial}: #{@edicion}. Disponible en: #{@url} (#{@fechacceso})."
	end
end
