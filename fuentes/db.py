# Modulo de trabajo con Base de Datos
import sqlite3

# Apertura DB
def opendb():

    # Variables
    global conn

    # Conexion a la base
    database = '/home/alejandro/Documentos/maestria/M11_TFM/trabajo/repo/database/m11tfm.db'

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

		
