# import the connect method
from mysql.connector import connect
 
# define a connection object
conn = connect(option_files =
  '/home/momo/PYTHON/SQL_Python/connection.cfg')
 
# verify the connection information
print('The user ' + conn.user + ' is connected to the '
       + conn.database + ' database.')
 

# variables for SQL query
# no need to select the database / use = 'USE SockWorld'
select_all = 'SELECT * FROM Suspects;'

# variable :  select all the lost socks
match_id_null = 'SELECT SockID FROM Socks WHERE MatchID is NULL;'

# Variable : Count the number of lost socks
count_matchID_null = 'SELECT COUNT(*) FROM Socks WHERE MatchID is NULL'

# Variable : Count lost socks by colors 
lost_colors = 'SELECT color, COUNT(*) FROM Socks WHERE MatchID is NULL GROUP BY color'

# Variable : Liste et trie les suspects en fonction des ordres d'apparition 
suspect_list = 'SELECT Name, COUNT(SightingDate) AS "Nombre d apparition" FROM SockSightings INNER JOIN Suspects ON SockSightings.SuspectID = Suspects.SuspectID GROUP BY Name ORDER BY "Nombre d apparition" DESC'

# Variable : Number of disapearence per day
missing_per_day = 'SELECT COUNT(SightingDate) AS "Nombre de disparition", DAYNAME(SightingDate) AS date FROM SockSightings GROUP BY date'

# List of all the variables
list = [match_id_null, count_matchID_null, lost_colors, suspect_list, missing_per_day]

# open cursor, define and run query, fetch results
cursor = conn.cursor()
#cursor.execute(missing_per_day)
#result = cursor.fetchall()

def parcours(list):
    for l in (list):
        cursor.execute(l)
        result = cursor.fetchall()
        for o in result:
            print(o)
        print("--------------------------------------")
        

    # close the database connection
    cursor.close()
    conn.close()
    
parcours(list)
