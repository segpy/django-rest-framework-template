#!/bin/sh

# apply database migrations
echo "---apply database migrations---"
/root/env/bin/python manage.py migrate

# runserver
echo "---run server---"
/root/env/bin/python manage.py runserver 0.0.0.0:8000
