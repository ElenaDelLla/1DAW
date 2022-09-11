<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/"> <!-- plantilla principal -->
  <html>
  <body>
      <h1>Mis Canciones</h1>
  <xsl:apply-templates/> <!-- llamada para aplicar el resto de plantillas -->
  </body>
  </html>
</xsl:template>

<xsl:template match="archivo"> <!-- plantilla para el nodo archivo -->
  <p>
  <xsl:apply-templates select="canción"/> <!-- aplica la plantilla definida para el nodo canción -->
  <xsl:apply-templates select="artista"/><!-- aplica la plantilla definida para el nodo artista -->
  <xsl:apply-templates select="disco"/><!-- aplica la plantilla definida para el nodo disco -->
  </p>
</xsl:template>

<xsl:template match="canción"> <!-- plantilla definida para el nodo canción -->
  Canción <span style="color:darkblue">
  <xsl:value-of select="."/></span>
  <br />
</xsl:template>

<xsl:template match="artista"> <!-- plantilla definida para el nodo artista -->
  Artista <span style="color:blue">
  <xsl:value-of select="."/></span>
  <br />
</xsl:template>

<xsl:template match="disco"> <!-- plantilla definida para el nodo disco -->
  Disco <span style="color:lightblue">
  <xsl:value-of select="."/></span>
  <br />
</xsl:template>
</xsl:stylesheet>

