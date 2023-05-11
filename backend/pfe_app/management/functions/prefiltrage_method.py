def prefiltrageMethod(cursor):
    cursor.execute("UPDATE pfe_app_user SET if_transmit=1 WHERE date(date_of_contamination) >= date('now', '-6 days');")
    