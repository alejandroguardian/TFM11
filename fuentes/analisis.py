#!/usr/bin/python
# -*- coding: utf-8 -*-
# Este script se encarga de ejecutar un nuevo analisis

# Imports
import db
import os
import webbrowser
from datetime import datetime
from random import *

# Clase de escritura a archivo
class OutputCsv:

    # Abro Archivo
    def abroLog(self, filename):
        self.f = open(filename, 'w')

    # Escribo Cabezal
    def escriboCabezal(self, cabezal):
        self.f.write(cabezal)

    # Escribo log
    def escriboLog(self, msg):
        self.f.write(msg)

    # Cierro Log
    def cierroLog(self):
        self.f.close()


# Rutina de analisis
def ejecutarAnalisis():

    # Identificador unico del reporte
    repid = str(randint(1,1000000))
    
    # Reporte CSV
    dt = datetime.now()
    #filename = 'reportes/' + dt.strftime('%Y%m%d%H%M') + '.csv'
    filename = 'reportes/' + repid + '.csv'
    ocsv = OutputCsv()
    ocsv.abroLog(filename)

    # BD - Lectura de tareas a ejecutar
    db.opendb()
    data = db.conn.execute('select name,cmd,result,id from Tasks')

    # Parseo tareas
    ocsv.escriboCabezal('Reporte,Control,Resultado Esperado,Resultado Obtenido,Status\n')

    # Realizo looop en la tabla "Tasks"
    cont=0
    for row in data:
        name = row[0]
        cmd = 'scripts/' + row[1]
        result = row[2]
        itemid = str(row[3])

        # Inicio
        print("["+str(cont)+"] Ejecutando: "+name, end='')
        cont += 1

        # Ejecuto Script
        stream = os.popen(cmd)
        cmdout = ''.join(stream.read().split())

        # Verifico resultado obtenido (cmdout) contra salida esperada (result)
        if cmdout == result:
            print(" - OK") # Todo OK - Registro en archivo

            # Registro
            dt = datetime.now()
            db.conn.execute("INSERT INTO Output (Job,Date,ItemId,ItemResult,ItemResultDetail) VALUES ("+repid+ ",'"+str(dt.strftime('%Y%m%d%H%M'))+"','"+itemid+"',0,'OK')");

        else:
            print(" - ERR") # Error - Vuelvo a correr el script pasandole "D" por linea de comando ("D"etalle)
            stream = os.popen(cmd + " D")
            cmdout = ''.join(stream.read().split())
            if not cmdout:
                cmdout = "Not found"
            dt = datetime.now()
            db.conn.execute("INSERT INTO Output (Job,Date,ItemId,ItemResult,ItemResultDetail) VALUES ("+repid+ ",'"+str(dt.strftime('%Y%m%d%H%M'))+"',"+itemid+",1,'"+cmdout+"')");

        # Grabo BD
        db.conn.commit()

        # Variable para el archivo de Log
        grabo = repid + ',' + str(name) + ',' + str(result.encode('utf-8')) + ',' + str(cmdout.encode('utf-8'))

        # Verifico la salida
        if cmdout == result:
            grabo = grabo + ',OK'
        else:
            grabo = grabo + ',ERR'

        # Grabo Log
        ocsv.escriboLog(grabo + '\n')

    db.closedb()
    ocsv.cierroLog()

    # Generacion de html
    filename1 = 'reportes/html/' + dt.strftime('%Y%m%d')+'-'+dt.strftime('%H%M') + '-'+ repid + '.html'
    ohtml = OutputCsv()
    ohtml.abroLog(filename1)
    mid=str(repid)
    mid=mid.strip()
    cadena="select tas.name,det.ItemResultDetail result,det.ItemResult output,det.date date_time,det.ItemId from Output det join Tasks tas on tas.id=det.ItemId where det.Job="+mid
    data2 = db.conn.execute(cadena)
    vmensaje="""<br><div style='border: 0pt solid #bfb;'>
    <table border='1' align='center'>
    <tr>
    <td><font color='Zian'>INFORME EJECUTIVO</font></td>
    </tr>
    </table>
    </div>"""
    vmensaje=vmensaje+' '+'<BR><TABLE BORDER=2 align="center" bordercolor="blue" >'
    vmensaje=vmensaje +'<TR>'+'<TD align="center">'+'<font color="Maroon">'+'#'+'</font>'+'</TD>'+'<TD  align="center">'+'<font color="Maroon">'+'Descripción del Proceso'+'</font>'+'</TD>'+'<TD align="center">'+'<font color="Maroon">'+'Resultado'+'</font>'+'</TD>'+'<TD align="center">'+'<font color="Maroon">'+'Salida'+'</font>'+'</TD>'+'<TD align="center">'+'<font color="Maroon">'+'Fecha y Hora'+'</font>'+'</TD>'+'</TR>'
    for row2 in data2:
        vdatetime=str(row2[3])[0:4]+'/'+str(row2[3])[4:6]+'/'+str(row2[3])[6:8]+' '+str(row2[3])[8:10]+':'+str(row2[3])[10:12]
        vmensaje=vmensaje +'<TR>'+'<TD align="center">'+'<font color="Maroon">'+str(row2[4]).strip()+'</font>'+'</TD>'+'<TD align="center">'+'<font color="Maroon">'+row2[0]+'</font>'+'</TD>'+'<TD align="center">'+'<font color="Maroon">'+row2[1].strip()+'</font>'+'</TD>'+'<TD align="center">'+'<font color="Maroon">'+str(row2[2])+'</font>'+'<TD align="center">'+'<font color="Maroon">'+vdatetime+'</font>'+'</TD>'+'</TR>' 
    vmensaje=vmensaje+'</TABLE>'
    ohtml.escriboLog(vmensaje + '\n')
    ohtml.cierroLog()
            
    #Abriendo archivo HTML con el Navegador
    webbrowser.open_new_tab(filename1)

