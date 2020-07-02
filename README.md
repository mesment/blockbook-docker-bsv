# blockbook-docker-bsv-insight

## 安装和升级步骤

1. 编译最新版本的blockbook和bsv的deb 文件并替换debs文件夹中的deb 文件

2. 构建镜像 执行 docker build -t bchsv-insight:latest .

3. 根据已经同步好的bsv节点的信息更新blockchain_cfg.json 配置文件中的地址，端口号和rpc 用户名 密码

4. 使用blockchain_cfg.json替换容器中的配置文件，容器内配置文件位置 /opt/coins/blockbook/bcashsv/config/blockchaincfg.json
