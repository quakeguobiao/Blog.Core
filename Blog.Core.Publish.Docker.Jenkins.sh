#dotnet restore
find .PublishFiles/ -type f -and ! -path '*/wwwroot/images/*' ! -name 'appsettings.*' |xargs rm -rf
dotnet build;
#cd Blog.Core.Api
rm -rf Blog.Core.Api/bin/Debug/.PublishFiles;
#dotnet publish 
dotnet publish -o Blog.Core.Api/bin/Debug/.PublishFiles;
awk 'BEGIN { cmd="cp -ri Blog.Core.Api/bin/Debug/.PublishFiles ./"; print "n" |cmd; }'
echo "Successfully!!!! ^ please see the file .PublishFiles";
#echo "Successfully!!!! ^ please see the file ."
#cd bin/Debug/net6.0/publish/
cd .PublishFiles
rm -f appsettings.json
#cp -rf /var/jenkins_home/workspace/SecurityConfig/Blog.Core/appsettings.json appsettings.json

docker stop apkcontainer
docker rm apkcontainer
docker rmi quakeguobiao/blogcoreapi 

#chmod 777 StopContainerImg.sh
#./StopContainerImg.sh apkcontainer quakeguobiao/blogcoreapi

docker build -t quakeguobiao/blogcoreapi .
docker push quakeguobiao/blogcoreapi:latest
docker run --name=apkcontainer -d -v /home/blogcore/appsettings.json:/app/appsettings.json -v /home/blogcore/Log/:/app/Log -v /etc/localtime:/etc/localtime -it -p 9291:9291 quakeguobiao/blogcoreapi