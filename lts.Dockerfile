FROM node:lts
ARG USER_ID=999
ARG GROUP_ID=999
ENV USER_ID=${USER_ID} \
    GROUP_ID=${GROUP_ID}

RUN apt-get update \
    && apt-get install -y wget --no-install-recommends \
    && apt-get install -y \
    libatk-bridge2.0-0 \
    libgtk-3.0 \
    libgbm1 \
    libgbm-dev \
    chromium \
    fonts-ipafont-gothic \
    fonts-wqy-zenhei \
    fonts-thai-tlwg \
    fonts-kacst \
    fonts-freefont-ttf \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -r pptruser -g 999 \
    && useradd -r -u 999 -g pptruser -G audio,video pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && mkdir -p /home/pptruser/app/dist/ \
    && chown -R pptruser:pptruser /home/pptruser

USER pptruser
