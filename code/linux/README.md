## Unix与linux发展史
<a href="https://www.bilibili.com/video/BV1mW411i7Qf/" style="margin-right: 5px;">视频教程</a>
<a href="https://docs.qq.com/doc/DVmhOaFdyeXN5RnJX" style="margin-right: 5px;">视频相关笔记</a>
<a href="https://man.niaoge.com/" style="margin-right: 5px;">命令大全</a>

1964年，贝尔实验室、麻省理工学院及美国通用电气公司所共同参与研发Multics，Multics是一套安装在大型主机上多人多任务的操作系统。Multics其目的是想要让大型主机可以达成提供300个以上的终端机连线使用，后来因计划进度落后，资金短缺，宣告失败
1969年，K.Thompson在小型计算机上开发UNIX系统，后于1970年投入运行。
1973年，DennisRitchie开发出C语言，用来改写原来用汇编语言编写的UNIX。
1973年，卡恩与瑟夫开发出了TCP/IP协议中最核心的两个协议：TCP协议和IP协议。应用在UNIX系统上

![image](https://github.com/fcbyk/hello-world/assets/101487905/f0c1807c-d62c-49bd-8afb-a756ffec985f)


UNIX系统的绝大部分程序是用C语言编程的，作为互联网基石的TCP/IP协议也是在UNIX系统上开发和发展起来的，可以说UNIX，C语言，TCP/IP协议，是三兄弟
1980年代，先后诞生了MacOS，Windows操作系统
20世纪80年代，计算机硬件的性能不断提高，PC的市场不断扩大，当时可供计算机选用的操作系统主要有Unix、DOS和MacOS这几种。Unix价格昂贵，不能运行于PC；DOS显得简陋，且源代码被软件厂商严格保密；MacOS是一种专门用于苹果计算机的操作系统。此时，计算机科学领域迫切需要一个更加完善、强大、廉价和完全开放的操作系统。由于供教学使用的典型操作系统很少，因此当时在荷兰当教授的美国人AndrewS.Tanenbaum编写了一个操作系统，名为MINIX，为了向学生讲述操作系统内部工作原理。MINIX虽然很好，但只是一个用于教学目的的简单操作系统，而不是一个强有力的实用操作系统，然而最大的好处就是公开源代码。
1991年，芬兰赫尔辛基大学大学二年级的学生LinusTorvalds，他利用Unix的核心，去除繁杂的核心程序，吸收MINIX精华的，写出了属于自己的Linux操作系统。并放在网络上供大家下载。

## Linux特点
Linux严格区分大小写
Linux中所有内容以文件形式保存，包括硬件
Linux不靠扩展名区分文件类型
Linux所有的储存设备都必须挂载之后，用户才能使用，包括硬盘，u盘和光盘

## Linux的版本
分为内核版本与发行版本，内核版本是Linux任何版本的核心，内核版本号由3个数字组 成：X.Y.Z
X：主版本号，通常在一段时间内比较稳定 
Y：次版本号，偶数代表正式版本，可公开发行， 奇数代表测试版本，不太稳定
Z：表示修改号，表示第几次修改
发行版本是将Linux内核与应用软件打包发行的版本，主流的Linux发行版本有：Red Hat Enterprise Linux 6.0，Centos 6.5，Ubuntu，Debian GNU/Linux，openSUSE，红旗 Linux等。  
