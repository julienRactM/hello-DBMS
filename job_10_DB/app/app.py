from flask import Flask, render_template, request
import sqlite3

app = Flask(__name__)

# Path to your SQLite database file
DATABASE = 'app_CarbonFootprint.db'
# DATABASE = '../local_CarbonFootprint.db'

def query_database(query):
    try:
        conn = sqlite3.connect(DATABASE)
        c = conn.cursor()
        c.execute(query)
        data = c.fetchall()
        conn.close()
        return data
    except sqlite3.Error as e:
        return f"An error occurred: {e}"

@app.route('/')
def index():    
    query_results = []
    cols_list = []
    titles = []
    comments = []
    
    
    table_name = 'World'
    # --
    query_results.append(query_database(f"SELECT * FROM {table_name}"))
    cols_list.append(query_database(f"PRAGMA table_info({table_name});"))
    titles.append("Empreinte carbonne par continent")
    comments.append(0)
    
    table_name = 'Country'
    # --
    query_results.append(query_database(f"SELECT * FROM {table_name} LIMIT 3"))
    cols_list.append(query_database(f"PRAGMA table_info({table_name});"))
    titles.append("Tableau de l'empreinte carbonne par pays se présentant ainsi")
    comments.append(0)
    
    
    table_name = 'World'
    # --
    query_results.append(query_database(f"SELECT * FROM {table_name} \
        WHERE Gas = (SELECT MAX(Gas) FROM {table_name}) OR \
        Gas = (SELECT MIN(Gas) FROM {table_name});"))
    
    cols_list.append(query_database(f"PRAGMA table_info({table_name});"))
    titles.append("Min/Max des émissions carbonnes par Régions")
    comments.append("Il est intéressant de voir que les sources d'énergies à l'origine de ces émissions \
        changent grandement d'une région d'Afrique à l'autre")


    return render_template('index.html', query_results=query_results, cols = cols_list,\
        titles = titles, comments = comments, active_tab='home')

@app.route('/(5.)')
def QFive_index():    
    query_results = []
    cols_list = []
    comments = []
    table_name = 'Country'
    # --
    gCO2_dict = {
        'min' :    [740, 410, 620, 1, 26, 3.7],
        'median' : [820, 490, 740, 24, 41, 12],
        'max' :    [910, 650, 890, 2200, 60, 110]      
    }
    
    #would be nice to have a select with target choice
    target = 'median'
    query_results.append(query_database(f"""
    SELECT
        Country, 
        ROUND(((Coal)*{gCO2_dict[target][0]})/((Coal/100)*{gCO2_dict[target][0]}+(Gas/100)*{gCO2_dict[target][1]}+(Oil/100)*
        {gCO2_dict[target][2]}+(Hydro/100)*{gCO2_dict[target][3]}+(Renewable/100)*{gCO2_dict[target][4]}+(Nuclear/100)*{gCO2_dict[target][5]}),2),
        ROUND(((Gas)*{gCO2_dict[target][1]})/((Coal/100)*{gCO2_dict[target][0]}+(Gas/100)*{gCO2_dict[target][1]}+(Oil/100)*
        {gCO2_dict[target][2]}+(Hydro/100)*{gCO2_dict[target][3]}+(Renewable/100)*{gCO2_dict[target][4]}+(Nuclear/100)*{gCO2_dict[target][5]}),2),
        ROUND(((Oil)*{gCO2_dict[target][2]})/((Coal/100)*{gCO2_dict[target][0]}+(Gas/100)*{gCO2_dict[target][1]}+(Oil/100)*
        {gCO2_dict[target][2]}+(Hydro/100)*{gCO2_dict[target][3]}+(Renewable/100)*{gCO2_dict[target][4]}+(Nuclear/100)*{gCO2_dict[target][5]}),2),
        ROUND(((Hydro)*{gCO2_dict[target][3]})/((Coal/100)*{gCO2_dict[target][0]}+(Gas/100)*{gCO2_dict[target][1]}+(Oil/100)*
        {gCO2_dict[target][2]}+(Hydro/100)*{gCO2_dict[target][3]}+(Renewable/100)*{gCO2_dict[target][4]}+(Nuclear/100)*{gCO2_dict[target][5]}),2),
        ROUND(((Renewable)*{gCO2_dict[target][4]})/((Coal/100)*{gCO2_dict[target][0]}+(Gas/100)*{gCO2_dict[target][1]}+(Oil/100)*
        {gCO2_dict[target][2]}+(Hydro/100)*{gCO2_dict[target][3]}+(Renewable/100)*{gCO2_dict[target][4]}+(Nuclear/100)*{gCO2_dict[target][5]}),2),
        ROUND(((Nuclear)*{gCO2_dict[target][5]})/((Coal/100)*{gCO2_dict[target][0]}+(Gas/100)*{gCO2_dict[target][1]}+(Oil/100)*
        {gCO2_dict[target][2]}+(Hydro/100)*{gCO2_dict[target][3]}+(Renewable/100)*{gCO2_dict[target][4]}+(Nuclear/100)*{gCO2_dict[target][5]}),2)
    FROM {table_name}"""))
    
    cols_list.append(query_database(f"PRAGMA table_info({table_name});"))

    title = "Empreinte carbonne par Pays"
    comments.append(0)

    return render_template('simple.html', query_results=query_results[0], cols = cols_list[0],\
        title = title, comments = comments[0], active_tab='(5.)')

@app.route('/filter', methods=['GET', 'POST'])
def filter_query():
    
    titles = []
    table_name = 'Country'
    cols = query_database(f"PRAGMA table_info({table_name});")
    
    countries = query_database("SELECT Country FROM Country") 
    countries = [country[0] for country in countries] 
    world_regions = query_database("SELECT Region FROM World")  
    world_regions = [region[0] for region in world_regions] 
    select_options =  world_regions + countries
    title = "Filtration par pays"
    
    if request.method == 'POST':
        selected_opt = request.form['select_opts']
        if selected_opt in world_regions:
            query_result = query_database(f"SELECT * FROM World WHERE Region = '{selected_opt}';")
        else :
            query_result = query_database(f"SELECT * FROM Country WHERE Country = '{selected_opt}';")

    else : 
        query_result = query_database(f"SELECT * FROM World WHERE Region = 'World';")
    return render_template('custom.html', query_result=query_result, select_options=select_options, cols = cols, active_tab = 'filter', \
        titles = title)

    

@app.route('/filter_table', methods=['GET', 'POST'])
def filter_table():
    titles = []
    comments = []
    total_ft = 0
    consumed_e = "1"
    country_value = 'Albania'
    
    countries = query_database("SELECT Country FROM Country") 
    countries = [country[0] for country in countries] 
    select_options = countries
    
    median = [820, 490, 740, 24, 41, 12]
    rows_name = ['Charbon', 'Gaze Naturel', 'Pétrole', 'Hydro', 'Renouvelable', 'Nucléaire']
    cols = ['Source de production', '% d\'utilisation', 'Médiane de gCO2/kWh', 'Contribution en émission gCO2/kWh']

    if request.method == 'POST':
        selected_opt = request.form['select_opts']
        country_value = selected_opt
        
        if request.form['kw-hours'] :
            consumed_e = request.form['kw-hours']
        titles = selected_opt
        if selected_opt in countries:
            query_result = query_database(f"SELECT * FROM Country WHERE Country = '{selected_opt}';")[0] 

    else :
        titles = 'Albania'
        query_result = query_database(f"SELECT * FROM Country WHERE Country = 'Albania';")[0]
    
    for i in range(6):
        total_ft += round(query_result[i+1]*median[i]/100)
    comments.append(f"(8.) Emission totale : {total_ft}")
    yearly_ft = round(total_ft/1000*24*365*int(consumed_e), 1)
    comments.append(f"(9.) Emission annuelle totale pour une consommation continue de {consumed_e}kw : {yearly_ft} (kg of CO2)")
    comments.append(f"(10.) Nombre d'arbres nécessaires  pour compenser les émissions de CO2: {(yearly_ft//25)+1} (≈ {yearly_ft/25})")
    
    return render_template('custom.html', query_result=query_result, select_options=select_options, \
        cols = cols, active_tab = 'filter_table', median = median, rows_name = rows_name, \
        titles = titles, total_ft = total_ft, comments = comments, consumed_e=consumed_e, \
        country_value=country_value)




@app.route('/world')
def world_index():    

    table_name = 'World'
    query = f"SELECT * FROM {table_name}"
    query_result = query_database(query) 
    cols = query_database(f"PRAGMA table_info({table_name});")
    title = "Empreinte carbonne par continent"

    # if isinstance(query_result, str):
    #     # If there's an error, display the error message
    #     return query_result
    return render_template('simple.html', query_results=query_result, cols = cols, title=title, active_tab='world')
 
@app.route('/country')
def country_index():
     
    table_name = 'Country'
    query = f"SELECT * FROM {table_name}"
    query_result = query_database(query) 
    cols = query_database(f"PRAGMA table_info({table_name});")
    title = "Tableau de l'empreinte carbonne par pays"
    
    return render_template('simple.html', query_results=query_result, cols = cols, title=title, active_tab='country')


if __name__ == '__main__':
    app.run(debug=True)

# -------------------------------------------------------------------------------------------

