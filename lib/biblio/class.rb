class Referencias
	
		include Comparable
		
		attr_accessor :autor, :titulo, :editorial, :publicacion
		def initialize(autor, titulo, editorial, publicacion)
			
			@editorial = editorial
			@publicacion = publicacion
			
			str=""
			autor.each do |a|
				separar = a.split(/\W+/)
				str+=separar[1]
				str+=", "
				unless separar[2].nil?
					str+=separar[2][0]
					str+=". "
				end
				str+=separar[0][0]
				str+="."
				str+=" & " unless a == autor.last
			end
			
			@autor = str
			
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
	attr_accessor :edicion, :volumen
	
	def initialize(autor, titulo, editorial, publicacion, edicion, volumen)
		
		super(autor,titulo,editorial,publicacion)
			@edicion = edicion
			@volumen = volumen
	end
	def to_s
			string=""
			string  << @autor << " (" << @publicacion << "). " << @titulo << " (" << @edicion.to_s << ") (" << @volumen.to_s << "). " << @editorial << "."
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
