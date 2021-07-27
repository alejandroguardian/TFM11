import sqlite3
import os
import sys

# Apertura DB
def opendb():
    
    # Variables
    global conn
    
    # Conexion a la base
    database = '/home/alejandro/Documentos/maestria/M11_TFM/trabajo/codigo/m11tfm.db'

    # Abro DB
    try:
        conn = sqlite3.connect(database)
        print("Conectado a BD")
    #except sqlite3.Error as error:
    except Exception as e:
    	print("Error de conexion a BD", e)

# Cierre DB
def closedb():
    print("Cerrando DB")
    conn.close()
    
#conn.execute("INSERT INTO Tasks (name,cmd,result,description) VALUES ('Check root user', 'cat /etc/passwd | grep :0: | wc -l', '0', 'Find number of users with id 0' )");
#conn.commit()
#print ("Records inserted successfully")

# Mensaje de uso
def uso():
    msg = '''
    TFM - Trabajo Final de Maestria \n
    Uso: ./tfm.py opcion\n
    '''
    print(msg)

# Main
def main():
    if ( len(sys.argv) == 0 ):
        uso()
    else:
        opendb()
        data = conn.execute("select name,cmd,result from Tasks")
        for row in data:
            name = row[0]
            cmd = row[1]
            result = row[2]
            print("Resultado: " + result)
            print("[*] Ejecutando: ", name)
            #print(cmd)
            stream = os.popen(cmd)
            output = "".join(stream.read().split())
            print(output)
            if ( output == result ):
                print("OK")
            else:
                print("ERROR !!!")
        
        closedb()


if __name__ == "__main__":
    # execute only if run as a script
    main()
    