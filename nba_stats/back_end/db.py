from flask import Flask, request, jsonify
from flask_cors import CORS
import mysql.connector
from datetime import datetime

#flask constructor
app = Flask(__name__)
CORS(app)

@app.route('/input_handler', methods=['GET', 'POST'])
def input_handler():
    if request.method == 'POST':
        # Handle POST request
        data = request.json
        print(data)

        id = data.get('id')

        if id == '1':
            response = jsonify(insert_game(data))
        elif id == '2':
            response = jsonify(insert_player(data))
        elif id =='3':
            response = jsonify(view_players_by_team(data))
        elif id == '4':
            response = jsonify(view_players_by_pos(data))
        elif id == '5':
            response = jsonify(view_conf_standings(data))
        # elif id == '6':
        #     view_team_games(data)
        # elif id == '7':
        #     games_by_date(data)
        # elif id == '8':
        #     matchups(data)

        else: 
            response = jsonify({'message': 'Received POST request'})
        response.headers.add('Access-Control-Allow-Origin', 'https://csce.uark.edu')
        return response, 200
    

#mysql connnector
def open_database(hostname, user_name, mysql_pw, database_name):
    global conn
    conn = mysql.connector.connect(host=hostname,
                                   user=user_name,
                                   password=mysql_pw,
                                   database=database_name
                                   )
    global cursor
    cursor = conn.cursor()


#query functions
def insert_game(data):
    #unpack data
    team1 = int(data.get('team1'))+1
    team2 = int(data.get('team2'))+1
    score1 = int(data.get('score1'))
    score2 = int(data.get('score2'))
    date = data.get('date')

    #create query 
    query = f"""
insert into Game(team1, team2, score1, score2, date) value
({team1}, {team2}, {score1}, {score2}, '{date}'); 
"""

    #execute query 
    cursor.execute(query)
    conn.commit()

    #execute select games 
    query = """
select t1.name AS home_team, t2.name AS away_team, g.score1, g.score2, g.date
from Game g
inner join Team t1 ON g.team1 = t1.teamId
inner join Team t2 ON g.team2 = t2.teamId;
"""
    cursor.execute(query)
    result = cursor.fetchall()

    #format results
    formatted_results = []
    for item in result:
        formatted_item = {
            'team1': item[0],
            'team2': item[1],
            'score1': item[2],
            'score2': item[3],
            'date': item[4].strftime('%Y-%m-%d')  # Format date as string
        }
        formatted_results.append(formatted_item)
    
    return formatted_results

def insert_player(data):
    #unpack data
    teamId = int(data.get('teamId'))+1
    name = data.get('name')
    number = data.get('number')
    position = data.get('position')

    #create query 
    query = f"""
insert into Player(teamId, name, number, position) value
({teamId}, '{name}', '{number}', '{position}'); 
"""

    #execute query 
    cursor.execute(query)
    conn.commit()

    #execute select players 
    query = "select * from Player;"
    cursor.execute(query)
    result = cursor.fetchall()

    #format results
    formatted_results = []
    for item in result:
        formatted_item = {
            'teamId': item[0],
            'name': item[1],
            'number': item[2],
            'position': item[3]
        }
        formatted_results.append(formatted_item)
    
    return formatted_results

def view_players_by_team(data):
    #unpack data 
    teamId = int(data.get('teamId'))+1

    #create query 
    query = f"""
select Player.name, Player.number, Player.position
from Player
where Player.teamId = {teamId};
"""

    #execute query
    cursor.execute(query)
    result = cursor.fetchall()
    
    #format results
    formatted_results = []
    for item in result:
        formatted_item = {
            'name': item[0],
            'number': item[1],
            'position': item[2]
        }
        formatted_results.append(formatted_item)
    
    return formatted_results

def view_players_by_pos(data):
    #unpack data 
    position = data.get('position')

    #create query 
    query = f"""
select Team.name, Player.name, Player.number
from Player
join Team on Team.teamId = Player.teamId
where Player.position = {position.lower()};
"""

    #execute query
    cursor.execute(query)
    result = cursor.fetchall()
    
    #format results
    formatted_results = []
    for item in result:
        formatted_item = {
            'team_name': item[0],
            'name': item[1],
            'number': item[2]
        }
        formatted_results.append(formatted_item)
    
    return formatted_results

def view_conf_standings(data):
    #unpack data 
    conference = data.get('conference')

    #create query 
    query = f"""
select t.name as Team, 
sum(case when (g.team1 = t.teamId and g.score1 > g.score2) or (g.team2 = t.teamId and g.score2 > g.score1) then 1 else 0 end) as Wins,
sum(case when (g.team1 = t.teamId and g.score1 < g.score2) or (g.team2 = t.teamId and g.score2 < g.score1) then 1 else 0 end) as Losses 
from Team t 
join Game g on t.teamId = g.team1 or t.teamId = g.team2 
where t.conference = '{conference}ern' group by t.name
order by Wins desc;
"""

    #execute query
    cursor.execute(query)
    result = cursor.fetchall()
    
    #format results
    formatted_results = []
    for item in result:
        formatted_item = {
            'team_name': item[0],
            'wins': item[1],
            'losses': item[2]
        }
        formatted_results.append(formatted_item)
    
    return formatted_results

def view_team_games(data):
    None

def games_by_date(data):
    None

def matchups(data):
    None

mysql_username = 'ejs022'  
mysql_password = 'Ra4aeShi'  

open_database('localhost', mysql_username, mysql_password, mysql_username)

# insert_game({'team1': '01', 'team2': '11', 'score1': '114', 'score2': '115', 'date': '2024-04-23'})
# insert_player({'teamId': '19', 'name': 'tingus pingus', 'number': '7', 'position': 'C'})
# view_players_by_team({'teamId': '0'})

# Start with flask web app with debug as
# True only if this is the starting page
if(__name__ == "__main__"):
    app.run(port=8987, debug=True)
