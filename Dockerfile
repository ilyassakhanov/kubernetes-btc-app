FROM tiangolo/uwsgi-nginx-flask:python3.8-alpine
# Switching workdir
WORKDIR /opt/app

# Copying code
COPY btc-app . 

RUN pip install --no-cache-dir -r requirements.txt

# Exposing a port
EXPOSE 5000

# Running a server
CMD ["python3", "-m", "flask", "run", "--host=0.0.0.0"]