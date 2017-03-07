#!/bin/bash
dbuser="root"
dbpass="root"
dbhost="db"
dbaccess="denied"
echo "MySQL baglantisi bekleniyor..."
until [[ $dbaccess = "success" ]]; do
  mysql --user="${dbuser}" --password="${dbpass}" --host="${dbhost}" -e exit 2>/dev/null
  dbstatus=`echo $?`
  if [ $dbstatus -ne 0 ]; then
    dbaccess="denied"
    sleep 1
  else
    dbaccess="success"
    dbaccess="MySQL baglantisi kuruldu."
    echo "Success!"
    break
  fi
done
