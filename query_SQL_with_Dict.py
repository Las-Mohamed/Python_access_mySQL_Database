
# import the connect method
from mysql.connector import connect
 
# define a connection object
conn = connect(option_files =
  '/home/momo/PYTHON/SQL_Python/connection.cfg')
 
# verify the connection information
print('The user ' + conn.user + ' is connected to the '
       + conn.database + ' database.')
 

# variables for SQL query
# no need to select database / use = 'USE SockWorld'
select_all = 'SELECT * FROM Suspects;'

# variable :  select all the lost socks
match_id_null = 'SELECT SockID FROM Socks WHERE MatchID is NULL;'

# Variable : Count the number of lost socks
count_matchID_null = 'SELECT COUNT(*) FROM Socks WHERE MatchID is NULL'

# Variable : Count lost socks by colors 
lost_colors = 'SELECT color, COUNT(*) FROM Socks WHERE MatchID is NULL GROUP BY color'

# Variable : List and sort suspects based on appearance order
suspect_list = 'SELECT Name, COUNT(SightingDate) AS "Nombre d apparition" FROM SockSightings INNER JOIN Suspects ON SockSightings.SuspectID = Suspects.SuspectID GROUP BY Name ORDER BY "Nombre d apparition" DESC'

# Variable : Number of disappearance per day
missing_per_day = 'SELECT COUNT(SightingDate) AS "Nombre de disparition", DAYNAME(SightingDate) AS date FROM SockSightings GROUP BY date'

# Dictionnaire Key = variable SQL, value = Description
my_dict = {
   match_id_null : "All of the lost socks",
   count_matchID_null : "Count the number of lost socks",
   lost_colors : "Count lost socks by colors ",
   suspect_list : "List and sort suspects based on appearance orders",
   missing_per_day : "Number of disappearance per day"
}

# transformation of dictionnary in lists
list_of_SQL_commands = list(my_dict.keys())
list_of_description = list(my_dict.values())


# Fonction that will execute SQL commands in our database
def parcours(list):
  
  cursor = conn.cursor()
    
  for (l, a) in zip(list, list_of_description):
      cursor.execute(l)
      result = cursor.fetchall()
      print("------------", a, "------------------")
      for o in result :   
        print(o)

  # close the database connection / cursor
  cursor.close()
  conn.close()
    
parcours(list_of_SQL_commands)
