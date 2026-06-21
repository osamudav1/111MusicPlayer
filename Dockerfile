FROM python:3.11-slim

# Updating Packages
RUN apt update && apt upgrade -y

# Install dependencies
RUN apt install -y git curl ffmpeg

# Copying Requirements
COPY requirements.txt /requirements.txt

# Installing Requirements
RUN pip3 install --upgrade pip
RUN pip3 install -U -r /requirements.txt

# Setting up working directory
WORKDIR /MusicPlayer
RUN mkdir -p /MusicPlayer

# Copy startup script
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

# Run bot
CMD ["/bin/bash", "/startup.sh"]
