from flask import Flask, flash, render_template, redirect, url_for, request, session, jsonify
from database import Database
import csv


app = Flask(__name__)
app.secret_key = "mys3cr3tk3y"
db = Database()


@app.route('/', methods=['GET'])
def index():
    return "Hello World!"


@app.route('/getCSV/<inicio>/<final>/', methods=['GET'])
def update(inicio, final):
    data = db.read(inicio, final)
    si = StringIO.StringIO()
    cw = csv.writer(si)
    cw.writerows(data)
    output = make_response(si.getvalue())
    output.headers["Content-Disposition"] = "attachment; filename=export.csv"
    output.headers["Content-type"] = "text/csv"
    return output
    # return jsonify(data)


@app.errorhandler(404)
def page_not_found(error):
    return None


if __name__ == '__main__':
    app.run(port=8181, host="0.0.0.0")
