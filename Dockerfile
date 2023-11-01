FROM mcr.microsoft.com/playwright:v1.35.0-jammy
WORKDIR /usr/src/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
RUN npx playwright install
RUN npm install -g typescript
COPY tsconfig.json ./tsconfig.json
COPY src ./src
RUN ls -lR
RUN tsc
RUN rm -rf ./src ./tsconfig.json
COPY . .
EXPOSE 3000
CMD ["npm", "start"]
