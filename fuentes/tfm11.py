# Imports del sistema
import os
import sys
import getopt

# Archivos propios
import db as db
import analisis as a
    
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

if __name__ == "__main__":
    main()
    
