#Funciones generales

def color(texto,codigo)
  "\033[#{codigo}#{texto}\033[0m"
end

def celeste(texto); color(texto,"1;34;40m"); end
def rojo(texto);    color(texto,"1;31;40m"); end
def verde(texto);   color(texto,"1;32;40m"); end

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
    if @posible.delete(valor){false}
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
      retorno += celdas[i].quitar(valor)
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
    
    #busco si los N valores posibles de una celda se repiten exactamente en N-1 otras
    #si es asi, los elimino como posibles del resto de las celdas
    for i in 0..8
      todas = Array.new
      if celdas[i].posible.length > 1
        for j in 0..8
          if celdas[i].posible == celdas[j].posible
            todas << j
          end
        end
        if celdas[i].posible.length == todas.length
          for j in 0..8
            todas.delete(j) {celdas[j].posible = celdas[j].posible - celdas[i].posible;}
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
    retorno += celeste(fin) + "\n"   
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
        for k in filas[i].celdas[j].posible
          if minimo == actual
            retorno += verde(k.to_s)
          else
            retorno += rojo(k.to_s)
          end
        end
        retorno += verde(" ")
      end
      retorno += celeste("║")
      retorno += "\n"
    end   
    #Ultima Linea
    retorno += lineas("╚","═","╩","╝",maximo)
    
    retorno
  end 
  public :to_s
  
  #Metodo fccuadro. Dadas fila y columnna, indica el cuadro al que pertenece la posicion
  def fccuadro(fila,columna)
    i = (fila) / 3
    j = (columna) / 3
    cuadro = i * 3 + j 
    cuadro
  end
  public :fccuadro
  
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
  
  #Metodo resolver. Resuelve el tablero de ser posible
  def resolver
    begin
      cambios = 0
      for i in 0..8
        for j in 0..8
          celda = filas[i].celdas[j]
          v=celda.posible[0]
          if(celda.posible.length == 1 and celda.valor != v)
            cambios += 1
            
            k = fccuadro(i,j)    
            
            filas[i].quitar(v)
            columnas[j].quitar(v)
            cuadros[k].quitar(v)  
            
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
    end while(cambios!=0)
  end
  public :resolver
  
end

#Aqui comienza la ejecución

tablero = Tablero.new

tablero.cargar([
               
               #Basico
               #                              [0,0,0,0,5,0,0,0,9], 
               #                              [0,0,0,3,0,0,8,4,0],
               #                              [4,3,0,1,8,7,0,6,0],
               #                              [3,0,8,0,0,0,0,7,0],
               #                              [0,0,0,4,3,2,0,0,0],
               #                              [0,5,0,0,0,0,9,0,2],
               #                              [0,4,0,2,1,0,0,9,8],
               #                              [0,9,3,0,0,8,0,0,0],
               #                              [7,0,0,0,9,0,0,0,0]
               
               #Intermedio
               [0,4,3,0,2,0,8,0,0], 
               [7,9,0,0,5,4,0,0,0],
               [0,0,0,0,0,0,0,0,9],
               [0,0,0,6,0,0,9,0,7],
               [0,0,0,5,0,8,0,0,0],
               [1,0,7,0,0,2,0,0,0],
               [3,0,0,0,0,0,0,0,0],
               [0,0,0,4,6,0,0,9,1],
               [0,0,5,0,8,0,7,2,0]
               
               #Avanzado
               #               [1,0,0,9,4,0,3,0,0], 
               #               [0,0,0,0,0,8,1,0,6],
               #               [9,0,0,0,0,0,0,2,0],
               #               [0,7,0,1,0,4,0,0,9],
               #               [6,0,4,0,9,0,7,0,1],
               #               [3,0,0,6,0,7,0,4,0],
               #               [0,9,0,0,0,0,0,0,4],
               #               [2,0,1,4,0,0,0,0,0],
               #               [0,0,3,0,7,6,0,0,8]
               
               #Otros
               #               [8,0,0,0,0,4,0,0,6],
               #               [2,0,0,0,5,0,1,0,0],
               #               [9,0,0,7,0,0,0,3,0],
               #               [5,0,0,0,0,0,0,0,9],
               #               [0,0,0,4,0,2,0,0,0],
               #               [1,0,0,0,0,0,0,0,8],
               #               [0,8,0,0,0,6,0,0,2],
               #               [0,0,7,0,3,0,0,0,5],
               #               [4,0,0,9,0,0,0,0,1]
               
               #websudoku evil
               #               [0,9,0,0,4,6,0,0,3],
               #               [0,8,0,0,7,0,0,0,0],
               #               [1,0,0,0,0,0,2,0,0],
               #               [0,0,1,0,0,7,0,0,5],
               #               [0,0,3,0,2,0,6,0,0],
               #               [7,0,0,9,0,0,1,0,0],
               #               [0,0,9,0,0,0,0,0,4],
               #               [0,0,0,0,3,0,0,2,0],
               #               [2,0,0,5,8,0,0,7,0]
               
               #scargot
               #               [1,0,0,0,0,7,0,9,0],
               #               [0,3,0,0,2,0,0,0,8],
               #               [0,0,9,6,0,0,5,0,0],
               #               [0,0,5,3,0,0,9,0,0],
               #               [0,1,0,0,8,0,0,0,2],
               #               [6,0,0,0,0,4,0,0,0],
               #               [3,0,0,0,0,0,0,1,0],
               #               [0,4,0,0,0,0,0,0,7],
               #               [0,0,7,0,0,0,3,0,0]
               
               
               ])


tablero.resolver
puts tablero.to_s
