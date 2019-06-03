<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <style>
                    table {
                    font-family: arial, sans-serif;
                    border-collapse: collapse;
                    width: 100%;
                    }

                    td, th {
                    border: 1px solid #dddddd;
                    text-align: center;
                    padding: 8px;
                    }

                    tr:nth-child(even) {
                    background-color: #dddddd;
                    }

                    p {
                        color: blue;
                        font-weight: bold;
                        font-size: 20px;
                        text-align: center;
                    }
                </style>
            </head>
            <body>
                <div id="stadions">
                    <p>STADIONY:</p>
                    <table>
                        <th>Nazwa</th>
                        <th>Liczba miejsc</th>
                        <th>Oświetlenie</th>
                        <th>Długość toru (m)</th>
                        <th>Rekord toru (s)</th>
                        <xs:for-each select="speedwayleague/stadions/stadion">
                            <xsl:choose>
                                <xsl:when test="capacity > 10000">
                                    <tr style="color: red;">
                                        <td><xsl:value-of select="name"/></td>
                                        <td><xsl:value-of select="capacity"/></td>
                                        <td><xsl:value-of select="lighting"/></td>
                                        <td><xsl:value-of select="length"/></td>
                                        <td><xsl:value-of select="record"/></td>
                                    </tr>
                                </xsl:when>
                                <xsl:otherwise>
                                    <tr>
                                        <td><xsl:value-of select="name"/></td>
                                        <td><xsl:value-of select="capacity"/></td>
                                        <td><xsl:value-of select="lighting"/></td>
                                        <td><xsl:value-of select="length"/></td>
                                        <td><xsl:value-of select="record"/></td>
                                    </tr>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xs:for-each>
                    </table>
                </div>
                <div id="teams">
                    <p>DRUŻYNY:</p>
                    <table>
                        <th>Nazwa</th>
                        <th>Adres e-mail</th>
                        <th>Telefon</th>
                        <th>Data założenia</th>
                        <th>Właściciel</th>
                        <th>Trener</th>
                        <xs:for-each select="speedwayleague/teams/team">
                            <tr>
                                <td><xsl:value-of select="name"/></td>
                                <td><xsl:value-of select="email"/></td>
                                <td><xsl:value-of select="phonenumber"/></td>
                                <td><xsl:value-of select="establishmentyear"/></td>
                                <td><xsl:value-of select="president"/></td>
                                <td><xsl:value-of select="coach"/></td>
                            </tr>
                        </xs:for-each>
                    </table>
                </div>
                <div id="riders">
                    <p>ŻUŻLOWCY:</p>
                    <table>
                        <th>Imie</th>
                        <th>Nazwisko</th>
                        <th>Data urodzenia</th>
                        <th>Nadorowość</th>
                        <th>Federacja</th>
                        <th>Klub</th>
                        <xs:for-each select="speedwayleague/riders/rider">
                            <xsl:if test="nationality/@code = 'PL'">
                                <tr style="color: red;">
                                    <td><xsl:value-of select="firstname"/></td>
                                    <td><xsl:value-of select="lastname"/></td>
                                    <td><xsl:value-of select="birthdate"/></td>
                                    <td><xsl:value-of select="nationality/@code"/></td>
                                    <td><xsl:value-of select="federation"/></td>
                                    <td><xsl:value-of select="/speedwayleague/teams/team[@id=current()/riderteam/@refid]/name"/></td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="nationality/@code = 'AU'">
                                <tr style="color: blue;">
                                    <td><xsl:value-of select="firstname"/></td>
                                    <td><xsl:value-of select="lastname"/></td>
                                    <td><xsl:value-of select="birthdate"/></td>
                                    <td><xsl:value-of select="nationality/@code"/></td>
                                    <td><xsl:value-of select="federation"/></td>
                                    <td><xsl:value-of select="/speedwayleague/teams/team[@id=current()/riderteam/@refid]/name"/></td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="nationality/@code = 'DK'">
                                <tr style="color: orange;">
                                    <td><xsl:value-of select="firstname"/></td>
                                    <td><xsl:value-of select="lastname"/></td>
                                    <td><xsl:value-of select="birthdate"/></td>
                                    <td><xsl:value-of select="nationality/@code"/></td>
                                    <td><xsl:value-of select="federation"/></td>
                                    <td><xsl:value-of select="/speedwayleague/teams/team[@id=current()/riderteam/@refid]/name"/></td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="nationality/@code = 'GB'">
                                <tr style="color: purple;">
                                    <td><xsl:value-of select="firstname"/></td>
                                    <td><xsl:value-of select="lastname"/></td>
                                    <td><xsl:value-of select="birthdate"/></td>
                                    <td><xsl:value-of select="nationality/@code"/></td>
                                    <td><xsl:value-of select="federation"/></td>
                                    <td><xsl:value-of select="/speedwayleague/teams/team[@id=current()/riderteam/@refid]/name"/></td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="nationality/@code = 'RU'">
                                <tr style="color: yellow;">
                                    <td><xsl:value-of select="firstname"/></td>
                                    <td><xsl:value-of select="lastname"/></td>
                                    <td><xsl:value-of select="birthdate"/></td>
                                    <td><xsl:value-of select="nationality/@code"/></td>
                                    <td><xsl:value-of select="federation"/></td>
                                    <td><xsl:value-of select="/speedwayleague/teams/team[@id=current()/riderteam/@refid]/name"/></td>
                                </tr>
                            </xsl:if>
                            <xsl:if test="nationality/@code = 'SI'">
                                <tr style="color: brown;">
                                    <td><xsl:value-of select="firstname"/></td>
                                    <td><xsl:value-of select="lastname"/></td>
                                    <td><xsl:value-of select="birthdate"/></td>
                                    <td><xsl:value-of select="nationality/@code"/></td>
                                    <td><xsl:value-of select="federation"/></td>
                                    <td><xsl:value-of select="/speedwayleague/teams/team[@id=current()/riderteam/@refid]/name"/></td>
                                </tr>
                            </xsl:if>
                        </xs:for-each>
                    </table>
                </div>
                <div id="leaguetable">
                    <p>TABELA LIGOWA:</p>
                    <table>
                        <th>Nazwa</th>
                        <th>WYGRANE</th>
                        <th>REMISTY</th>
                        <th>PRZEGRANE</th>
                        <th>PUNKTY</th>
                        <th>BILANS</th>
                        <xs:for-each select="speedwayleague/teams/team">
                            <xsl:sort select="points" order="descending" data-type="number"/>
                            <tr>
                                <td><xsl:value-of select="name"/></td>
                                <td><xsl:value-of select="win"/></td>
                                <td><xsl:value-of select="draw"/></td>
                                <td><xsl:value-of select="lost"/></td>
                                <td><xsl:value-of select="points"/></td>
                                <td><xsl:value-of select="bilans"/></td>
                            </tr>
                        </xs:for-each>
                    </table>
                </div>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>