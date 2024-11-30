/**
 * String 对象用于处理文本（字符串）
 */
export default class{
    

    #str

    // String 对象创建方法：new对象和直接赋值
    constructor(str,way=1){
        if(way===1) this.#str = new String(str)
        this.#str = str
    }

    // 获取字符串长度
    getLength(){
        return this.#str.length
    }
}