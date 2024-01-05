import sqlite3

conn = sqlite3.connect('../CarbonFootprint.db')
c = conn.cursor()
c.execute("SELECT * FROM World")
rows = c.fetchall()
rows
print(rows[0])
