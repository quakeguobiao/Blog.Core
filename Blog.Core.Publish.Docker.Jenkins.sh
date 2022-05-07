dotnet restore
dotnet build 
cd Blog.Core.Api

dotnet publish 
echo "Successfully!!!! ^ please see the file ."
cd bin/Debug/net6.0/publish/

#rm -f appsettings.json
#cp -rf /var/jenkins_home/workspace/SecurityConfig/Blog.Core/appsettings.json appsettings.json

docker stop apkcontainer
docker rm apkcontainer
docker rmi quakeguobiao/blogcoreapi 

chmod 777 StopContainerImg.sh
./StopContainerImg.sh apkcontainer quakeguobiao/blogcoreapi

docker build -t quakeguobiao/blogcoreapi .
docker push quakeguobiao/blogcoreapi:latest
docker run --name=apkcontainer -d -v /home/blogcore/appsettings.json:/app/appsettings.json -v /home/blogcore/Log/:/app/Log -v /etc/localtime:/etc/localtime -it -p 9291:9291 quakeguobiao/blogcoreapi