# 使用官方的 Python 3.10 瘦身版镜像作为基础镜像
FROM python:3.10-slim

# 设置容器内的环境变量，避免 Python 产生缓冲，让日志立即输出
ENV PYTHONUNBUFFERED 1

# 设置工作目录
WORKDIR /app

# 将 requirements.txt 文件复制到工作目录
# 这一步单独进行，可以利用 Docker 缓存，如果 requirements.txt 文件没有变化，就不需要重新安装依赖
COPY requirements.txt .

# 安装所有依赖包
RUN pip install --no-cache-dir -r requirements.txt

# 将所有 Python 脚本和必要的配置文件复制到工作目录
COPY . /app

# 定义容器启动时默认执行的命令
# 假设我们要运行 deepseek_ok版本.py，您可以根据需要修改为其他脚本
# 注意：项目原先使用 pm2 管理进程，在 Docker 中通常不需要 pm2，Docker 自身负责进程管理。
CMD ["python", "deepseek_ok_带指标plus版本.py"]