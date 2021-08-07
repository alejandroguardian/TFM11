# Este script se encarga de grabar la salida a un archivo

# Imports
import os
import csv
from datetime import datetime

# Variable
global f 

# Abro log
def abroLog():
    dt = datetime.now()
    label = "reportes/"+dt.strftime('%Y%m%d%H%M')+".csv"
    f = open(label,"w")

# Escribo Cabezal
def escriboCabezal(cabezal):
    f.write(cabezal)

# Escribo log
def escriboLog(msg):
    f.write(msg)

# Cierro log    
def cierroLog():
    f.close()
