FROM python:3.11-slim

# System packages
RUN apt update && apt upgrade -y
RUN apt install -y git curl ffmpeg

# Workdir FIRST (important)
WORKDIR /MusicPlayer

# Copy project files
COPY . /MusicPlayer

# Install Python dependencies
RUN pip3 install --upgrade pip
RUN pip3 install -U -r requirements.txt

# Make startup script executable (if exists)
RUN if [ -f startup.sh ]; then chmod +x startup.sh; fi

# Start bot safely (NO startup.sh dependency risk)
CMD ["bash", "-c", "python3 main.py || python3 bot.py"]
