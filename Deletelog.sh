#删除日志脚本
#作者烟雨，第一次写，写的不好见谅。
#网站地址：https://www.yanyuwangluo.cn
#!/bin/sh
#配置目标文件夹
target_dir="/root/ql/log"
#find $target_dir -ctime +2 -name "*.log" -exec ls -l {} \;
#直接删除
#find $target_dir -ctime +2 -name "*.log" -exec rm -rf {} \;
# 先在目标目录下查找出最后修改时间为2天前的，并且后缀为.log的文件  再循环删除日志文件
list=`find $target_dir -mtime +2 -name "*.log"`
for dele_file in $list
do
    if test -f $dele_file
        then
        pwd_info=`ls -l $dele_file`
        rm -rf $dele_file
       echo "删除文件："$pwd_info
    fi
done
#先查找出 目标目录下所有的后缀为.log 的文件，再循环清空日志
list=`find $target_dir  -name "*.log"`
for file in $list 
do
    if test -f $file
       then        
       cat /dev/null > $file
       pwd_info=`ls -l $file`
       echo "清空文件："$pwd_info
    fi
done