#!/usr/bin/python
# -*- coding: utf-8 -*-

# Imports del sistema
import os
import sys
import getopt

# Archivos propios
import db as db
import analisis as a
import reporte as r

# Mensaje de uso
def uso():
    msg = '''
    ####################################################################
    # TFM - Trabajo Final de Maestria - Alejandro Martinez, Angel Mera #
    ####################################################################

    Uso: ./tfm.py opcion
    Opciones
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
        if param == "a":
            #agendarAnalisis()
            print("Agenda - No disponible")
        elif param == "e":
            a.ejecutarAnalisis()
        elif param == "r":
            r.ejecutarReporte()
        else:
            print ("Parametro Incorrecto")
            sys.exit(2)

if __name__ == "__main__":
    main()
    
