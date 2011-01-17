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
  
  def valor= valor
    @valor = valor
  end
  public :valor=
  
  def quitar(valor)
    @posible = @posible - [valor]
  end
  public :quitar
  
end

class Grupo
  
  def initialize
    @cel1 = nil
    @cel2 = nil
    @cel3 = nil
    @cel4 = nil
    @cel5 = nil
    @cel6 = nil
    @cel7 = nil
    @cel8 = nil
    @cel9 = nil
  end
  
  def cel1
    @cel1
  end
  public :cel1
  
  def cel2
    @cel2
  end
  public :cel2
  
  def cel3
    @cel3
  end
  public :cel3
  
  def cel4
    @cel4
  end
  public :cel4
  
  def cel5
    @cel5
  end
  public :cel5
  
  def cel6
    @cel6
  end
  public :cel6
  
  def cel7
    @cel7
  end
  public :cel7
  
  def cel8
    @cel8
  end
  public :cel8
  
  def cel9
    @cel9
  end
  public :cel9
  
  def pos(posicion)
     case posicion
        when 1
          self.cel1
        when 2
          self.cel2
        when 3
          self.cel3
        when 4
          self.cel4
        when 5
          self.cel5
        when 6
          self.cel6
        when 7
          self.cel7
        when 8
          self.cel8
        when 9
          self.cel9
      end
  end
  public :pos
  
  def to_s
    cel1.valor.to_s + ' ' +
    cel2.valor.to_s + ' ' +
    cel3.valor.to_s + ' ' +
    cel4.valor.to_s + ' ' +
    cel5.valor.to_s + ' ' +
    cel6.valor.to_s + ' ' +
    cel7.valor.to_s + ' ' +
    cel8.valor.to_s + ' ' +
    cel9.valor.to_s    
  end
  public :to_s
  
  def quitar(valor)
    cel1.quitar(valor);
    cel2.quitar(valor);
    cel3.quitar(valor);
    cel4.quitar(valor);
    cel5.quitar(valor);
    cel6.quitar(valor);
    cel7.quitar(valor);
    cel8.quitar(valor);
    cel9.quitar(valor);
  end
  public :quitar
  
  def cel1= cel1
    @cel1 = cel1
  end
  public :cel1=
  
  def cel2= cel2
    @cel2 = cel2
  end
  public :cel2=
  
  def cel3= cel3
    @cel3 = cel3
  end
  public :cel3=
  
  def cel4= cel4
    @cel4 = cel4
  end
  public :cel4=
  
  def cel5= cel5
    @cel5 = cel5
  end
  public :cel5=
  
  def cel6= cel6
    @cel6 = cel6
  end
  public :cel6=
  
  def cel7= cel7
    @cel7 = cel7
  end
  public :cel7=
  
  def cel8= cel8
    @cel8 = cel8
  end
  public :cel8=
  
  def cel9= cel9
    @cel9 = cel9
  end
  public :cel9=
  
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
    
    @fil1.cel1=cel11
    @fil1.cel2=cel12
    @fil1.cel3=cel13
    @fil1.cel4=cel14
    @fil1.cel5=cel15
    @fil1.cel6=cel16
    @fil1.cel7=cel17 
    @fil1.cel8=cel18
    @fil1.cel9=cel19

    @fil2.cel1=cel21
    @fil2.cel2=cel22
    @fil2.cel3=cel23
    @fil2.cel4=cel24
    @fil2.cel5=cel25
    @fil2.cel6=cel26
    @fil2.cel7=cel27 
    @fil2.cel8=cel28
    @fil2.cel9=cel29

    @fil3.cel1=cel31
    @fil3.cel2=cel32
    @fil3.cel3=cel33
    @fil3.cel4=cel34
    @fil3.cel5=cel35
    @fil3.cel6=cel36
    @fil3.cel7=cel37 
    @fil3.cel8=cel38
    @fil3.cel9=cel39

    @fil4.cel1=cel41
    @fil4.cel2=cel42
    @fil4.cel3=cel43
    @fil4.cel4=cel44
    @fil4.cel5=cel45
    @fil4.cel6=cel46
    @fil4.cel7=cel47 
    @fil4.cel8=cel48
    @fil4.cel9=cel49

    @fil5.cel1=cel51
    @fil5.cel2=cel52
    @fil5.cel3=cel53
    @fil5.cel4=cel54
    @fil5.cel5=cel55
    @fil5.cel6=cel56
    @fil5.cel7=cel57 
    @fil5.cel8=cel58
    @fil5.cel9=cel59

    @fil6.cel1=cel61
    @fil6.cel2=cel62
    @fil6.cel3=cel63
    @fil6.cel4=cel64
    @fil6.cel5=cel65
    @fil6.cel6=cel66
    @fil6.cel7=cel67 
    @fil6.cel8=cel68
    @fil6.cel9=cel69
    
    @fil7.cel1=cel71
    @fil7.cel2=cel72
    @fil7.cel3=cel73
    @fil7.cel4=cel74
    @fil7.cel5=cel75
    @fil7.cel6=cel76
    @fil7.cel7=cel77 
    @fil7.cel8=cel78
    @fil7.cel9=cel79
    
    @fil8.cel1=cel81
    @fil8.cel2=cel82
    @fil8.cel3=cel83
    @fil8.cel4=cel84
    @fil8.cel5=cel85
    @fil8.cel6=cel86
    @fil8.cel7=cel87 
    @fil8.cel8=cel88
    @fil8.cel9=cel89
    
    @fil9.cel1=cel91
    @fil9.cel2=cel92
    @fil9.cel3=cel93
    @fil9.cel4=cel94
    @fil9.cel5=cel95
    @fil9.cel6=cel96
    @fil9.cel7=cel97 
    @fil9.cel8=cel98
    @fil9.cel9=cel99

    @col1.cel1=cel11
    @col1.cel2=cel21
    @col1.cel3=cel31
    @col1.cel4=cel41
    @col1.cel5=cel51
    @col1.cel6=cel61
    @col1.cel7=cel71
    @col1.cel8=cel81
    @col1.cel9=cel91

    @col2.cel1=cel12
    @col2.cel2=cel22
    @col2.cel3=cel32
    @col2.cel4=cel42
    @col2.cel5=cel52
    @col2.cel6=cel62
    @col2.cel7=cel72
    @col2.cel8=cel82
    @col2.cel9=cel92

    @col3.cel1=cel13
    @col3.cel2=cel23
    @col3.cel3=cel33
    @col3.cel4=cel43
    @col3.cel5=cel53
    @col3.cel6=cel63
    @col3.cel7=cel73
    @col3.cel8=cel83
    @col3.cel9=cel93

    @col4.cel1=cel14
    @col4.cel2=cel24
    @col4.cel3=cel34
    @col4.cel4=cel44
    @col4.cel5=cel54
    @col4.cel6=cel64
    @col4.cel7=cel74
    @col4.cel8=cel84
    @col4.cel9=cel94

    @col5.cel1=cel15
    @col5.cel2=cel25
    @col5.cel3=cel35
    @col5.cel4=cel45
    @col5.cel5=cel55
    @col5.cel6=cel65
    @col5.cel7=cel75
    @col5.cel8=cel85
    @col5.cel9=cel95

    @col6.cel1=cel16
    @col6.cel2=cel26
    @col6.cel3=cel36
    @col6.cel4=cel46
    @col6.cel5=cel56
    @col6.cel6=cel66
    @col6.cel7=cel76
    @col6.cel8=cel86
    @col6.cel9=cel96

    @col7.cel1=cel17
    @col7.cel2=cel27
    @col7.cel3=cel37
    @col7.cel4=cel47
    @col7.cel5=cel57
    @col7.cel6=cel67
    @col7.cel7=cel77
    @col7.cel8=cel87
    @col7.cel9=cel97

    @col8.cel1=cel18
    @col8.cel2=cel28
    @col8.cel3=cel38
    @col8.cel4=cel48
    @col8.cel5=cel58
    @col8.cel6=cel68
    @col8.cel7=cel78
    @col8.cel8=cel88
    @col8.cel9=cel98

    @col9.cel1=cel19
    @col9.cel2=cel29
    @col9.cel3=cel39
    @col9.cel4=cel49
    @col9.cel5=cel59
    @col9.cel6=cel69
    @col9.cel7=cel79
    @col9.cel8=cel89
    @col9.cel9=cel99

    @cua1.cel1=cel11
    @cua1.cel2=cel12
    @cua1.cel3=cel13
    @cua1.cel4=cel21
    @cua1.cel5=cel22
    @cua1.cel6=cel23
    @cua1.cel7=cel31
    @cua1.cel8=cel32
    @cua1.cel9=cel33

    @cua1.cel1=cel11
    @cua1.cel2=cel12
    @cua1.cel3=cel13
    @cua1.cel4=cel21
    @cua1.cel5=cel22
    @cua1.cel6=cel23
    @cua1.cel7=cel31
    @cua1.cel8=cel32
    @cua1.cel9=cel33

    @cua2.cel1=cel14
    @cua2.cel2=cel15
    @cua2.cel3=cel16
    @cua2.cel4=cel24
    @cua2.cel5=cel25
    @cua2.cel6=cel26
    @cua2.cel7=cel34
    @cua2.cel8=cel35
    @cua2.cel9=cel36

    @cua3.cel1=cel17
    @cua3.cel2=cel18
    @cua3.cel3=cel19
    @cua3.cel4=cel27
    @cua3.cel5=cel28
    @cua3.cel6=cel29
    @cua3.cel7=cel37
    @cua3.cel8=cel38
    @cua3.cel9=cel39

    @cua4.cel1=cel41
    @cua4.cel2=cel42
    @cua4.cel3=cel43
    @cua4.cel4=cel51
    @cua4.cel5=cel52
    @cua4.cel6=cel53
    @cua4.cel7=cel61
    @cua4.cel8=cel62
    @cua4.cel9=cel63

    @cua5.cel1=cel44
    @cua5.cel2=cel45
    @cua5.cel3=cel46
    @cua5.cel4=cel54
    @cua5.cel5=cel55
    @cua5.cel6=cel56
    @cua5.cel7=cel64
    @cua5.cel8=cel65
    @cua5.cel9=cel66

    @cua6.cel1=cel47
    @cua6.cel2=cel48
    @cua6.cel3=cel49
    @cua6.cel4=cel57
    @cua6.cel5=cel58
    @cua6.cel6=cel59
    @cua6.cel7=cel67
    @cua6.cel8=cel68
    @cua6.cel9=cel69

    @cua7.cel1=cel71
    @cua7.cel2=cel72
    @cua7.cel3=cel73
    @cua7.cel4=cel81
    @cua7.cel5=cel82
    @cua7.cel6=cel83
    @cua7.cel7=cel91
    @cua7.cel8=cel92
    @cua7.cel9=cel93

    @cua8.cel1=cel74
    @cua8.cel2=cel75
    @cua8.cel3=cel76
    @cua8.cel4=cel84
    @cua8.cel5=cel85
    @cua8.cel6=cel86
    @cua8.cel7=cel94
    @cua8.cel8=cel95
    @cua8.cel9=cel96

    @cua9.cel1=cel77
    @cua9.cel2=cel78
    @cua9.cel3=cel79
    @cua9.cel4=cel87
    @cua9.cel5=cel88
    @cua9.cel6=cel89
    @cua9.cel7=cel97
    @cua9.cel8=cel98
    @cua9.cel9=cel99

  end
  
  def col1
    @col1
  end
  public :col1
  
  def col2
    @col2
  end
  public :col2
  
  def col3
    @col3
  end
  public :col3
  
  def col4
    @col4
  end
  public :col4
  
  def col5
    @col5
  end
  public :col5
  
  def col6
    @col6
  end
  public :col6
  
  def col7
    @col7
  end
  public :col7
  
  def col8
    @col8
  end
  public :col8
  
  def col9
    @col9
  end
  public :col9
  
  def columnas
    @columnas
  end
  public :columnas
  
  def cua1
    @cua1
  end
  public :cua1
  
  def cua2
    @cua2
  end
  public :cua2
  
  def cua3
    @cua3
  end
  public :cua3
  
  def cua4
    @cua4
  end
  public :cua4
  
  def cua5
    @cua5
  end
  public :cua5
  
  def cua6
    @cua6
  end
  public :cua6
  
  def cua7
    @cua7
  end
  public :cua7
  
  def cua8
    @cua8
  end
  public :cua8
  
  def cua9
    @cua9
  end
  public :cua9
  
  def cuadros
    @cuadros
  end
  public :cuadros
  
  def fil1
    @fil1
  end
  public :fil1
  
  def fil2
    @fil2
  end
  public :fil2
  
  def fil3
    @fil3
  end
  public :fil3
  
  def fil4
    @fil4
  end
  public :fil4
  
  def fil5
    @fil5
  end
  public :fil5
  
  def fil6
    @fil6
  end
  public :fil6
  
  def fil7
    @fil7
  end
  public :fil7
  
  def fil8
    @fil8
  end
  public :fil8
  
  def fil9
    @fil9
  end
  public :fil9
  
  def filas
    @filas
  end
  public :filas
  
  def pos(fila,columna)
    if (fila < 1 or fila > 9 or columna < 1 or columna > 9)
      nil
    else
      case fila
        when 1
          self.fil1.pos(columna)
        when 2
          self.fil2.pos(columna)
        when 3
          self.fil3.pos(columna)
        when 4
          self.fil4.pos(columna)
        when 5
          self.fil5.pos(columna)
        when 6
          self.fil6.pos(columna)
        when 7
          self.fil7.pos(columna)
        when 8
          self.fil8.pos(columna)
        when 9
          self.fil9.pos(columna)
      end
    end
  end
  public :pos
  
  def to_s
    '    ' + self.fil1.to_s + '
    ' + self.fil2.to_s + '
    ' + self.fil3.to_s + '
    ' + self.fil4.to_s + '
    ' + self.fil5.to_s + '
    ' + self.fil6.to_s + '
    ' + self.fil7.to_s + '
    ' + self.fil8.to_s + '
    ' + self.fil9.to_s     
  end  
  
  def cel11
    @cel11
  end
  public :cel11
  
  def cel11= cel11
    @cel11 = cel11
  end
  public :cel11=
  
  def cel12
    @cel12
  end
  public :cel12
  
  def cel12= cel12
    @cel12 = cel12
  end
  public :cel12=
  
  def cel13
    @cel13
  end
  public :cel13
  
  def cel13= cel13
    @cel13 = cel13
  end
  public :cel13=
  
  def cel14
    @cel14
  end
  public :cel14
  
  def cel14= cel14
    @cel14 = cel14
  end
  public :cel14=
  
  def cel15
    @cel15
  end
  public :cel15
  
  def cel15= cel15
    @cel15 = cel15
  end
  public :cel15=
  
  def cel16
    @cel16
  end
  public :cel16
  
  def cel16= cel16
    @cel16 = cel16
  end
  public :cel16=
  
  def cel17
    @cel17
  end
  public :cel17
  
  def cel17= cel17
    @cel17 = cel17
  end
  public :cel17=
  
  def cel18
    @cel18
  end
  public :cel18
  
  def cel18= cel18
    @cel18 = cel18
  end
  public :cel18=
  
  def cel19
    @cel19
  end
  public :cel19
  
  def cel19= cel19
    @cel19 = cel19
  end
  public :cel19=
  
  def cel21
    @cel21
  end
  public :cel21
  
  def cel21= cel21
    @cel21 = cel21
  end
  public :cel21=
  
  def cel22
    @cel22
  end
  public :cel22
  
  def cel22= cel22
    @cel22 = cel22
  end
  public :cel22=
  
  def cel23
    @cel23
  end
  public :cel23
  
  def cel23= cel23
    @cel23 = cel23
  end
  public :cel23=
  
  def cel24
    @cel24
  end
  public :cel24
  
  def cel24= cel24
    @cel24 = cel24
  end
  public :cel24=
  
  def cel25
    @cel25
  end
  public :cel25
  
  def cel25= cel25
    @cel25 = cel25
  end
  public :cel25=
  
  def cel26
    @cel26
  end
  public :cel26
  
  def cel26= cel26
    @cel26 = cel26
  end
  public :cel26=
  
  def cel27
    @cel27
  end
  public :cel27
  
  def cel27= cel27
    @cel27 = cel27
  end
  public :cel27=
  
  def cel28
    @cel28
  end
  public :cel28
  
  def cel28= cel28
    @cel28 = cel28
  end
  public :cel28=
  
  def cel29
    @cel29
  end
  public :cel29
  
  def cel29= cel29
    @cel29 = cel29
  end
  public :cel29=
  
  def cel31
    @cel31
  end
  public :cel31
  
  def cel31= cel31
    @cel31 = cel31
  end
  public :cel31=
  
  def cel32
    @cel32
  end
  public :cel32
  
  def cel32= cel32
    @cel32 = cel32
  end
  public :cel32=
  
  def cel33
    @cel33
  end
  public :cel33
  
  def cel33= cel33
    @cel33 = cel33
  end
  public :cel33=
  
  def cel34
    @cel34
  end
  public :cel34
  
  def cel34= cel34
    @cel34 = cel34
  end
  public :cel34=
  
  def cel35
    @cel35
  end
  public :cel35
  
  def cel35= cel35
    @cel35 = cel35
  end
  public :cel35=
  
  def cel36
    @cel36
  end
  public :cel36
  
  def cel36= cel36
    @cel36 = cel36
  end
  public :cel36=
  
  def cel37
    @cel37
  end
  public :cel37
  
  def cel37= cel37
    @cel37 = cel37
  end
  public :cel37=
  
  def cel38
    @cel38
  end
  public :cel38
  
  def cel38= cel38
    @cel38 = cel38
  end
  public :cel38=
  
  def cel39
    @cel39
  end
  public :cel39
  
  def cel39= cel39
    @cel39 = cel39
  end
  public :cel39=
  
  def cel40
    @cel40
  end
  public :cel40
  
  def cel40= cel40
    @cel40 = cel40
  end
  public :cel40=
  
  def cel41
    @cel41
  end
  public :cel41
  
  def cel41= cel41
    @cel41 = cel41
  end
  public :cel41=
  
  def cel42
    @cel42
  end
  public :cel42
  
  def cel42= cel42
    @cel42 = cel42
  end
  public :cel42=
  
  def cel43
    @cel43
  end
  public :cel43
  
  def cel43= cel43
    @cel43 = cel43
  end
  public :cel43=
  
  def cel44
    @cel44
  end
  public :cel44
  
  def cel44= cel44
    @cel44 = cel44
  end
  public :cel44=
  
  def cel45
    @cel45
  end
  public :cel45
  
  def cel45= cel45
    @cel45 = cel45
  end
  public :cel45=
  
  def cel46
    @cel46
  end
  public :cel46
  
  def cel46= cel46
    @cel46 = cel46
  end
  public :cel46=
  
  def cel47
    @cel47
  end
  public :cel47
  
  def cel47= cel47
    @cel47 = cel47
  end
  public :cel47=
  
  def cel48
    @cel48
  end
  public :cel48
  
  def cel48= cel48
    @cel48 = cel48
  end
  public :cel48=
  
  def cel49
    @cel49
  end
  public :cel49
  
  def cel49= cel49
    @cel49 = cel49
  end
  public :cel49=
  
  def cel51
    @cel51
  end
  public :cel51
  
  def cel51= cel51
    @cel51 = cel51
  end
  public :cel51=
  
  def cel52
    @cel52
  end
  public :cel52
  
  def cel52= cel52
    @cel52 = cel52
  end
  public :cel52=
  
  def cel53
    @cel53
  end
  public :cel53
  
  def cel53= cel53
    @cel53 = cel53
  end
  public :cel53=
  
  def cel54
    @cel54
  end
  public :cel54
  
  def cel54= cel54
    @cel54 = cel54
  end
  public :cel54=
  
  def cel55
    @cel55
  end
  public :cel55
  
  def cel55= cel55
    @cel55 = cel55
  end
  public :cel55=
  
  def cel56
    @cel56
  end
  public :cel56
  
  def cel56= cel56
    @cel56 = cel56
  end
  public :cel56=
  
  def cel57
    @cel57
  end
  public :cel57
  
  def cel57= cel57
    @cel57 = cel57
  end
  public :cel57=
  
  def cel58
    @cel58
  end
  public :cel58
  
  def cel58= cel58
    @cel58 = cel58
  end
  public :cel58=
  
  def cel59
    @cel59
  end
  public :cel59
  
  def cel59= cel59
    @cel59 = cel59
  end
  public :cel59=
  
  def cel61
    @cel61
  end
  public :cel61
  
  def cel61= cel61
    @cel61 = cel61
  end
  public :cel61=
  
  def cel62
    @cel62
  end
  public :cel62
  
  def cel62= cel62
    @cel62 = cel62
  end
  public :cel62=
  
  def cel63
    @cel63
  end
  public :cel63
  
  def cel63= cel63
    @cel63 = cel63
  end
  public :cel63=
  
  def cel64
    @cel64
  end
  public :cel64
  
  def cel64= cel64
    @cel64 = cel64
  end
  public :cel64=
  
  def cel65
    @cel65
  end
  public :cel65
  
  def cel65= cel65
    @cel65 = cel65
  end
  public :cel65=
  
  def cel66
    @cel66
  end
  public :cel66
  
  def cel66= cel66
    @cel66 = cel66
  end
  public :cel66=
  
  def cel67
    @cel67
  end
  public :cel67
  
  def cel67= cel67
    @cel67 = cel67
  end
  public :cel67=
  
  def cel68
    @cel68
  end
  public :cel68
  
  def cel68= cel68
    @cel68 = cel68
  end
  public :cel68=
  
  def cel69
    @cel69
  end
  public :cel69
  
  def cel69= cel69
    @cel69 = cel69
  end
  public :cel69=
  
  def cel71
    @cel71
  end
  public :cel71
  
  def cel71= cel71
    @cel71 = cel71
  end
  public :cel71=
  
  def cel72
    @cel72
  end
  public :cel72
  
  def cel72= cel72
    @cel72 = cel72
  end
  public :cel72=
  
  def cel73
    @cel73
  end
  public :cel73
  
  def cel73= cel73
    @cel73 = cel73
  end
  public :cel73=
  
  def cel74
    @cel74
  end
  public :cel74
  
  def cel74= cel74
    @cel74 = cel74
  end
  public :cel74=
  
  def cel75
    @cel75
  end
  public :cel75
  
  def cel75= cel75
    @cel75 = cel75
  end
  public :cel75=
  
  def cel76
    @cel76
  end
  public :cel76
  
  def cel76= cel76
    @cel76 = cel76
  end
  public :cel76=
  
  def cel77
    @cel77
  end
  public :cel77
  
  def cel77= cel77
    @cel77 = cel77
  end
  public :cel77=
  
  def cel78
    @cel78
  end
  public :cel78
  
  def cel78= cel78
    @cel78 = cel78
  end
  public :cel78=
  
  def cel79
    @cel79
  end
  public :cel79
  
  def cel79= cel79
    @cel79 = cel79
  end
  public :cel79=
  
  def cel81
    @cel81
  end
  public :cel81
  
  def cel81= cel81
    @cel81 = cel81
  end
  public :cel81=
  
  def cel82
    @cel82
  end
  public :cel82
  
  def cel82= cel82
    @cel82 = cel82
  end
  public :cel82=
  
  def cel83
    @cel83
  end
  public :cel83
  
  def cel83= cel83
    @cel83 = cel83
  end
  public :cel83=
  
  def cel84
    @cel84
  end
  public :cel84
  
  def cel84= cel84
    @cel84 = cel84
  end
  public :cel84=
  
  def cel85
    @cel85
  end
  public :cel85
  
  def cel85= cel85
    @cel85 = cel85
  end
  public :cel85=
  
  def cel86
    @cel86
  end
  public :cel86
  
  def cel86= cel86
    @cel86 = cel86
  end
  public :cel86=
  
  def cel87
    @cel87
  end
  public :cel87
  
  def cel87= cel87
    @cel87 = cel87
  end
  public :cel87=
  
  def cel88
    @cel88
  end
  public :cel88
  
  def cel88= cel88
    @cel88 = cel88
  end
  public :cel88=
  
  def cel89
    @cel89
  end
  public :cel89
  
  def cel89= cel89
    @cel89 = cel89
  end
  public :cel89=
  
  def cel91
    @cel91
  end
  public :cel91
  
  def cel91= cel91
    @cel91 = cel91
  end
  public :cel91=
  
  def cel92
    @cel92
  end
  public :cel92
  
  def cel92= cel92
    @cel92 = cel92
  end
  public :cel92=
  
  def cel93
    @cel93
  end
  public :cel93
  
  def cel93= cel93
    @cel93 = cel93
  end
  public :cel93=
  
  def cel94
    @cel94
  end
  public :cel94
  
  def cel94= cel94
    @cel94 = cel94
  end
  public :cel94=
  
  def cel95
    @cel95
  end
  public :cel95
  
  def cel95= cel95
    @cel95 = cel95
  end
  public :cel95=
  
  def cel96
    @cel96
  end
  public :cel96
  
  def cel96= cel96
    @cel96 = cel96
  end
  public :cel96=
  
  def cel97
    @cel97
  end
  public :cel97
  
  def cel97= cel97
    @cel97 = cel97
  end
  public :cel97=
  
  def cel98
    @cel98
  end
  public :cel98
  
  def cel98= cel98
    @cel98 = cel98
  end
  public :cel98=
  
  def cel99
    @cel99
  end
  public :cel99
  
  def cel99= cel99
    @cel99 = cel99
  end
  public :cel99=
  
  def poner(fila,columna,valor)
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

    self.pos(fila,columna).valor=valor
    filas[fila-1].quitar(valor)
    columnas[columna-1].quitar(valor)
    cuadros[cuadro-1].quitar(valor)    
  end
  public :poner  

  def resolver
    
    begin
      cambios = 0
      for i in 1..9
        for j in 1..9
          celda = filas[i-1].pos(j-1)
          celda = Celda.new
          if(celda.posible.length == 1)
            cambios = cambios + 1
            poner(i,j,celda.posible[0])
          end
        end
      end
    end while(cambios!=0)

  end
  public :resolver
  
end

tablero = Tablero.new

#tablero.cargar(
#   0,4,3,0,2,0,8,0,0,
#   7,9,0,0,5,4,0,0,0,
#   0,0,0,0,0,0,0,0,9,
#   0,0,0,6,0,0,9,0,7,
#   0,0,0,5,0,8,0,0,0,
#   1,0,7,0,0,2,0,0,0,
#   3,0,0,0,0,0,0,0,0,
#   0,0,0,4,6,0,0,9,1,
#   0,0,5,0,8,0,7,2,0
#)

tablero.poner(1,2,4)
tablero.poner(1,3,3)
tablero.poner(1,5,2)
tablero.poner(1,2,4)
tablero.poner(1,7,8)
tablero.poner(2,1,7)
tablero.poner(2,2,9)
tablero.poner(2,5,5)
tablero.poner(2,6,4)
tablero.poner(3,9,9)
tablero.poner(4,4,6)
tablero.poner(4,7,9)
tablero.poner(4,9,7)
tablero.poner(5,4,5)
tablero.poner(5,6,8)
tablero.poner(6,1,1)
tablero.poner(6,3,7)
tablero.poner(6,6,2)
tablero.poner(7,1,3)
tablero.poner(8,4,4)
tablero.poner(8,5,6)
tablero.poner(8,8,9)
tablero.poner(8,9,1)
tablero.poner(9,3,5)
tablero.poner(9,5,8)
tablero.poner(9,7,7)
tablero.poner(9,8,2)

puts tablero.to_s
tablero.resolver
puts ''
puts tablero.to_s