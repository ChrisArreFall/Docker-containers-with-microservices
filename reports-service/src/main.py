from flask import Flask, flash, render_template, redirect, url_for, request, session
from database import Database
import csv


app = Flask(__name__)
app.secret_key = "mys3cr3tk3y"
db = Database()

@app.route('/', methods=['GET'])
def index():
    return "Hello World!"



@app.route('/getCSV/<inicio>/<final>/', methods=['GET'])
def update(inicio,final):
    data = db.read(inicio,final)
    print('Hello world!', file=sys.stderr)
    return data


@app.errorhandler(404)
def page_not_found(error):
    return Null

if __name__ == '__main__':
    app.run(port=8181, host="0.0.0.0")