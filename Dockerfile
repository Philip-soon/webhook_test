FROM node:lts-alpine

WORKDIR /app

COPY build .

# 필요한 경우 추가적인 설정 (예: 환경 변수 설정)

EXPOSE 3000

CMD [ "node", "index.js" ]