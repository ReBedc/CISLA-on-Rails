#!/usr/bin/ruby

 class Cajero
    def initialize(saldo=0,tit="Anonimo")
       @movimientos = []
       @saldo = saldo
       @titulares = tit
       if @titulares.respond_to? :join #duck typing
          puts "Bienvenidos #{@titulares.join(',')}"
       else
          puts "Bienvenido #{@titulares}"
       end
    end

    #Ésto es para que se pueda acceder al atributo privado @saldo
    attr_accessor :saldo
    attr_accessor :movimientos

    def ingresar(cantidad=0)
       if (cantidad > 0)
          @saldo += cantidad
       	  @movimientos << "+ #{cantidad} €"
          mostrar_saldo()
       else
          puts "No puedes ingresar una cantidad negativa"
       end
    end

    def sacar(cantidad=0)
    	if numeros_rojos?
           puts "Estas en números rojos!"
        else
           if cantidad < 0
              puts "No puedes sacar una cantidad negativa"
	   else 
       	     @saldo -= cantidad
       	     @movimientos << "- #{cantidad} €"
       	     puts "Sus #{cantidad} €"
       	  end
       end
       mostrar_saldo()
    end

    def mostrar_saldo()
       puts "Saldo actual: #{@saldo} €"
    end

#     private
    def numeros_rojos?
       @saldo < 0
    end

 end

#Ejecución
c = Cajero.new()
c.mostrar_saldo
c.ingresar 1000
c.sacar -1000
c.sacar(1500)
c.sacar(150)
c.ingresar -1000
puts c.movimientos
# c.numeros_rojos? #Error, el método es privado, no puede ser llamado desde aquí
c1 = Cajero.new(10,["Juan","Maria"])