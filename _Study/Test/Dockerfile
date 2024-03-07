FROM ubuntu:latest

RUN echo "This is the Dockerfile!" && apt-get update && apt-get install -y nginx curl

# EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]