$old = (docker container ls -q --filter "name=kudulite")

if ($old) {
    docker container rm -f $old
}

docker run --name kudulite --publish 8080:80 -e "CONTAINER_ENCRYPTION_KEY=MDEyMzQ1Njc4OUFCQ0RFRjAxMjM0NTY3ODlBQkNERUY=" -e "WEBSITE_AUTH_ENCRYPTION_KEY=E782F47415EEC076F8087729FB30CF1CA1482610C2FA985E4F22531225722205" -e "WEBSITE_SITE_NAME=azclidemo" -e "WEBSITE_HOSTNAME=azclidemo.azurewebsites.com" $args[0]
