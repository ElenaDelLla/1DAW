<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
<html> 
<body>
  <h1>Mis Canciones favoritas</h1>
  <table style="border:1px solid blue;">
    <tr style="background-color:lightblue;">
      <th style="text-align:left">Título</th>
      <th style="text-align:left">Artista</th>
      <th style="text-align:left">Disco</th>
    </tr>
    <xsl:for-each select="MisCancionesPreferidas/archivo">
    <tr>
      <td><xsl:value-of select="canción"/></td>
      <td><xsl:value-of select="artista"/></td>
      <td><xsl:value-of select="disco"/></td>
    </tr>
    </xsl:for-each>
  </table>
</body>
</html>
</xsl:template>
</xsl:stylesheet>


