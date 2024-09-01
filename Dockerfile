FROM ubuntu:24.04
#Installing python
RUN apt update -y
RUN apt install python3 -y
RUN apt install python3-pip -y
# Switching workdir
WORKDIR /opt/app

# Copying code
COPY btc-app . 
# Packages will be used only once
RUN python3 -m pip install --no-cache-dir --break-system-packages -r requirements.txt

# Exposing a port
EXPOSE 8080

# Running a server
CMD ["python3", "waitress_server.py"]