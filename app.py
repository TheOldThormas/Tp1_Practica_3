from flask import Flask, render_template, request, redirect
from flask_mysqldb import MySQL
from werkzeug.utils import secure_filename
from datetime import datetime

app = Flask(__name__)

app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='julian'
app.config['MYSQL_PASSWORD']='123456789'
app.config['MYSQL_DB']='imagenes'
conexion=MySQL(app)

@app.route('/')
def productos():
    return render_template('index.html')

@app.route('/subir', methods=['POST'])
def subir_archivo():
    if 'archivo' not in request.files:
        return 'ningún archivo'
    imagen = request.files['archivo']
    if imagen.filename == '':
        return 'ningún archivo'
    if imagen: #Acordarse de poner los .title en cada captura del formulario para que queden los nombres con mayusculas
        nombre_archivo=secure_filename(imagen.filename)
        tipo_archivo=nombre_archivo.rsplit('.', 1)[1]
        nombre_archivo=nombre_archivo.rsplit('.', 1)[0]
        nombre_modificado=f"{datetime.now().strftime('%Y%m%d%H%M%S')}.{tipo_archivo}"
        nombre_final=nombre_archivo+nombre_modificado
        imagen.save('static/'+nombre_final)
        try:
            cursor=conexion.connection.cursor()
            sql=f"INSERT INTO `producto` (`imagen_producto`) VALUES ('{nombre_final}');" #La consulta necesita que se le agregue el resto de columnas(nombre ,desc ,etc)
            cursor.execute(sql)
            conexion.connection.commit()
        except Exception as e:
            print("Error MySQL:", str(e))
        return redirect('/imagenes')
    
@app.route("/imagenes")
def imagenes():
    try:
        cursor=conexion.connection.cursor()
        sql="SELECT * FROM producto"
        cursor.execute(sql)
        tabla=cursor.fetchall()
    except Exception as e:
        print("Error MySQL:", str(e))
    return render_template('imagenes.html',tabla=tabla)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)