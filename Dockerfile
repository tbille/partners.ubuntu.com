FROM ubuntudesign/python-auth

# System dependencies
RUN apt-get update && apt-get install -y graphviz-dev

# Pip requirements files
ADD requirements /requirements

# Install pip requirements
RUN pip install -r /requirements/dev.txt

ADD . /app
WORKDIR /app

CMD DATABASE_URL=`echo $POSTGRES_PORT | sed 's|tcp://|postres://postgres@|'`/postgres python manage.py runserver 0.0.0.0:5000
