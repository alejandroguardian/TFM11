#!/usr/bin/python
# -*- coding: utf-8 -*-
# Este script se encarga de grabar el analisis como html
from datetime import datetime
import db
import reportecsv as outcsv
# import webbrowser

# Clase de escritura a archivo
class OutputHtml:

    def armoHtml(self, repid):
        dt = datetime.now()
        filename = 'reportes/html/' + dt.strftime('%Y%m%d')+'-'+dt.strftime('%H%M') + '-'+ repid + '.html'
        ocsv = outcsv.OutputCsv()
        ocsv.abroLog(filename)
        db.opendb()
        mid=str(repid)
        mid=mid.strip()
        cadena="select tas.name,det.ItemResultDetail result,det.ItemResult output,det.date date_time,det.ItemId from Output det join Tasks tas on tas.id=det.ItemId where det.Job="+mid
        data2 = db.conn.execute(cadena)
        vmensaje="""<br><div style='border: 0pt solid #bfb;'>
        <table border='1' align='center'>
        <tr>
        <td><font color='Zian'>INFORME EJECUTIVO</font></td>
        </tr>
        </table>
        </div>"""
        vmensaje=vmensaje+' '+'<BR><TABLE BORDER=2 align="center" bordercolor="blue" >'
        vmensaje=vmensaje +'<TR>'+'<TD align="center">'+'<font color="Maroon">'+'#'+'</font>'+'</TD>'+'<TD  align="center">'+'<font color="Maroon">'+'Descripción del Proceso'+'</font>'+'</TD>'+'<TD align="center">'+'<font color="Maroon">'+'Resultado'+'</font>'+'</TD>'+'<TD align="center">'+'<font color="Maroon">'+'Salida'+'</font>'+'</TD>'+'<TD align="center">'+'<font color="Maroon">'+'Fecha y Hora'+'</font>'+'</TD>'+'</TR>'
        for row2 in data2:
            vdatetime=str(row2[3])[0:4]+'/'+str(row2[3])[4:6]+'/'+str(row2[3])[6:8]+' '+str(row2[3])[8:10]+':'+str(row2[3])[10:12]
            vmensaje=vmensaje +'<TR>'+'<TD align="center">'+'<font color="Maroon">'+str(row2[4]).strip()+'</font>'+'</TD>'+'<TD align="center">'+'<font color="Maroon">'+row2[0]+'</font>'+'</TD>'+'<TD align="center">'+'<font color="Maroon">'+row2[1].strip()+'</font>'+'</TD>'+'<TD align="center">'+'<font color="Maroon">'+str(row2[2])+'</font>'+'<TD align="center">'+'<font color="Maroon">'+vdatetime+'</font>'+'</TD>'+'</TR>' 
        vmensaje=vmensaje+'</TABLE>'
        ocsv.escriboLog(vmensaje + '\n')
        ocsv.cierroLog()
        db.closedb()

        #Abriendo archivo HTML con el Navegador
        # webbrowser.open_new_tab(filename)
