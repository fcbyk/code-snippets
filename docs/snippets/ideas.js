// #region 0001
class Count{
    #sum

    constructor(init) {
        this.sum = init
    }

    add(num) {
        this.sun += num
        let self = this
        let addWrapper = function (nextNum) {
            return self.add(nextNum)
        };
        return addWrapper
    }

    getSum() {
        return this.sum
    }
}
// #endregion 0001

// #region 0001-1
let count = new Count(10)
count.add(1)(4)(23)(24)(66)(434)(33)(34)  // [!code highlight]
console.log(count.getSum())
// #endregion 0001-1