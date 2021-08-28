#!/usr/bin/python
# -*- coding: utf-8 -*-
# Este script se encarga de grabar el analisis como Csv

# Clase de escritura a archivo
class OutputCsv:

    # Abro Archivo
    def abroLog(self, filename):
        self.f = open(filename, 'w')

    # Escribo Cabezal
    def escriboCabezal(self, cabezal):
        self.f.write(cabezal)

    # Escribo log
    def escriboLog(self, msg):
        self.f.write(msg)

    # Cierro Log
    def cierroLog(self):
        self.f.close()

