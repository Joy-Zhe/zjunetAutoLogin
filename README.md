# ZJU校网自动认证

## 1. Docker构建

+ 拉取仓库

```shell
git clone https://github.com/Joy-Zhe/zjunetAutoLogin.git
cd zjunetAutoLogin
```

+ 构建docker
```shell
docker build -t zjunet-autologin .
```

> 当然也可以直接选择我构建好的镜像

```shell
docker pull joyzheng03/zjunet-autologin:latest
```

##  2. Docker运行

+ 运行docker
```shell
docker run --rm --network="host" -e STUDENT_ID="<your_stu_id>" -e STUDENT_PWD="<your_zjuvpn_password>" joyzheng03/zjunet-autologin:latest
```

+ 设置开机自启动
```shell
systemctl start docker
systemctl enable docker
```
