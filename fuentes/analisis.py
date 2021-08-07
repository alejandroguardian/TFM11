# Este script se encarga de ejecutar un nuevo analisis

# Imports
import db
import os
from datetime import datetime

# Rutina principal
def ejecutarAnalisis():

    # Archivo de reporte
    dt = datetime.now()
    label = "reportes/"+dt.strftime('%Y%m%d%H%M')+".csv"
    f = open(label,"w")

    # BD - Lectura de tareas a ejecutar
    db.opendb()
    data = db.conn.execute("select name,cmd,result from Tasks")

    # Parseo tareas
    f.write("Control,Resultado Esperado,Resultado Obtenido,Status")

    # Realizo looop en la tabla "Tasks"
    for row in data:
        name = row[0]
        cmd = row[1]
        result = row[2]
        print("Resultado: " + result)
        print("[*] Ejecutando: ", name, " esperando: ", result)
        #print(cmd)
        stream = os.popen(cmd)
        output = "".join(stream.read().split())
        #print(output)
        if ( output == result ):
	    escribo = name+","+result.encode('utf-8')+","+output.encode('utf-8')+",OK"
	    f.write(escribo+"\n")
	    print(escribo)
        else:
	    escribo = name+","+result.encode('utf-8')+","+output.encode('utf-8')+",ERR"
	    f.write(escribo+"\n")
	    print(escribo)
    db.closedb()
    f.close()

