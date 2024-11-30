# 按需执行要删除的内容
use S_T;

# 删除表
# restrict 关键字表示删除表有限制条件，如果被其他表所引用，则不能成功删除
# cascade 关键字表示删除没有限制条件，强制删除
# 不写默认为 restrict
drop table Student cascade;
drop table Course cascade;
drop table SC restrict;

# 删除S_T数据库
drop database S_T;






