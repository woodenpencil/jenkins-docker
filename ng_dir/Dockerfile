FROM nginx
COPY content /usr/share/nginx/
COPY default.conf /etc/nginx/conf.d/default.conf
#COPY letsencrypt /etc/letsencrypt
COPY nginx.conf /etc/nginx/nginx.conf
RUN apt-get update && apt-get install -y sysstat
COPY scr.sh /usr/bin/scr.sh
CMD ["bash","/usr/bin/scr.sh","&"]
