#!/usr/bin/ruby
# coding: utf-8
 
def modo_print; ARGV[0]; end
def modo_color; ARGV[1]; end

#Funciones generales de texto
def color(texto,modo,frente,fondo)
  if modo_color == "color"
     "\033[#{modo};#{frente};#{fondo}m#{texto}\033[0m"
  else
     texto
  end
end
def rojo(texto);    color(texto,1,31,40); end
def verde(texto);   color(texto,1,32,40); end
def amarillo(texto);color(texto,1,33,40); end
def celeste(texto); color(texto,1,34,40); end
def azul(texto);    color(texto,0,34,40); end
def violeta(texto); color(texto,1,35,40); end
def cian(texto);    color(texto,1,36,40); end
def blanco(texto);  color(texto,1,37,40); end
def gris(texto);    color(texto,0,37,40); end
def br; "\n"; end

def imprimir(texto)
   if modo_print == "verbose"
      print texto
   end
end

#Comprueba si los elementos del array_b esta incluido en el array_a
def incluye(array_a, array_b)
   retorno = true
   for k in array_b
      retorno = retorno && array_a.include?(k)
   end
   retorno
end

#Dadas fila y columnna, indica el cuadro al que pertenece la posicion
def fccuadro(fila,columna)
  i = (fila) / 3
  j = (columna) / 3
  cuadro = i * 3 + j 
  cuadro
end

#Variable global para control de recursividad
$vuelta = 0

#Clase celda
class Celda
  
  #Initialize  
  def initialize
    @valor = 0
    @posible = Array.new(9) {|i| i+1}
  end
  
  #Lectura del atributo @posible
  def posible
    @posible
  end
  public :posible
  
  #Escritura del atributo @posible  
  def posible= posible
    @posible = posible
  end
  public :posible=
  
  #Lectura del atributo @valor
  def valor
    @valor
  end
  public :valor
  
  #Escritura del atributo @valor
  def valor=valor
    @valor = valor
    @posible = [valor]    
  end
  public :valor=
  
  #Metodo quitar. Elimina el valor de los posibles
  def quitar(valor)
    retorno=0
    if @posible.delete(valor) == valor
      retorno=1
    end
    retorno
  end
  public :quitar
  
  #Metodo to_s. Convierte el texto para imprimir
  def to_s
    @valor.to_s
  end
  public :to_s
  
end

#Clase grupo, implementacion de filas, columnnas y cuadros
class Grupo
  
  #Initialize
  def initialize
    @celdas = nil
  end
  
  #Lectura del atributo @celdas
  def celdas
    @celdas
  end
  public :celdas
  
  #Escritura del atributo @celdas
  def celdas=(celdas)
    @celdas=celdas
  end
  public :celdas=
  
  #Metodo quitar. Elimina el valor de los posibles para las celdas del grupo
  def quitar(valor)
    retorno = 0
    for i in 0..8
      if celdas[i].quitar(valor) > 0
		imprimir (i+1).to_s + " "
		retorno += 1
	  end
    end
    retorno
  end
  public :quitar
  
  #Metodo revisar. Aplica los valores posibles no impactados en las celdasceldas[i].posibles.length
  def revisar
    cambios = 0
    #verifico valores posibles únicos en el grupo
    for i in celdas
      for j in i.posible
        contador = 0
        for k in celdas
          for l in k.posible
            if (i != k and j == l)
              contador += 1
            end
          end
        end
        if (contador == 0 and i.valor != j)  
          i.posible = [j]
          cambios += 1
        end
      end
    end
    
    #busco combinaciones de N valores posibles que se repitan en N celdas
    #si encuentro, los dejo como únicos valores posibles de esas celdas
    for i in 0..8
       if celdas[i].posible.length < 9
          for j in 1..(celdas[i].posible.length)
             todas = celdas[i].posible.combination(j)
             #para cada combinacion posible de N digitos, me fijo si existe exactamente en otras N-1 celdas
             for k in todas
                k.uniq!
                cantidad = 0
                for l in 0..8
                   if incluye(celdas[l].posible,k)
                      cantidad += 1
                   end
                end
                if cantidad == j and j == k.length
                   cantidad_unitaria = 0
                   for l in 0..8
                      for m in k
                         if incluye(celdas[l].posible,[m]) and not incluye(celdas[l].posible,k) 
                            cantidad_unitaria += 1
                         end
                      end
                   end
                   if cantidad_unitaria == 0
                      for l in 0..8
                         resto = [1,2,3,4,5,6,7,8,9] - k
                         if incluye(celdas[l].posible,k)
                            for n in resto
                               cambios += celdas[l].quitar(n)
                            end
                         else
                            for n in k
                               cambios += celdas[l].quitar(n)
                            end
                         end
                      end
                      cambios
                   end
                end
             end
          end
       end
    end
    cambios
  end
  public :revisar
end 

#Clase tablero. Incluye el juego completo
class Tablero
  
  #Initialize
  def initialize
    
    @filas =    Array.new(9) {Grupo.new}
    @columnas = Array.new(9) {Grupo.new}
    @cuadros =  Array.new(9) {Grupo.new}
    
    #Creo las filas, con celdas nuevas
    for i in 0..8
      filas[i].celdas=Array.new(9) {Celda.new}
    end
    #Creo las columnas, asignando celdas de filas existentes
    for i in 0..8
      columnas[i].celdas=Array.new(9)
      for j in 0..8
        columnas[i].celdas[j]=filas[j].celdas[i]
      end
    end
    #Creo los cuadros, asignando celdas de filas y columnnas ya existentes
    for i in 0..2
      for j in 0..2
        cuadros[i*3+j].celdas=Array.new(9)
        for k in 0..2
          for l in 0..2
            cuadros[i*3+j].celdas[k*3+l]=filas[i*3+k].celdas[j*3+l]
          end
        end
      end
    end
  end
  
  #Lectura del atributo @filas
  def filas
    @filas
  end
  public :filas
  
  #Lectura del atributo @columnnas  
  def columnas
    @columnas
  end
  public :columnas
  
  #Lectura del atributo @cuadros
  def cuadros
    @cuadros
  end
  public :cuadros
  
  def lineas(inicio,medio,bifurcacion,fin,maximo)

    retorno = ""
    retorno += celeste(inicio + medio)
    for j in 0..8
      if j % 3 == 0 and j>0
        retorno += celeste(bifurcacion)
      end
      for k in 0..(maximo)
        retorno += celeste(medio)
      end
      if j % 3 == 0 and j>0
        retorno += celeste(medio)
      end
    end
    retorno += celeste(fin) + br  
    retorno

  end
  
  #Metodo to_s. Convierte el tablero a texto para imprimir
  def to_s
    retorno = ""
    maximo = 0
    minimo = 9
    for i in 0..8
      for j in 0..8
        if filas[i].celdas[j].posible.length > maximo
          maximo = filas[i].celdas[j].posible.length
        end
        if filas[i].celdas[j].posible.length < minimo
          minimo = filas[i].celdas[j].posible.length
        end
      end
    end
    
    #Primera Linea
    retorno += lineas("╔","═","╦","╗",maximo)
    
    for i in 0..8
      if i % 3 == 0 and i > 0
        retorno += lineas("╠","═","╬","╣",maximo)
      end
      for j in 0..8
        if j % 3 == 0
          retorno += celeste("║") + verde(" ")
        end
        actual = filas[i].celdas[j].posible.length
        espacios = maximo - actual
        for k in 1..espacios
          retorno += verde(" ")
        end
        if filas[i].celdas[j].valor != 0
           retorno += verde(filas[i].celdas[j].valor.to_s)
        else
          for k in filas[i].celdas[j].posible
             if actual == minimo
                retorno += amarillo(k.to_s)
             else
                retorno += rojo(k.to_s)
             end
          end
        end
        retorno += verde(" ")
      end
      retorno += celeste("║")
      retorno += br
    end   
    #Ultima Linea
    retorno += lineas("╚","═","╩","╝",maximo)
    
    retorno
  end 
  public :to_s

  #Metodo stream. Convierte el tablero a texto para pasar a otro programa
  def stream
    retorno = "sudoku" + "|"  + esta_resuelto.to_s + "|"
    
    for i in 0..8
       for j in 0..8
          for k in filas[i].celdas[j].posible
             retorno += k.to_s
          end
          if (i*j) < 64 
             retorno += ","
          end
       end 
    end   
    retorno += "|"
    retorno
  end 
  public :stream
   
  #Metodo cargar. Carga el tablero con lo recibido
  def cargar(tablero)
    for i in 0..8
      for j in 0..8
        v=tablero[i][j]
        if (v != 0)
          k = fccuadro(i,j)    
          filas[i].quitar(v)
          columnas[j].quitar(v)
          cuadros[k].quitar(v)  
          filas[i].celdas[j].valor=v
        end
      end
    end
  end
  public :cargar
  
  #Metodo esta_resuelto. Se fija si el tablero esta resuelto
  def esta_resuelto
    resuelto = true
    for i in 0..8
       for j in 0..8
          celda = filas[i].celdas[j]
          if celda.valor == 0
             resuelto = false
          end
       end
    end
    resuelto
  end

  #Metodo resolver. Resuelve el tablero de ser posible
  def resolver
   vueltas = 0
   begin
      cambios = 0
      for i in 0..8
        for j in 0..8
          celda = filas[i].celdas[j]
          v=celda.posible[0]
          if(celda.posible.length == 1 and celda.valor != v)
		    imprimir "   Asumiendo celda [" + (i+1).to_s + "," + (j+1).to_s + "] = " + v.to_s + ". "
            cambios += 1
         
            k = fccuadro(i,j)    
         
		    imprimir "Fila " + (i+1).to_s + " ( "
            filas[i].quitar(v)
			imprimir ") - "
			imprimir "Columna " + (j+1).to_s + " ( "
            columnas[j].quitar(v)
			imprimir ") - "
			imprimir "Cuadro " + (k+1).to_s + " ( "
            cuadros[k].quitar(v)  
			imprimir ") " + br
           
            filas[i].celdas[j].valor=v
          end
        end
      end
      for i in 0..8
        cambios += filas[i].revisar
      end
      for i in 0..8
        cambios += columnas[i].revisar
      end
      for i in 0..8
        cambios += cuadros[i].revisar
      end
      vueltas +=1
	  
	  imprimir br
      imprimir verde(" Final vuelta " + vueltas.to_s + ":") + br
      imprimir to_s + br
	  
    end while(cambios!=0 and vueltas < 5)
	
    if not esta_resuelto
       falla=false
       resuelto=false
       for i in 0..8
        if not falla and not resuelto
         for j in 0..8
             if not falla and not resuelto
                celda = filas[i].celdas[j]
                tablero_rec = nil
                vueltas_tmp = 0
                if celda.posible.length > 1
                   for k in celda.posible
                      if tablero_rec == nil or not tablero_rec.esta_resuelto
                         for x in 0..$vuelta
                            if x < $vuelta
                               imprimir celeste("║ ")
                            else
                               imprimir celeste("╚═")
                            end
                         end
                         imprimir celeste("[") + amarillo("#{i+1}") + celeste(",") + amarillo("#{j+1}") + celeste("]") + blanco(": probando con ") + celeste("#{k} ") + br
                         vueltas_tmp += 1
                         tablero_rec = Tablero.new
                         carga = Array.new(9){Array.new(9)}
                         for l in 0..8
                            for m in 0..8
                               if l==i and m== j
                                  carga[l][m] = k
                               else
                                  carga[l][m] = filas[l].celdas[m].valor
                               end
                            end
                         end
                         tablero_rec.cargar(carga)
                         $vuelta+=1
                         vueltas_tmp += tablero_rec.resolver
                         $vuelta-=1
                      end
                   end   
                end
                if tablero_rec != nil and tablero_rec.esta_resuelto
                   for l in 0..8
                      for m in 0..8
                         n=fccuadro(l,m)
                      
                         filas[l].quitar(tablero_rec.filas[l].celdas[m].valor)
                         columnas[m].quitar(tablero_rec.filas[l].celdas[m].valor)
                         cuadros[n].quitar(tablero_rec.filas[l].celdas[m].valor)
            
                         filas[l].celdas[m].valor=tablero_rec.filas[l].celdas[m].valor
                      end
                   end
                   resuelto=true
                   vueltas += vueltas_tmp
                elsif celda.posible.length > 1
                   falla=true
                end
             end
          end
        end
       end
    end
    vueltas
  end 
  public :resolver
  
end

#Aqui comienza la ejecución

if modo_print == "verbose"
   imprimir amarillo(" Modo verbose ")
else
   puts amarillo(" Modo silencioso")
end

if modo_color == "color"
   imprimir blanco("en ") + celeste("c") + amarillo("o") + rojo("l") + verde("o") + violeta("r") + blanco("!!") + br
else
   imprimir "en blanco y negro" + br
end

tablero = Tablero.new

imprimir "Cargando y limpiando tablero... " + br

tablero.cargar([
               
               #Basico: 4 vueltas
               #               [0,0,0,0,5,0,0,0,9], 
               #               [0,0,0,3,0,0,8,4,0],
               #               [4,3,0,1,8,7,0,6,0],
               #               [3,0,8,0,0,0,0,7,0],
               #               [0,0,0,4,3,2,0,0,0],
               #               [0,5,0,0,0,0,9,0,2],
               #               [0,4,0,2,1,0,0,9,8],
               #               [0,9,3,0,0,8,0,0,0],
               #               [7,0,0,0,9,0,0,0,0]
               
               #Intermedio: 11 vueltas, con recursividad
               #               [0,4,3,0,2,0,8,0,0], 
               #               [7,9,0,0,5,4,0,0,0],
               #               [0,0,0,0,0,0,0,0,9],
               #               [0,0,0,6,0,0,9,0,7],
               #               [0,0,0,5,0,8,0,0,0],
               #               [1,0,7,0,0,2,0,0,0],
               #               [3,0,0,0,0,0,0,0,0],
               #               [0,0,0,4,6,0,0,9,1],
               #               [0,0,5,0,8,0,7,2,0]
               
               #Avanzado: 10 vueltas, con recursividad
               #               [1,0,0,9,4,0,3,0,0], 
               #               [0,0,0,0,0,8,1,0,6],
               #               [9,0,0,0,0,0,0,2,0],
               #               [0,7,0,1,0,4,0,0,9],
               #               [6,0,4,0,9,0,7,0,1],
               #               [3,0,0,6,0,7,0,4,0],
               #               [0,9,0,0,0,0,0,0,4],
               #               [2,0,1,4,0,0,0,0,0],
               #               [0,0,3,0,7,6,0,0,8]
               
               #Otros: 5 vueltas
               #               [8,0,0,0,0,4,0,0,6],
               #               [2,0,0,0,5,0,1,0,0],
               #               [9,0,0,7,0,0,0,3,0],
               #               [5,0,0,0,0,0,0,0,9],
               #               [0,0,0,4,0,2,0,0,0],
               #               [1,0,0,0,0,0,0,0,8],
               #               [0,8,0,0,0,6,0,0,2],
               #               [0,0,7,0,3,0,0,0,5],
               #               [4,0,0,9,0,0,0,0,1]
               
               #websudoku evil: 6 vueltas
               #               [0,9,0,0,4,6,0,0,3],
               #               [0,8,0,0,7,0,0,0,0],
               #               [1,0,0,0,0,0,2,0,0],
               #               [0,0,1,0,0,7,0,0,5],
               #               [0,0,3,0,2,0,6,0,0],
               #               [7,0,0,9,0,0,1,0,0],
               #               [0,0,9,0,0,0,0,0,4],
               #               [0,0,0,0,3,0,0,2,0],
               #               [2,0,0,5,8,0,0,7,0]
               
               #scargot: 42 vueltas, con recursividad
               #               [1,0,0,0,0,7,0,9,0],
               #               [0,3,0,0,2,0,0,0,8],
               #               [0,0,9,6,0,0,5,0,0],
               #               [0,0,5,3,0,0,9,0,0],
               #               [0,1,0,0,8,0,0,0,2],
               #               [6,0,0,0,0,4,0,0,0],
               #               [3,0,0,0,0,0,0,1,0],
               #               [0,4,0,0,0,0,0,0,7],
               #               [0,0,7,0,0,0,3,0,0]

               #ejemplo web: 8 vueltas
               #               [0,0,0,0,0,0,2,0,0],
               #               [0,5,8,0,0,6,0,0,0],
               #               [0,0,0,3,0,0,0,8,5],
               #               [0,1,0,4,7,0,6,0,0],
               #               [9,0,6,0,0,0,5,0,7],
               #               [0,0,7,0,3,9,0,4,0],
               #               [7,6,0,0,0,8,0,0,0],
               #               [0,0,0,9,0,0,8,1,0],
               #               [0,0,9,0,0,0,0,0,0]                              

               #vacio: 124 vueltas, con recursividad
               #               [0,0,0,0,0,0,0,0,0],
               #               [0,0,0,0,0,0,0,0,0],
               #               [0,0,0,0,0,0,0,0,0],
               #               [0,0,0,0,0,0,0,0,0],
               #               [0,0,0,0,0,0,0,0,0],
               #               [0,0,0,0,0,0,0,0,0],
               #               [0,0,0,0,0,0,0,0,0],
               #               [0,0,0,0,0,0,0,0,0],
               #               [0,0,0,0,0,0,0,0,0]                              

               #Imposible: 
               #               [0,4,3,0,2,0,8,0,0], 
               #               [7,9,0,0,5,4,0,0,6],
               #               [0,0,0,0,0,0,0,0,9],
               #               [0,0,0,6,0,0,9,0,7],
               #               [0,0,0,5,0,8,0,0,0],
               #               [1,0,7,0,0,2,0,0,0],
               #               [3,0,0,0,0,0,0,0,0],
               #               [0,0,0,4,6,0,0,9,1],
               #               [0,0,5,0,8,0,7,2,0]
			   
								[0,5,0,0,7,0,0,4,0],
								[0,0,0,0,0,0,0,0,0],
								[0,0,1,0,0,0,5,0,0],
								[0,2,7,0,0,0,8,9,0],
								[6,0,8,0,0,0,4,0,5],
								[0,0,9,2,0,6,7,0,0],
								[8,0,0,5,0,7,0,0,1],
								[0,0,0,0,3,0,0,0,0],
								[0,0,5,9,1,8,2,0,0]



               ])

puts br

imprimir br
imprimir verde(" Tablero original:") + br
imprimir tablero.to_s + br
vueltas = tablero.resolver

if tablero.esta_resuelto
   imprimir verde(" Tablero Resuelto!") + amarillo(" :) ") + celeste("llevo #{vueltas} vueltas") + br
else
   imprimir rojo(" No fue posible resolver este tablero") + amarillo(" :( ") + celeste("llevo #{vueltas} vueltas") + br
end

imprimir br
puts rojo(tablero.stream)

