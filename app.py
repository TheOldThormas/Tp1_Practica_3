from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL
from werkzeug.utils import secure_filename
from datetime import datetime

app = Flask(__name__)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'ibA_pX2V5Z-#3:4Tcs'
app.config['MYSQL_DB'] = 'imagenes'
conexion = MySQL(app)


@app.context_processor
def categoria():
    datos = {}
    try:
        cursor = conexion.connection.cursor()
        sql = "SELECT * FROM categoria"  # esto es del SQL
        cursor.execute(sql)
        tabla = cursor.fetchall()
        datos["categorias"] = tabla  # ginga
    except Exception as e:
        print("Error MySQL:", str(e))
    return datos


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
        producto = request.form.get('producto')
        producto = producto.title()
        precio = request.form.get('precio')
        descripcion = request.form.get('descripcion')
        descripcion = descripcion.title()
        cantidad = request.form.get('cantidad')
        nombre_archivo = secure_filename(imagen.filename)
        tipo_archivo = nombre_archivo.rsplit('.', 1)[1]
        nombre_archivo = nombre_archivo.rsplit('.', 1)[0]
        nombre_modificado = f"{datetime.now().strftime('%Y%m%d%H%M%S')}.{tipo_archivo}"
        nombre_final = nombre_archivo+nombre_modificado
        imagen.save('static/'+nombre_final)
        try:
            cursor = conexion.connection.cursor()
            sql = f"INSERT INTO `producto` (`nombre_producto`, `precio_producto`, `descripcion_producto`, `cantidad_producto`, `imagen_producto`) VALUES ('{producto}', '{precio}', '{descripcion}', '{cantidad}', '{nombre_final}');"
            cursor.execute(sql)
            conexion.connection.commit()
        except Exception as e:
            print("Error MySQL:", str(e))
        return redirect('/')


@app.route("/")
def imagenes():
    try:
        cursor = conexion.connection.cursor()
        sql = "SELECT * FROM producto"
        cursor.execute(sql)
        tabla = cursor.fetchall()
    except Exception as e:
        print("Error MySQL:", str(e))
    return render_template('index.html', tabla=tabla)


@app.route('/eliminar/<int:producto_id>', methods=['POST', 'GET'])
def eliminar_producto(producto_id):
    try:
        print(producto_id)
        cursor = conexion.connection.cursor()
        sql = f"SELECT imagen_producto FROM producto WHERE idproducto = {producto_id}"
        cursor.execute(sql)
        resultado = cursor.fetchone()
        if resultado:
            nombre_imagen = resultado[0]
            sql = f"DELETE FROM producto WHERE idproducto = {producto_id}"
            cursor.execute(sql)
            conexion.connection.commit()
            # Eliminar la imagen del servidor
            import os
            os.remove(os.path.join('static', nombre_imagen))
            return redirect('/')
        else:
            return 'Producto no encontrado'
    except Exception as e:
        print("Error MySQL:", str(e))
        return 'Error al eliminar el producto'


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
