# Version 0.0.2
user ubuntu;
worker_processes 1;
pid /run/nginx.pid;
include /etc/nginx/modules-enabled/*.conf;
events {
        worker_connections 512;
        # multi_accept on
       }
# This block of code tells NGINX to act as an RTMP server.
rtmp {
    access_log /var/log/nginx/rtmp-access.log;

    server {

    listen 1935;
    # The size of each chunk of data that will be sent.
    # Flash Player will freeze if the chunk is too small,
    # which can cause a buffer-underflow condition.
    chunk_size 8192;
    # ADD Values from old template RADIOS used for NED into AWS.
    max_message 1M;     
    buflen 3000ms;  
    meta copy;

    ping 10s;
    drop_idle_publisher 3s;


    # The IP addresses are allowed to publish content to the server.
    # Allow only the localhost to publish content on NGINX RTMP.
    allow publish 127.0.0.1;
    # Deny publishing for everyone else.
    # deny publish all;

    # Defines a named application called "live"
    application live {
        # Tells NGINX to enable live streams for your users.
        live on;

        # Push to MP3 stream on icecast2.
        exec_push ffmpeg -nostdin -re -i rtmp://localhost:1935/live/$name -vn -c:a libmp3lame -f mp3 -content_type audio/mpeg icecast://source:ned12345@localhost:8000/$name.mp3;

        # Push to HLS stream trought FFMPEG -f HLS. 
        exec_push ffmpeg -nostdin -re -i rtmp://localhost:1935/live/$name -vn -c:a copy -f hls -hls_time 3 -hls_list_size 4 -hls_wrap 60 -hls_delete_threshold 1 -hls_flags delete_segments -hls_start_number_source datetime -preset superfast -start_number 10 -hls_segment_filename /home/ubuntu/hls/stream-%02d.aac /home/ubuntu/hls/main.m3u8;

        # This line tells NGINX to disable recording. If this line is not included,
        # NGINX will keep recording and save your stream forever to your disk.
        record off;
        # Turn on HLS
        hls on;
        hls_path /home/ubuntu/hls;
        hls_fragment 3;
        hls_playlist_length 60;
        }
    }
}
http {

    ##
    # Basic Settings
    ##

    sendfile on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 65;
    types_hash_max_size 2048;
    # server_tokens off;

    # server_names_hash_bucket_size 64;
    # server_name_in_redirect off;

    
    
#    aio on;
    directio 512;
    default_type application/octet-stream;

    ##
    # Logging Settings
    ##

    access_log /var/log/nginx/access.log;
    error_log /var/log/nginx/error.log;

    ##
    # Gzip Settings
    ##

    gzip on;
    gzip_disable "msie6";
    gzip_vary on;
    gzip_proxied any;
    gzip_comp_level 6;
    gzip_buffers 16 8k;
    gzip_http_version 1.1;
    gzip_types
        text/plain
        text/css
        application/json
        application/x-javascript
        text/xml
        application/xml
        application/xml+rss
        text/javascript
        application/vnd.apple.mpegurl
        audio/x-mpegurl
    ;

    server {
        listen 80;

        location / {
            # Disable cache
            add_header 'Cache-Control' 'no-cache';

            # CORS setup
            add_header 'Access-Control-Allow-Origin' '*' always;
            add_header 'Access-Control-Expose-Headers' 'Content-Length';

            # allow CORS preflight requests
            if ($request_method = 'OPTIONS') {
                add_header 'Access-Control-Allow-Origin' '*';
                add_header 'Access-Control-Max-Age' 1728000;
                add_header 'Content-Type' 'text/plain charset=UTF-8';
                add_header 'Content-Length' 0;
                return 204;
            }

            types {
                application/dash+xml mpd;
                application/vnd.apple.mpegurl m3u8;
                video/mp2t ts;
            }

            root /home/ubuntu/hls;
        }
        listen       8080;
        server_name  localhost;
            location /index.html {
                root /home/ubuntu/stat;
            }   

            # rtmp stat
            location /stat {
                rtmp_stat all;
                rtmp_stat_stylesheet stat.xsl;
            }

            location /stat.xsl {
                # you can move stat.xsl to a different location
                root /home/ubuntu/stat;
            }

            location /stat.json {
                proxy_pass       http://localhost/stat.xml;
                xml_entities     /home/ubuntu/stat/entities.dtd;
                xslt_stylesheet  /home/ubuntu/stat/xml2json.xslt;
            }

            # rtmp control
            location /control {
                rtmp_control all;
            }

            error_page   500 502 503 504  /50x.html;
            location = /50x.html {
                root   html;
            }
    }
}