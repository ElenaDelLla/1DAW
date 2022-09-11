<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/"> <!-- plantilla principal -->
  <html>
  <body>
      <h1>Mis Canciones</h1>
      <table style="border:1px solid blue;">
    <tr style="background-color:lightblue;">
      <th style="text-align:left">Título</th>
      <th style="text-align:left">Artista</th>
      <th style="text-align:left">Disco</th>
      <th style="text-align:left">Puntuación</th>
    </tr>
    <xsl:for-each select="MiBibliotecaMP3/archivo"> <!-- inicio bucle -->
      <xsl:choose>
      <xsl:when test="puntuacion = 8">  <!-- puntuados con 8, fondo amarillo -->    
        <tr>
          <td style="background-color:yellow"><xsl:value-of select="canción"/></td>
          <td style="background-color:yellow"><xsl:value-of select="artista"/></td>
          <td style="background-color:yellow"><xsl:value-of select="disco"/></td>
          <td style="background-color:yellow"><xsl:value-of select="puntuacion"/></td>
        </tr>
        </xsl:when>
        <xsl:when test="puntuacion = 9">  <!-- puntuados con 9, fondo naranja -->    
        <tr>
          <td style="background-color:orange"><xsl:value-of select="canción"/></td>
          <td style="background-color:orange"><xsl:value-of select="artista"/></td>
          <td style="background-color:orange"><xsl:value-of select="disco"/></td>
          <td style="background-color:orange"><xsl:value-of select="puntuacion"/></td>
        </tr>
        </xsl:when>      
        <xsl:otherwise>  <!-- el resto, fondo rojo -->    
        <tr>
          <td style="background-color:red"><xsl:value-of select="canción"/></td>
          <td style="background-color:red"><xsl:value-of select="artista"/></td>
          <td style="background-color:red"><xsl:value-of select="disco"/></td>
          <td style="background-color:red"><xsl:value-of select="puntuacion"/></td>
        </tr>
        </xsl:otherwise>
      </xsl:choose>   
    </xsl:for-each> <!-- final bucle -->
  </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>

