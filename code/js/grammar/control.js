// 控制语句
export const control = {
    if_,
    switch_,
    while_,
    for_,
    continue_,
    break_,
    label_,
    return_
}

function if_(){
    //if分支语句
    if (true) {
        console.log('if分支语句');
        console.log('表达式成立');
    }

    //如果只有一条代码块，可以不用写 {}
    if (true) console.log('表达式成立');

    //else if 和 else 的使用
    let length = 1 ;
    let msg;
    if (length > 10) msg = "密码已经无敌了";
    else if (length > 6)  msg = "密码安全性中级";
    else msg = "这密码，要完的节奏";
}

function switch_(){
    //switch分支语句
    //可以将 switch 理解为 if 的另一种结构清晰的写法。
    //如果表达式等于 case 中的值，将执行此 case 代码段
    //break 关键字会终止 switch 的执行
    //如果case执行后缺少 break 则接着执行后面的语句
    //没有任何 case匹配时将执行default 代码块
    let name = '视频';
    switch (name) {
        case '产品':
            console.log('hdcms.com');
            break;
        case '视频':
            console.log('houdunren.com');
            break;
        default:
            console.log('houdunwang.com')
    }

    //case 合用示例
    let error = 'warning';
    switch (error) {
        case 'notice':
        case 'warning':
            console.log('警告或提示信息');
            break;
        case 'error':
            console.log('错误信息');
    }

    //在switch 与 case 都可以使用表达式
    let age = 10
    switch (true) {
        case age < 15:
          console.log("儿童");
          break;
        case age < 25:
          console.log("青少年");
          break;
        case age < 40:
          console.log("青年");
          break;
        case age < 60:
          console.log("中年");
          break;
        case age < 100:
          console.log("老年");
          break;
        default:
          console.log("年龄输出错误");
    }

    //下面例子缺少 break 后，会接着执行后面的 switch 代码
    switch (1) {
        case 1:
            console.log(1);
        case 2:
            console.log(2);
        default:
            console.log("default");
    }
}

function while_(){
    //while循环语句
    //do/while，后条件判断语句，无论条件是否为真都会先进行循环体
    let i = 1;
    while(i<=10){
        console.log("我喜欢你");
        i++;
    }

    do{
        console.log("我爱你");
    }while(false)
}

function for_(){
    //for循环语句
    for(let i=1; i<=5; i++){
        console.log("我喜欢你");
    }

    //for 的三个参数可以都省略或取几个
    for(;;){
        console.log("我喜欢你");
        break;
    }
}

function continue_(){
    //continue跳转语句
    //continue 用于退出当前循环返回循环起始继续执行

    //获取所有偶数，所有奇数使用 continue 跳过
    for (let i = 1; i <= 10; i++) {
        if (i % 2) continue;
        console.log(i);
    }
}

function break_(){
    //break跳转语句
    //break 用于退出当前循环

    //获取三个奇数，超过时使用break退出循环
    let count = 0,num = 3;
    for (let i = 1; i <= 10; i++) {
        if (i % 2) {
            console.log(i);
            if (++count == num) break;
        }
    }
}

function label_(){
    //label 标签
    //标签(label) 为程序定义位置，可以使用continue/break跳到该位置
    flag1:while(true){
        console.log("label 标签")
        flag2:while (true) {
            break flag1;
        }
    }
}

function return_(){
    //return跳转语句
    //跳出函数体，返回到主程序之中，不再往下执行函数体里面的语句
    if(false) return 0;
}
