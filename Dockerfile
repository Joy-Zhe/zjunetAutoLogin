FROM python:3.11-buster

RUN apt-get update

RUN apt-get install -y \
    wget \
    unzip \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcairo2 \
    libcups2 \
    libcurl3-gnutls \
    libdbus-1-3 \
    libdrm2 \
    libexpat1 \
    libgbm1 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libpango-1.0-0 \
    libvulkan1 \
    libx11-6 \
    libxcb1 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxkbcommon0 \
    libxrandr2 \
    xdg-utils \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    apt-get --fix-broken install ./google-chrome-stable_current_amd64.deb && \
    rm google-chrome-stable_current_amd64.deb

RUN CHROMEDRIVER_VERSION=$(google-chrome-stable --version | cut -d ' ' -f 3) && \
    echo "Chromedriver version: $CHROMEDRIVER_VERSION" && \
    wget -q "https://storage.googleapis.com/chrome-for-testing-public/${CHROMEDRIVER_VERSION}/linux64/chromedriver-linux64.zip" -O chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip && \
    mv chromedriver /usr/bin/chromedriver && \
    chmod +x /usr/bin/chromedriver && \
    rm chromedriver_linux64.zip

COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt

COPY zjunetAutoLogin.py /app/zjunetAutoLogin.py
COPY checkNet.sh /app/checkNet.sh

RUN chmod +x /app/checkNet.sh

ENV STUDENT_ID="<Your StudentID>"
ENV STUDENT_PWD="<Your ZJUnetPassword>"

ENTRYPOINT ["/app/checkNet.sh"]
