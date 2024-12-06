/* #region 0 */
select * from stu;
select sname,age from stu;
select sname,math as 数学成绩,english as 英文成绩 from stu;
/* #endregion 0 */

/* #region 1 */
select * from stu where age > 20;
select * from stu where age >= 20 and  age <= 30;
select * from stu where hire_date BETWEEN '1998-09-01' and '1999-09-01';
select * from stu where age = 18 or age = 20 or age = 22;
select * from stu where age in (18,20 ,22);
select * from stu where english is null;
select * from stu where english is not null;

select * from stu where sname like '马%';
select * from stu where sname like '%德%';
/* #endregion 1 */

/* #region 2 */
select * from stu order by age ;
select * from stu order by math desc ;
select * from stu order by math desc , english asc ;
/* #endregion 2 */

/* #region 3 */
select count(id) from stu;
select max(math) from stu;
select min(math) from stu;
/* #endregion 3 */

/* #region 4 */
select sex, avg(math) from stu group by sex;
select sex, avg(math),count(*) from stu group by sex;
select sex, avg(math),count(*) from stu where math > 70 group by sex having count(*)  > 2;
/* #endregion 4 */

/* #region 5 */
select * from stu limit 0 , 3;
select * from stu limit 1 , 3;
/* #endregion 5 */