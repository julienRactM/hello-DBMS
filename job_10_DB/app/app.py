# hewer go
a = 2+2
print(a)


from flask import Flask, render_template
import sqlite3

app = Flask(__name__)

# Path to your SQLite database file
DATABASE = '../CarbonFootprint.db'

def query_database(query):
    conn = sqlite3.connect(DATABASE)
    cur = conn.cursor()
    cur.execute(query)
    data = cur.fetchall()
    conn.close()
    return data

@app.route('/')
def index():
    # Example query
    query_result = query_database("SELECT * FROM World;")
    return render_template('index.html', data=query_result)

if __name__ == '__main__':
    app.run(debug=True)
