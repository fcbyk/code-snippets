# 向 Student表增加 “入学时间” 列，其数据类型为日期型
alter table Student add S_entrance date;

# 更改 Student表中的年龄的数据类型, smallint改为 int
alter table Student modify column Sage int;

# 增加课程名称必须取唯一值的约束条件
alter table Course add unique(Cname);

# 删除 Student表的 “入学时间” 列
alter table Student drop column S_entrance;