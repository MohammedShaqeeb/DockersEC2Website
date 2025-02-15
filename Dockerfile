FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://bootstrapmade.com/content/templatefiles/Nova/Nova.zip .
RUN unzip Nova.zip
RUN mv Nova/* .
RUN rm -rf Nova Nova.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
