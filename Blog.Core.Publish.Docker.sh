# 停止容器
#docker stop blcoreapi
# 删除容器
#docker rm blcoreapi
# 删除镜像
#docker rmi quakeguobiao/blogcoreapi
# 切换目录
cd /home/blogcore/Blog.Core
# 发布项目
./Blog.Core.Publish.Linux.sh
# 进入目录
cd /home/blogcore/Blog.Core/.PublishFiles
# 编译镜像
docker build -t quakeguobiao/blogcoreapi

# 生成容器
#docker run --name=blcoreapi -d -v /etc/localtime:/etc/localtime -it -p 9291:9291 quakeguobiao/blogcoreapi
# 启动容器
#docker start blcoreapi
