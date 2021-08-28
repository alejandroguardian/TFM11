#!/usr/bin/python
# -*- coding: utf-8 -*-
# Este script se encarga de ejecutar un nuevo analisis

# Imports
import db
import reportehtml as outhtml
import os
import reportecsv as outcsv
from datetime import datetime
from random import *

# Rutina de analisis
def ejecutarAnalisis():

    # Identificador unico del reporte
    repid = str(randint(1,1000000))

    # Reporte CSV
    dt = datetime.now()
    filename = 'reportes/' + dt.strftime('%Y%m%d%H%M') + '.csv'
    # filename = 'reportes/' + repid + '.csv'
    ocsv = outcsv.OutputCsv()
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
            cmdout = ' '.join(stream.read().split())
            if not cmdout:
                cmdoutshow = "Not found"
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
    ohtml = outhtml.OutputHtml()
    ohtml.armoHtml(repid)

