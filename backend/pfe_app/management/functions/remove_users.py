def removeUsers(cursor):
    cursor.execute('DELETE FROM pfe_app_user;')