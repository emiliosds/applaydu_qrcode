import os
import segno
from flask import Flask, render_template

app = Flask(__name__)

URL = os.getenv('URL', 'https://qr.kinder.com')

@app.route("/")
def home():
    return render_template('home.html')

@app.route('/qr/<string:codigo>')
def qr(codigo):
    url = f'{URL}/{codigo}'
    qrcode = segno.make(url)
    return render_template('qrcode.html', qrcode=qrcode)