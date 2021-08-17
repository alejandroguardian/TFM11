#!/usr/bin/python
# -*- coding: utf-8 -*-
# Modulo de trabajo con Base de Datos
import sqlite3

# Ejemplos
#conn.execute("INSERT INTO Tasks (name,cmd,result,description) VALUES ('Check root user', 'cat /etc/passwd | grep :0: | wc -l', '0', 'Find number of users with id 0' )");
#conn.commit()
#print ("Records inserted successfully")

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

		
