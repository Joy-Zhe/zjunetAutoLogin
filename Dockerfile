FROM python:3.11-slim

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb || apt-get -fy install && \
    rm google-chrome-stable_current_amd64.deb

COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

COPY zjunetAutoLogin.py /app/zjunetAutoLogin.py

ENV STUDENT_ID="<Your StudentID>"
ENV STUDENT_PWD="<Your ZJUnetPassword>"

CMD ["python", "/app/zjunetAutoLogin.py"]
