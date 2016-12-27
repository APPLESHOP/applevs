<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="../../css/reset.css"/>
                <link rel="stylesheet" type="text/css" href="../../css/main.css"/>
                <link rel="stylesheet" type="text/css" href="css/xml.css"/>
            </head>
            <body>
                <header>
                    <div class="wrapper">
                        <a href="../../index.html" class="logo">
                        </a>

                        <nav>
                            <ul>
                                <li><a href="../../about.html">About</a></li>
                                <li><a href="../../devices.html">Devices</a></li>
                                <li><a href="../../contact.html">Contacts</a></li>
                                <li><a href="../../pers.html">Your Personal Area</a></li>
                            </ul>
                        </nav>
                    </div>
                </header>
                <!--  stat page title  -->
                <section class="page_title">
                    <h1 class="title">Orders</h1>
                </section>
                <div class="order">
                    <a href="../../personal.html" class="back">Назад</a>
                <h1>Your Orders
                </h1>
                <xsl:apply-templates select="//order"/>
                </div>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="order">
        <xsl:if test="generate-id(.)= generate-id(//order[@model=current()/@model][1])">
            <h2>
                <xsl:value-of select="@model"/>
            </h2>


            <table  border="1" bordercolor="black">
                <thead>
                    <tr>
                        <td>Order date</td>
                        <td>Date of receiving</td>
                        <td>Color</td>
                    </tr>
                </thead>
                <tbody>
                    <xsl:apply-templates select="//order[@model=current()/@model]" mode="table"/>
                </tbody>
            </table>
        </xsl:if>
    </xsl:template>
    <xsl:template match="order" mode="table">
        <tr>
            <td>
                <xsl:value-of select="@date1"/>
            </td>
            <td>
                <xsl:value-of select="@date2"/>
            </td>
            <td>
                <xsl:value-of select="@color"/>
            </td>
        </tr>
    </xsl:template>

</xsl:stylesheet>