FROM node:18-alpine
WORKDIR /app
COPY package.json .
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
ENV NVM_DIR=/root/.nvm
RUN bash -c "source $NVM_DIR/nvm.sh && nvm install 18"
ENTRYPOINT ["bash","-c","source $NVM_DIR/nvm.sh && exec \"$@\"", "--"]
CMD ["/bin/bash"]
RUN npm install
COPY . .
EXPOSE 3000
CMD ["node", "app.js"]
