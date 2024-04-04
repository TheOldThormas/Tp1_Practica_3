from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL
from werkzeug.utils import secure_filename
from datetime import datetime
import os

app = Flask(__name__)

app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='julian'
app.config['MYSQL_PASSWORD']='123456789'
app.config['MYSQL_DB']='imagenes'
conexion=MySQL(app)

@app.route('/cargar')
def productos():
    return render_template('formulario.html')

@app.route('/subir', methods=['POST'])
def subir_archivo():
    if 'archivo' not in request.files:
        return 'ningún archivo'
    imagen = request.files['archivo']
    if imagen.filename == '':
        return 'ningún archivo'
    if imagen: 
        producto=request.form.get('producto')
        producto=producto.title()
        precio=request.form.get('precio')
        descripcion=request.form.get('descripcion')
        descripcion=descripcion.title()
        cantidad=request.form.get('cantidad')
        nombre_archivo=secure_filename(imagen.filename)
        tipo_archivo=nombre_archivo.rsplit('.', 1)[1]
        nombre_archivo=nombre_archivo.rsplit('.', 1)[0]
        nombre_modificado=f"{datetime.now().strftime('%Y%m%d%H%M%S')}.{tipo_archivo}"
        nombre_final=nombre_archivo+nombre_modificado
        imagen.save('static/'+nombre_final)
        try:
            cursor=conexion.connection.cursor()
            sql=f"INSERT INTO `producto` (`nombre_producto`, `precio_producto`, `descripcion_producto`, `cantidad_producto`, `imagen_producto`) VALUES ('{producto}', '{precio}', '{descripcion}', '{cantidad}', '{nombre_final}');"
            cursor.execute(sql)
            conexion.connection.commit()
        except Exception as e:
            print("Error MySQL:", str(e))
        return redirect('/')

@app.route('/modificar', methods=['GET','POST'])
def modificar():
    id_producto=request.args.get('id_producto')
    try:
        cursor=conexion.connection.cursor()
        sql=f"SELECT * FROM producto where idproducto = {id_producto}" 
        cursor.execute(sql)
        tabla=cursor.fetchone()
    except Exception as e:
        print("Error MySQL:", str(e))
    return render_template('modificar.html', tabla=tabla)

@app.route('/confirmar', methods=['POST'])
def confirmar():
    id=request.form.get('id_producto')
    imagen = request.files['archivo']
    if imagen.filename == '':
        nombre_final=request.form.get('imagen_actual')
    else:
        nombre_archivo=secure_filename(imagen.filename)
        tipo_archivo=nombre_archivo.rsplit('.', 1)[1]
        nombre_archivo=nombre_archivo.rsplit('.', 1)[0]
        nombre_modificado=f"{datetime.now().strftime('%Y%m%d%H%M%S')}.{tipo_archivo}"
        nombre_final=nombre_archivo+nombre_modificado
        imagen_vieja=request.form.get('imagen_actual')
        ubicacionvieja=os.path.join("static",imagen_vieja)
        os.remove(ubicacionvieja)
        imagen.save('static/'+nombre_final)
    producto=request.form.get('producto')
    producto=producto.title()
    precio=request.form.get('precio')
    descripcion=request.form.get('descripcion')
    descripcion=descripcion.title()
    cantidad=request.form.get('cantidad')
    try:
        cursor=conexion.connection.cursor()
        sql=f"UPDATE `imagenes`.`producto` SET `precio_producto` = '{precio}', `nombre_producto` = '{producto}', `descripcion_producto` = '{descripcion}',  `cantidad_producto` = '{cantidad}', `imagen_producto` = '{nombre_final}'  WHERE (`idproducto` = '{id}');"
        cursor.execute(sql)
        conexion.connection.commit()
    except Exception as e:
        print("Error MySQL:", str(e))
    return redirect('/')

@app.route("/")
def imagenes():
    try:
        cursor=conexion.connection.cursor()
        sql="SELECT * FROM producto"
        cursor.execute(sql)
        tabla=cursor.fetchall()
    except Exception as e:
        print("Error MySQL:", str(e))
    return render_template('index.html',tabla=tabla)

@app.route("/eliminar", methods=['GET','POST'])
def eliminar():
    id_producto=request.args.get('id_producto')
    cursor=conexion.connection.cursor()
    sql=f"SELECT imagen_producto FROM producto WHERE idproducto = {id_producto}"
    cursor.execute(sql)
    resultado=cursor.fetchone()
    nombre_imagen=resultado[0]
    sql=f"DELETE FROM producto WHERE idproducto = {id_producto}"
    cursor.execute(sql)
    conexion.connection.commit()
    os.remove(os.path.join('static', nombre_imagen))
    return redirect('/')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)