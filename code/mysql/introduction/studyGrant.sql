# user表是MySQL中最重要的一个权限表， 记录用户账号和权限信息
select * from mysql.user;

# 创建用户
# 默认host是 %
create user zhang3 identified by '123456';
# 指定host
create user 'li4'@'localhost' identified by '123456';


# 删除用户
drop user zhang3,'li4'@'localhost';

# 默认删除host为%的用户
drop user zhang3 ;
# 删除要指定host
drop user 'li4'@'localhost';

# 修改密码
# 使用SET语句来修改当前用户密码（仅限root，没测试过）
set password ='123456';
# 使用ALTER USER命令来修改当前用户密码
alter user user() identified by '123456';
# 旧版写法，修改当前用户的密码，报错
# SET PASSWORD = PASSWORD('123456');

# 查看权限列表
show privileges;

# 查看当前用户权限,三条语句都行
show grants ;
show grants for current_user ;
show grants for current_user() ;

# 授予权限
# 对所有库所有表的全部权限
grant all privileges on *.* to zhang3;
# 给li4用户用本地命令行方式，授予hntou_repair这个库下的所有表的插删改查的权限
grant select,insert,delete,update on hntou_repair.* to li4@localhost ;
# 对hntou_repair库所有表的全部权限
grant all privileges on hntou_repair.* to zhang3;

# 收回权限
revoke all privileges on hntou_repair.* from zhang3;

# 查看某用户的全局权限
show grants for zhang3;
show grants for 'li4'@'localhost';