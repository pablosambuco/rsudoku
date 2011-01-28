class Celda
  
  def initialize
    @valor = 0
    @posible = [1,2,3,4,5,6,7,8,9]
  end
  
  def posible
    @posible
  end
  public :posible
  
  def posible= posible
    @posible = posible
  end
  public :posible=
  
  def valor
    @valor
  end
  public :valor
  
  def valor=valor
    @valor = valor
    @posible = [valor]    
  end
  public :valor=
  
  def quitar(valor)
    @posible = @posible - [valor]
  end
  public :quitar
  
  def to_s
    @valor.to_s
  end
  public :to_s
  
end

class Grupo
  
  def initialize
    @celdas = nil
  end
  
  def celdas
    @celdas
  end
  public :celdas
  
  def celdas=(celdas)
    @celdas=celdas
  end
  public :celdas=
  
  def to_s
    celdas[0].to_s + ' ' + 
    celdas[1].to_s + ' ' +
    celdas[2].to_s + ' ' +
    celdas[3].to_s + ' ' +
    celdas[4].to_s + ' ' +
    celdas[5].to_s + ' ' +
    celdas[6].to_s + ' ' +
    celdas[7].to_s + ' ' +
    celdas[8].to_s + ' ' +
    celdas[9].to_s + ' ' 
  end
  public :to_s
  
  def quitar(valor)
    celdas[0].quitar(valor);
    celdas[1].quitar(valor);
    celdas[2].quitar(valor);
    celdas[3].quitar(valor);
    celdas[4].quitar(valor);
    celdas[5].quitar(valor);
    celdas[6].quitar(valor);
    celdas[7].quitar(valor);
    celdas[8].quitar(valor);
  end
  public :quitar
  
  def revisar
    cambios = 0
    for i in celdas
      for j in i.posible
        contador = 0
        for k in celdas
          for l in k.posible
            if (i != k and j == l)
              contador = contador + 1
            end
          end
        end
        if (contador == 0 and i.valor != j)  
          i.posible = [j]
          cambios = cambios + 1
        end
      end
    end
    cambios
  end
  public :revisar
end 

class Tablero
  
  def initialize
    
    @cel11 = Celda.new
    @cel12 = Celda.new
    @cel13 = Celda.new
    @cel14 = Celda.new
    @cel15 = Celda.new
    @cel16 = Celda.new
    @cel17 = Celda.new
    @cel18 = Celda.new
    @cel19 = Celda.new
    @cel21 = Celda.new
    @cel22 = Celda.new
    @cel23 = Celda.new
    @cel24 = Celda.new
    @cel25 = Celda.new
    @cel26 = Celda.new
    @cel27 = Celda.new
    @cel28 = Celda.new
    @cel29 = Celda.new
    @cel31 = Celda.new
    @cel32 = Celda.new
    @cel33 = Celda.new
    @cel34 = Celda.new
    @cel35 = Celda.new
    @cel36 = Celda.new
    @cel37 = Celda.new
    @cel38 = Celda.new
    @cel39 = Celda.new
    @cel41 = Celda.new
    @cel42 = Celda.new
    @cel43 = Celda.new
    @cel44 = Celda.new
    @cel45 = Celda.new
    @cel46 = Celda.new
    @cel47 = Celda.new
    @cel48 = Celda.new
    @cel49 = Celda.new
    @cel40 = Celda.new
    @cel51 = Celda.new
    @cel52 = Celda.new
    @cel53 = Celda.new
    @cel54 = Celda.new
    @cel55 = Celda.new
    @cel56 = Celda.new
    @cel57 = Celda.new
    @cel58 = Celda.new
    @cel59 = Celda.new
    @cel61 = Celda.new
    @cel62 = Celda.new
    @cel63 = Celda.new
    @cel64 = Celda.new
    @cel65 = Celda.new
    @cel66 = Celda.new
    @cel67 = Celda.new
    @cel68 = Celda.new
    @cel69 = Celda.new
    @cel71 = Celda.new
    @cel72 = Celda.new
    @cel73 = Celda.new
    @cel74 = Celda.new
    @cel75 = Celda.new
    @cel76 = Celda.new
    @cel77 = Celda.new
    @cel78 = Celda.new
    @cel79 = Celda.new
    @cel81 = Celda.new
    @cel82 = Celda.new
    @cel83 = Celda.new
    @cel84 = Celda.new
    @cel85 = Celda.new
    @cel86 = Celda.new
    @cel87 = Celda.new
    @cel88 = Celda.new
    @cel89 = Celda.new
    @cel91 = Celda.new
    @cel92 = Celda.new
    @cel93 = Celda.new
    @cel94 = Celda.new
    @cel95 = Celda.new
    @cel96 = Celda.new
    @cel97 = Celda.new
    @cel98 = Celda.new
    @cel99 = Celda.new
    
    @col1 = Grupo.new
    @col2 = Grupo.new
    @col3 = Grupo.new
    @col4 = Grupo.new
    @col5 = Grupo.new
    @col6 = Grupo.new
    @col7 = Grupo.new
    @col8 = Grupo.new
    @col9 = Grupo.new
    
    @fil1 = Grupo.new
    @fil2 = Grupo.new
    @fil3 = Grupo.new
    @fil4 = Grupo.new
    @fil5 = Grupo.new
    @fil6 = Grupo.new
    @fil7 = Grupo.new
    @fil8 = Grupo.new
    @fil9 = Grupo.new    
    
    @cua1 = Grupo.new
    @cua2 = Grupo.new
    @cua3 = Grupo.new
    @cua4 = Grupo.new
    @cua5 = Grupo.new
    @cua6 = Grupo.new
    @cua7 = Grupo.new
    @cua8 = Grupo.new
    @cua9 = Grupo.new
    
    @columnas = [@col1, @col2, @col3, @col4, @col5, @col6, @col7, @col8, @col9]
    @filas =    [@fil1, @fil2, @fil3, @fil4, @fil5, @fil6, @fil7, @fil8, @fil9]
    @cuadros =  [@cua1, @cua2, @cua3, @cua4, @cua5, @cua6, @cua7, @cua8, @cua9]
    
    filas[0].celdas=[@cel11,@cel12,@cel13,@cel14,@cel15,@cel16,@cel17,@cel18,@cel19]
    filas[1].celdas=[@cel21,@cel22,@cel23,@cel24,@cel25,@cel26,@cel27,@cel28,@cel29]
    filas[2].celdas=[@cel31,@cel32,@cel33,@cel34,@cel35,@cel36,@cel37,@cel38,@cel39]
    filas[3].celdas=[@cel41,@cel42,@cel43,@cel44,@cel45,@cel46,@cel47,@cel48,@cel49]
    filas[4].celdas=[@cel51,@cel52,@cel53,@cel54,@cel55,@cel56,@cel57,@cel58,@cel59]
    filas[5].celdas=[@cel61,@cel62,@cel63,@cel64,@cel65,@cel66,@cel67,@cel68,@cel69]
    filas[6].celdas=[@cel71,@cel72,@cel73,@cel74,@cel75,@cel76,@cel77,@cel78,@cel79]
    filas[7].celdas=[@cel81,@cel82,@cel83,@cel84,@cel85,@cel86,@cel87,@cel88,@cel89]
    filas[8].celdas=[@cel91,@cel92,@cel93,@cel94,@cel95,@cel96,@cel97,@cel98,@cel99]
    columnas[0].celdas=[@cel11,@cel21,@cel31,@cel41,@cel51,@cel61,@cel71,@cel81,@cel91]
    columnas[1].celdas=[@cel12,@cel22,@cel32,@cel42,@cel52,@cel62,@cel72,@cel82,@cel92]
    columnas[2].celdas=[@cel13,@cel23,@cel33,@cel43,@cel53,@cel63,@cel73,@cel83,@cel93]
    columnas[3].celdas=[@cel14,@cel24,@cel34,@cel44,@cel54,@cel64,@cel74,@cel84,@cel94]
    columnas[4].celdas=[@cel15,@cel25,@cel35,@cel45,@cel55,@cel65,@cel75,@cel85,@cel95]
    columnas[5].celdas=[@cel16,@cel26,@cel36,@cel46,@cel56,@cel66,@cel76,@cel86,@cel96]
    columnas[6].celdas=[@cel17,@cel27,@cel37,@cel47,@cel57,@cel67,@cel77,@cel87,@cel97]
    columnas[7].celdas=[@cel18,@cel28,@cel38,@cel48,@cel58,@cel68,@cel78,@cel88,@cel98]
    columnas[8].celdas=[@cel19,@cel29,@cel39,@cel49,@cel59,@cel69,@cel79,@cel89,@cel99]
    cuadros[0].celdas=[@cel11,@cel12,@cel13,@cel21,@cel22,@cel23,@cel31,@cel32,@cel33]
    cuadros[0].celdas=[@cel11,@cel12,@cel13,@cel21,@cel22,@cel23,@cel31,@cel32,@cel33]
    cuadros[1].celdas=[@cel14,@cel15,@cel16,@cel24,@cel25,@cel26,@cel34,@cel35,@cel36]
    cuadros[2].celdas=[@cel17,@cel18,@cel19,@cel27,@cel28,@cel29,@cel37,@cel38,@cel39]
    cuadros[3].celdas=[@cel41,@cel42,@cel43,@cel51,@cel52,@cel53,@cel61,@cel62,@cel63]
    cuadros[4].celdas=[@cel44,@cel45,@cel46,@cel54,@cel55,@cel56,@cel64,@cel65,@cel66]
    cuadros[5].celdas=[@cel47,@cel48,@cel49,@cel57,@cel58,@cel59,@cel67,@cel68,@cel69]
    cuadros[6].celdas=[@cel71,@cel72,@cel73,@cel81,@cel82,@cel83,@cel91,@cel92,@cel93]
    cuadros[7].celdas=[@cel74,@cel75,@cel76,@cel84,@cel85,@cel86,@cel94,@cel95,@cel96]
    cuadros[8].celdas=[@cel77,@cel78,@cel79,@cel87,@cel88,@cel89,@cel97,@cel98,@cel99]
  end
  
  def filas
    @filas
  end
  public :filas
  
  def columnas
    @columnas
  end
  public :columnas
  
  def cuadros
    @cuadros
  end
  public :cuadros
  
  def to_s
    '    ' + @filas[0].to_s + '
    ' + @filas[1].to_s + '
    ' + @filas[2].to_s + '
    ' + @filas[3].to_s + '
    ' + @filas[4].to_s + '
    ' + @filas[5].to_s + '
    ' + @filas[6].to_s + '
    ' + @filas[7].to_s + '
    ' + @filas[8].to_s     
  end 
  public :to_s
  
  def fccuadro(fila,columna)
    cuadro = 0
    case fila
      when 1,2,3
      case columna
        when 1,2,3
        cuadro = 1
        when 4,5,6
        cuadro = 2
        when 7,8,9
        cuadro = 3
      end
      when 4,5,6
      case columna
        when 1,2,3
        cuadro = 4 
        when 4,5,6
        cuadro = 5
        when 7,8,9
        cuadro = 6
      end
      when 7,8,9
      case columna
        when 1,2,3
        cuadro = 7
        when 4,5,6
        cuadro = 8
        when 7,8,9
        cuadro = 9
      end
    end
    cuadro
  end
  
  public :fccuadro
  
  def cargar(tablero)
    for i in 1..9
      for j in 1..9
        v=tablero[i-1][j-1]
        if (v != 0)

          k = fccuadro(i,j)    
          filas[i-1].quitar(v)
          columnas[j-1].quitar(v)
          cuadros[k-1].quitar(v)  
      
          filas[i-1].celdas[j-1].valor=v
          
        end
      end
    end
  end
  public :cargar
  
  def resolver
    begin
      cambios = 0
      for i in 1..9
        for j in 1..9
          celda = filas[i-1].celdas[j-1]
          v=celda.posible[0]
          if(celda.posible.length == 1 and celda.valor != v)
            cambios = cambios + 1
            
            k = fccuadro(i,j)    
            
            filas[i-1].quitar(v)
            columnas[j-1].quitar(v)
            cuadros[k-1].quitar(v)  
      
            filas[i-1].celdas[j-1].valor=v           
          end
        end
      end
      for i in 1..9
        cambios = cambios + filas[i-1].revisar
      end
      for i in 1..9
        cambios = cambios + columnas[i-1].revisar
      end
      for i in 1..9
        cambios = cambios + cuadros[i-1].revisar
      end
    end while(cambios!=0)
    
  end
  public :resolver
  
end

tablero = Tablero.new


#Sudoku N 1897



#Basico
#tablero.cargar([
#               [0,0,0,0,5,0,0,0,9], 
#               [0,0,0,3,0,0,8,4,0],
#               [4,3,0,1,8,7,0,6,0],
#               [3,0,8,0,0,0,0,7,0],
#               [0,0,0,4,3,2,0,0,0],
#               [0,5,0,0,0,0,9,0,2],
#               [0,4,0,2,1,0,0,9,8],
#               [0,9,3,0,0,8,0,0,0],
#               [7,0,0,0,9,0,0,0,0]
#               ])

#Intermedio
#tablero.cargar([
#               [0,4,3,0,2,0,8,0,0], 
#               [7,9,0,0,5,4,0,0,0],
#               [0,0,0,0,0,0,0,0,9],
#               [0,0,0,6,0,0,9,0,7],
#               [0,0,0,5,0,8,0,0,0],
#               [1,0,7,0,0,2,0,0,0],
#               [3,0,0,0,0,0,0,0,0],
#               [0,0,0,4,6,0,0,9,1],
#               [0,0,5,0,8,0,7,2,0]
#               ])

#Avanzado
#tablero.cargar([
#               [1,0,0,9,4,0,3,0,0], 
#               [0,0,0,0,0,8,1,0,6],
#               [9,0,0,0,0,0,0,2,0],
#               [0,7,0,1,0,4,0,0,9],
#               [6,0,4,0,9,0,7,0,1],
#               [3,0,0,6,0,7,0,4,0],
#               [0,9,0,0,0,0,0,0,4],
#               [2,0,1,4,0,0,0,0,0],
#               [0,0,3,0,7,6,0,0,8]
#               ])

tablero.cargar([
               [8,0,0,0,0,4,0,0,6],
               [2,0,0,0,5,0,1,0,0],
               [9,0,0,7,0,0,0,3,0],
               [5,0,0,0,0,0,0,0,9],
               [0,0,0,4,0,2,0,0,0],
               [1,0,0,0,0,0,0,0,8],
               [0,8,0,0,0,6,0,0,2],
               [0,0,7,0,3,0,0,0,5],
               [4,0,0,9,0,0,0,0,1]
               ])



tablero.resolver
puts tablero.to_s 

