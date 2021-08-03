# Este script se encarga de ejecutar un nuevo analisis

# Imports
import db
import os

# Rutina principal
def ejecutarAnalisis():
    db.opendb()
    data = db.conn.execute("select name,cmd,result from Tasks")
    for row in data:
        name = row[0]
        cmd = row[1]
        result = row[2]
        print("Resultado: " + result)
        print("[*] Ejecutando: ", name, " esperando: ", result)
        #print(cmd)
        #stream = os.popen(cmd)
        #output = "".join(stream.read().split())
        #print(output)
        #if ( output == result ):
        #    print("OK")
        #else:
        #    print("ERROR !!!")
    db.closedb()

