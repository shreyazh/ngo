from flask import Flask, render_template, request
import csv

app = Flask(__name__)

@app.route('/')
def index():
    return render_template('funds.html')

@app.route('/store_fund_data', methods=['POST'])
def store_fund_data():
    name = request.form['name']
    email = request.form['email']
    amount = request.form['amount']
    message = request.form['message']

    with open('fund_data.csv', 'a', newline='') as csvfile:
        writer = csv.writer(csvfile)
        writer.writerow([name, email, amount, message])

    return 'Thank you for your contribution!'

if __name__ == '__main__':
    app.run()
