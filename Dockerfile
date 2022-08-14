FROM ubuntu:18.04
# Copying code
ADD btc-app my_files

WORKDIR my_files
# Running updates
RUN apt update
RUN apt upgrade -y
# Installing python runtime and packet manager
RUN apt install python3 -y
RUN apt install python3-pip -y
# Installing dependencies for ther code
RUN pip3 install -r requirements.txt

# Exposing a port
EXPOSE 5000/tcp

# Running a server
ENTRYPOINT python3 fetch_btc.py