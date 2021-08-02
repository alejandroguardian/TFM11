# Imports del sistema
import os
import sys
import getopt

# Archivos propios
import db as db
import analisis as a
    
#conn.execute("INSERT INTO Tasks (name,cmd,result,description) VALUES ('Check root user', 'cat /etc/passwd | grep :0: | wc -l', '0', 'Find number of users with id 0' )");
#conn.commit()
#print ("Records inserted successfully")

# Mensaje de uso
def uso():
    msg = '''
    TFM - Trabajo Final de Maestria \n
    Uso: ./tfm.py opcion\n
    
    Opciones:
	a - Agendar analisis
	e - Ejecutar analisis
	r - Acceso Reportes
    '''
    print(msg)

# Main
def main():
    if ( len(sys.argv) == 1 ):
        uso()
    else:
        param = sys.argv[1]
        if param is "a":
            #agendarAnalisis()
            print("Agenda")
        elif param is "e":
            a.ejecutarAnalisis()
        elif param is "r":
            print("Reportes")
            #accesoReportes()
        else:
            print ("Parametro Incorrecto")
            sys.exit(2)


def nuevoAnalisis():
    db.opendb()
    data = db.conn.execute("select name,cmd,result from Tasks")
    for row in data:
        name = row[0]
        cmd = row[1]
        result = row[2]
        print("Resultado: " + result)
        print("[*] Ejecutando: ", name)
        print(cmd)
        stream = os.popen(cmd)
        output = "".join(stream.read().split())
        print(output)
        if ( output == result ):
            print("OK")
        else:
            print("ERROR !!!")
    db.closedb()

if __name__ == "__main__":
    # execute only if run as a script
    main()
    
