# HW12_Docker

```
root@Hunter:/home/hunter/HW12# docker build -t hunter/nginx:v1 .
Sending build context to Docker daemon  19.97kB
Step 1/9 : FROM alpine
 ---> 042a816809aa
Step 2/9 : MAINTAINER Hunter <hunter1981@yandex.ru>
 ---> Running in 8dbbd020370b
Removing intermediate container 8dbbd020370b
 ---> 699f0dd08b7b
Step 3/9 : ENV TZ=EUROPE/MOSCOW
 ---> Running in c1b4eeee9392
Removing intermediate container c1b4eeee9392
 ---> 486f5301b840
Step 4/9 : RUN apk add nginx
 ---> Running in 93d04d797b96
fetch https://dl-cdn.alpinelinux.org/alpine/v3.17/main/x86_64/APKINDEX.tar.gz
fetch https://dl-cdn.alpinelinux.org/alpine/v3.17/community/x86_64/APKINDEX.tar.gz
(1/2) Installing pcre (8.45-r2)
(2/2) Installing nginx (1.22.1-r0)
Executing nginx-1.22.1-r0.pre-install
Executing nginx-1.22.1-r0.post-install
Executing busybox-1.35.0-r29.trigger
OK: 9 MiB in 17 packages
Removing intermediate container 93d04d797b96
 ---> a2b366bd20f9
Step 5/9 : RUN echo "daemon off;" >> /etc/nginx/nginx.conf
 ---> Running in ae7748430c1e
Removing intermediate container ae7748430c1e
 ---> f9f87730e5f3
Step 6/9 : COPY index.html /usr/share/nginx/
 ---> ea1e8857a986
Step 7/9 : COPY nginx_default_conf /etc/nginx/http.d/default.conf
 ---> 8e4721e7cee4
Step 8/9 : EXPOSE 8080
 ---> Running in 62fbf832293a
Removing intermediate container 62fbf832293a
 ---> 7ca47b5dedfc
Step 9/9 : CMD [ "nginx" ]
 ---> Running in 73e00bff2c3e
Removing intermediate container 73e00bff2c3e
 ---> 9cc4df84a76e
Successfully built 9cc4df84a76e
Successfully tagged hunter/nginx:v1
root@Hunter:/home/hunter/HW12# docker images 
REPOSITORY     TAG       IMAGE ID       CREATED          SIZE
hunter/nginx   v1        9cc4df84a76e   11 seconds ago   11.1MB
alpine         latest    042a816809aa   2 weeks ago      7.05MB
hello-world    latest    feb5d9fea6a5   16 months ago    13.3kB
root@Hunter:/home/hunter/HW12# docker run -d -p 8080:80 hunter/nginx:v1
b63ab027a35bea1f56317b3cde154ced341c2f56208db08a95e3f8cf77121047
root@Hunter:/home/hunter/HW12# curl http://127.0.0.1:8080
<!DOCTYPE html>
<html>
<head>
        <title> My Otus Nginx container </title>
</head>
<body>
        <body style=text-align:center;background-color:blue;font-weight:900;font-size:20px;font-family:Helvetica,Arial,sans-serif>
        <img src="https://www.docker.com/wp-content/uploads/2022/03/Moby-logo.png">
        <h1> Welcome to my custom nginx webpage hosted in a Docker container </h1>
        <p> This container was deployed: <div id="date"></div></p>
<script>
        var date = new Date();
        document.getElementById("date").innerHTML=date.toLocaleString();
</script>
</body>
</html>
root@Hunter:/home/hunter/HW12#
```
