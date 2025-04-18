# 빌드 단계: Node.js 환경에서 빌드
FROM node:lts-alpine AS builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# 배포 단계: Nginx (또는 다른 웹 서버) 환경
FROM nginx:stable-alpine

# 빌드 단계에서 생성된 빌드 결과물을 복사
COPY --from=builder /app/build /usr/share/nginx/html

# Nginx 설정 파일 (필요한 경우)
# COPY ./nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]