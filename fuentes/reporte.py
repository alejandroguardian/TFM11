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
    print("Seleccione un analisis")
    ruta = "./reportes/"
    reportes = os.listdir( ruta )
    terminal_menu = TerminalMenu(reportes)
    menu_entry_index = terminal_menu.show()
    
    # Borro pantalla
    if os.name == 'posix':
      _ = os.system('clear')
    else:
      # Windows
      _ = os.system('cls')

    reporteCsv = pandas.read_csv("reportes/"+str(reportes[menu_entry_index]), usecols =["Control","Resultado Esperado","Resultado Obtenido","Status"])
    print(reporteCsv)
