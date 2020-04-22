FROM node:lts
RUN apt-get update \
    && apt-get install -y wget --no-install-recommends \
    && apt-get install -y chromium fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -r pptruser \
    && useradd -r -g pptruser -G audio,video pptruser \
    && mkdir -p /home/pptruser/Downloads \
    && mkdir -p /home/pptruser/app/dist/ \
    && chown -R pptruser:pptruser /home/pptruser
USER pptruser
