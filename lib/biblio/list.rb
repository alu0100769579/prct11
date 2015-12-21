
Node = Struct.new(:value, :next)
Node_ = Struct.new(:prev, :value, :next)

class   List
   
    def initialize ()
           
        @elemento = Node.new(nil)
    end
    
    def elemento
        
        @elemento
    end   
    
    def insertar_elemento(node)
        
        if @elemento != nil
            
            node.next = @elemento
            @elemento = node
        end
    end
    
    def extraer_elemento 
        
        aux = @elemento
        @elemento = @elemento.next
        aux.value
    end    
    
end

class Lista_doble
   
   include Enumerable
   
   attr_accessor :head, :tail
   
   def empty?
      
      @head == nil
   end
   
   def initialize()
      
      @head = nil
      @tail = nil 
   end
   
   def insertar_elemento(node)
      
      @node =  Node_.new(nil, node, nil)
      
      if @tail == nil
         @head = @node
         @tail = @node
         #@node
      else
          @node.next = @head
          @head.prev = @node
          @head = @node
          #@node
      end
      
   end
   
   def extraer_elemento
       
       @node = Node_.new(nil, @head.value, nil)
       
       @head = @head.next
       @head.prev = nil
       return @node
        
       #node = @head
       #if @head.next == nil
      #     @head = nil
     #  else
    #       @head = @head.next
       #end
       #return node
       
       #node = @head
       #@head = @head.next
       
       #node.next = nil
       #node.prev = nil
       
       #if @head == nil
        #  @tail = nil
       #end
       
       #return node
   end
   
   def each
       enum = @head
       while (enum != nil) 
            yield enum.value
            enum = enum.next
       end
   end
   
   def ordenar! 
		cambio = true
		while cambio
			cambio = false
			i = @head
			i_1 = @head.next
			while i_1 != nil
				if(i.value > i_1.value)
					i.value, i_1.value = i_1.value, i.value
					cambio = true
				end
				i = i_1
				i_1 = i_1.next
			end
		end
   end
	
	def to_s
		actual = @head
		cadena = "|"
			while !actual.nil?
				cadena << actual.value.to_s

				if !actual.next.nil?
					cadena << ", "
				end

				actual = actual.next
			end
		cadena << "|"
		return cadena
	end
	
	def each (&block)
		copia = @head
		while !copia.nil?
			block.call(copia.value)
			copia = copia.next
		end
	end
   

end