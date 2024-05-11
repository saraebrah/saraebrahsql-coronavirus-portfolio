import psycopg2
from config import config_func

def connect():
    connection = None
    try:
        params = config_func()
        print('Connectiong to the postgresSQL database ...')
        connection = psycopg2.connect(**params)

        # create a cursor
        crsr = connection.cursor() 
        print('PostgresSQL database version: ')
        crsr.execute('SELECT version()')
        db_version = crsr.fetchone()
        print(db_version)   
        crsr.close
    except(Exception, psycopg2.DatabaseError) as error:
        print(error)
    finally:
        if connection is not None:
            connection.close
            print('Database connection terminated')
if __name__ == "__main__":
    connect()