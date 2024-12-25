以下是在CentOS 7上设置NFS服务器并共享目录/root/szl1160710的完整步骤：

在NFS服务器上安装nfs-utils软件包。你可以使用以下命令进行安装：
Copy
sudo yum install nfs-utils
配置NFS服务器。你需要编辑/etc/exports文件来设置要共享的目录。在编辑之前，建议创建该文件的备份：
Copy
sudo cp /etc/exports /etc/exports.bak
然后使用文本编辑器打开exports文件：

Copy
sudo nano /etc/exports
在该文件中，你可以添加以下行来指定要共享的目录：

Copy
/root/szl1160710 *(rw,sync,no_root_squash)
这里的“*”表示允许任何客户端访问该共享目录，“rw”表示该目录可以读写，“sync”表示NFS服务器将等待所有写操作完成后再返回，以确保数据同步，“no_root_squash”表示将客户端的root用户映射为NFS服务器上的root用户。根据需要修改这些选项，并保存文件。

重新加载NFS配置文件。使用以下命令重新加载/etc/exports文件中的配置：
Copy
sudo exportfs -r
启动NFS服务。使用以下命令启动NFS服务：
Copy
sudo systemctl start nfs-server
你可以使用以下命令检查NFS服务是否正在运行：

Copy
systemctl status nfs-server
如果NFS服务正在运行，你将看到类似于“Active: active (running)”的输出。

现在，你已经成功设置了NFS服务器并共享了目录/root/szl1160710。接下来，你需要在另一台机器上挂载该共享目录。假设该机器的IP地址为192.168.1.100，挂载点为/mnt/szl1160710，你可以使用以下命令挂载该目录：

Copy
sudo mount -t nfs 192.168.1.200:/root/szl1160710 /mnt/szl1160710
请将192.168.1.200替换为实际的NFS服务器的IP地址。如果需要，在挂载命令中添加其他选项，以控制挂载的行为。

希望这些步骤可以帮助你成功设置NFS服务器并共享/root/szl1160710目录，并在其他机器上挂载该目录。

