import pymysql
#El reports-service debe permitir obtener un CSV con las ventas de cada día, mes o año
#en una sucursal específica y también un reporte con los datos de los mejores clientes
#de la cadena de restaurantes y los productos que han consumido en algún periodo del
#tiempo.
class Database:
    def connect(self):
        return pymysql.connect("192.168.100.131","root","tec","restaurant-rdb" )

    def read(self, inicio, final):
        con = Database.connect(self)
        cursor = con.cursor()

        try:
            if inicio == 'None':
                cursor.execute("SELECT * FROM SUCURSAL")
            elif final == 'None': 
                cursor.execute("SELECT * FROM SUCURSAL")
            else:
                cursor.execute("SELECT * FROM ORDEN where fecha between '%s' and '%s';", (incio,final))

            return cursor.fetchall()
        except:
            return ()
        finally:
            con.close()
