import sqlite3
conn = sqlite3.connect('/Users/julie/Desktop/local_code/LOCAL_job_10_DB/app/app_CarbonFootprint.db')
c = conn.cursor()
# c.execute("SELECT name FROM sqlite_master WHERE type='table';")
c.execute("SELECT * FROM World")
rows = c.fetchall()
rows
print(rows[0])
