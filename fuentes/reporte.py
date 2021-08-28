#!/usr/bin/python
# -*- coding: utf-8 -*-
# Este script se encarga de ejecutar reportes

# python3 -m pip install simple-term-menu

# Imports
from simple_term_menu import TerminalMenu
import os
import pandas

# Clase principal
def ejecutarReporte():

    # Borro pantalla
    if os.name == 'posix':
      _ = os.system('clear')
    else:
      # Windows
      _ = os.system('cls')

    msg = '''
    ####################################################################
    # TFM - Trabajo Final de Maestria - Alejandro Martinez, Angel Mera #
    ####################################################################
    
    '''
    print(msg)
    
    print("Seleccione un analisis")
    ruta = "./reportes/"
    dirs = os.listdir(ruta)
    files = [x for x in dirs if os.path.isfile(os.path.join(ruta, x))]
    terminal_menu = TerminalMenu(files)
    menu_entry_index = terminal_menu.show()

    reporteCsv = pandas.read_csv("reportes/"+str(files[menu_entry_index]), usecols =["Control","Resultado Esperado","Resultado Obtenido","Status"])
    print(reporteCsv)
