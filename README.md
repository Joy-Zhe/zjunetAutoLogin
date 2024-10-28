# ZJU校网自动认证

## 1. Docker构建

+ 拉取仓库

```shell
git clone https://github.com/Joy-Zhe/zjunetAutoLogin.git
cd zjunetAutoLogin
```

+ 构建docker
```shell
docker build -t zjunetautologin .
```

+ 运行docker
```shell
docker run --rm -e STUDENT_ID="<your_stu_id>" -e STUDENT_OWD="<your_zjuvpn_password>" zjunetautologin
```

+ 设置开机自启动
```shell
systemctl start docker
systemctl enable docker
```
