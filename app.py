from flask import Flask, render_template, request, redirect, session
from flask_mysqldb import MySQL
from flask_session import Session
from werkzeug.utils import secure_filename
from datetime import datetime
import os

app = Flask(__name__)
app.config['SECRET_KEY']='12345'
app.config['SESSION_TYPE']='filesystem'
Session(app)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'AltaEsaBaseDeDatos'
app.config['MYSQL_DB'] = 'imagenes'
conexion = MySQL(app)


@app.context_processor
def variables_jinja():
    datos = {}
    try:
        cursor = conexion.connection.cursor()
        sql = "SELECT * FROM categoria order by tipo;"
        cursor.execute(sql)
        tabla = cursor.fetchall()
        datos["categorias"] = tabla
    except Exception as e:
        print("Error MySQL:", str(e))
    return datos


@app.route('/inicio_sesion')
def inicio_sesion():
    return render_template('inicio_sesion.html')

@app.route('/login', methods=['GET','POST'])
def login():
    usuario=request.form.get('usuario')
    print(usuario)
    password=request.form.get('passw')
    try:
        cursor = conexion.connection.cursor()
        sql = f"SELECT * FROM usuario where nombre_usuario='{usuario}';"
        cursor.execute(sql)
        print(sql)
        tabla = cursor.fetchone()
    except Exception as e:
        print("Error MySQL:", str(e))
    if tabla:
        if password in tabla:
            session['username']=usuario
            session['conectado']=True
            return redirect('/')
        else:
            return redirect('/inicio_sesion')

@app.route('/cerrar')
def cerrar():
    session.pop('username', None)
    session.pop('conectado', None)
    return redirect('/inicio_sesion')

@app.route('/buscar', methods=['GET'])
@app.route('/buscar/<int:pagina>', methods=['GET'])
def buscar(pagina=1):
    buscar = request.args.get("buscar")
    # capta lo que se ponga en el formulario
    try:
        cursor = conexion.connection.cursor()
        cantidad = 3
        salto = (pagina - 1) * cantidad
        sql = f"SELECT * FROM producto where nombre_producto like '%{buscar}%' LIMIT {cantidad} OFFSET {salto};"
        cursor.execute(sql)
        articulos = cursor.fetchall()
        sql = f"SELECT COUNT(*) FROM producto where nombre_producto like '%{buscar}%';"
        cursor.execute(sql)
        total_articulos = cursor.fetchone()[0]
        total_paginas = (total_articulos + cantidad - 1) // cantidad
        print(total_paginas)
        if pagina > total_paginas:
            return redirect(f'/{total_paginas}')
    except Exception as e:
        print("Error MySQL:", str(e))
    return render_template('busqueda.html', articulos=articulos, buscar=buscar, total_paginas=total_paginas, pagina=pagina)


@app.route('/cargar')
def productos():
    return render_template('formulario.html')


@app.route('/cata_categorias')
def cata_categorias():
    if 'conectado' in session:
        return render_template('catalogo_categorias.html')
    else:
        return redirect('/inicio_sesion')


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
        descripcion = descripcion.capitalize()
        cantidad = request.form.get('cantidad')
        categoria = request.form.get('categoria')
        nombre_archivo = secure_filename(imagen.filename)
        tipo_archivo = nombre_archivo.rsplit('.', 1)[1]
        nombre_archivo = nombre_archivo.rsplit('.', 1)[0]
        nombre_modificado = f"{datetime.now().strftime('%Y%m%d%H%M%S')}.{tipo_archivo}"
        nombre_final = nombre_archivo+nombre_modificado
        imagen.save('static/'+nombre_final)
        try:
            cursor = conexion.connection.cursor()
            sql = f"INSERT INTO `producto` (`nombre_producto`, `precio_producto`, `descripcion_producto`, `cantidad_producto`, `categoria_producto`, `imagen_producto`) VALUES ('{producto}', '{precio}', '{descripcion}', '{cantidad}', '{categoria}','{nombre_final}');"
            cursor.execute(sql)
            conexion.connection.commit()
        except Exception as e:
            print("Error MySQL:", str(e))
        return redirect('/')


@app.route('/modificar', methods=['GET', 'POST'])
def modificar():
    id_producto = request.args.get('id_producto')
    tabla = {}
    try:
        cursor = conexion.connection.cursor()
        sql = f"SELECT * FROM producto where idproducto = {id_producto}"
        cursor.execute(sql)
        tabla['producto'] = cursor.fetchone()
        sql = f"SELECT * FROM categoria where id_categoria = {tabla['producto'][5]}"
        cursor.execute(sql)
        tabla['categoria'] = cursor.fetchone()
    except Exception as e:
        print("Error MySQL:", str(e))
    return render_template('modificar.html', tabla=tabla)


@app.route('/confirmar', methods=['POST'])
def confirmar():
    id = request.form.get('id_producto')
    imagen = request.files['archivo']
    if imagen.filename == '':
        nombre_final = request.form.get('imagen_actual')
    else:
        nombre_archivo = secure_filename(imagen.filename)
        tipo_archivo = nombre_archivo.rsplit('.', 1)[1]
        nombre_archivo = nombre_archivo.rsplit('.', 1)[0]
        nombre_modificado = f"{datetime.now().strftime('%Y%m%d%H%M%S')}.{tipo_archivo}"
        nombre_final = nombre_archivo+nombre_modificado
        imagen_vieja = request.form.get('imagen_actual')
        ubicacionvieja = os.path.join("static", imagen_vieja)
        os.remove(ubicacionvieja)
        imagen.save('static/'+nombre_final)
    producto = request.form.get('producto')
    producto = producto.title()
    precio = request.form.get('precio')
    descripcion = request.form.get('descripcion')
    descripcion = descripcion.capitalize()
    cantidad = request.form.get('cantidad')
    categoria = request.form.get('categoria')
    try:
        cursor = conexion.connection.cursor()
        sql = f"UPDATE `imagenes`.`producto` SET `precio_producto` = '{precio}', `nombre_producto` = '{producto}', `descripcion_producto` = '{descripcion}',  `cantidad_producto` = '{cantidad}', `imagen_producto` = '{nombre_final}', `categoria_producto` = '{categoria}' WHERE (`idproducto` = '{id}');"
        cursor.execute(sql)
        conexion.connection.commit()
    except Exception as e:
        print("Error MySQL:", str(e))
    return redirect('/')


@app.route("/")
@app.route("/pagina/<int:pagina>")
def home(pagina=1):
    try:
        cursor = conexion.connection.cursor()
        cantidad = 3
        salto = (pagina - 1) * cantidad
        sql = f"SELECT * FROM producto order by nombre_producto LIMIT {cantidad} OFFSET {salto};"
        cursor.execute(sql)
        articulos = cursor.fetchall()
        cursor.execute("SELECT COUNT(*) FROM producto;")
        total_articulos = cursor.fetchone()[0]
        total_paginas = (total_articulos + cantidad - 1) // cantidad
        if pagina > total_paginas:
            return redirect(f'/{total_paginas}')
    except Exception as e:
        print("Error MySQL:", str(e))
    return render_template('index.html', articulos=articulos, total_paginas=total_paginas, pagina=pagina)


@app.route("/eliminar", methods=['GET', 'POST'])
def eliminar():
    id_producto = request.args.get('id_producto')
    cursor = conexion.connection.cursor()
    sql = f"SELECT imagen_producto FROM producto WHERE idproducto = {id_producto}"
    cursor.execute(sql)
    resultado = cursor.fetchone()
    nombre_imagen = resultado[0]
    sql = f"DELETE FROM producto WHERE idproducto = {id_producto}"
    cursor.execute(sql)
    conexion.connection.commit()
    os.remove(os.path.join('static', nombre_imagen))
    return redirect('/')


@app.route('/<categoria>/id<int:id>/<int:pagina>', methods=['GET', 'POST'])
def filtro_categoria(pagina=1, categoria=None, id=1):
    try:
        cursor = conexion.connection.cursor()
        cantidad = 6
        salto = (pagina - 1) * cantidad
        sql = f"SELECT * FROM producto  where categoria_producto={id} LIMIT {cantidad} OFFSET {salto};"
        cursor.execute(sql)
        articulos = cursor.fetchall()
        sql = f"SELECT COUNT(*) FROM producto where categoria_producto={id};"
        cursor.execute(sql)
        total_articulos = cursor.fetchone()[0]
        total_paginas = (total_articulos + cantidad - 1) // cantidad
        if pagina > total_paginas:
            return redirect(f'/{total_paginas}')
    except Exception as e:
        print("Error MySQL:", str(e))
    return render_template('categorias.html', articulos=articulos, total_paginas=total_paginas, pagina=pagina, categoria=categoria, id=id)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
