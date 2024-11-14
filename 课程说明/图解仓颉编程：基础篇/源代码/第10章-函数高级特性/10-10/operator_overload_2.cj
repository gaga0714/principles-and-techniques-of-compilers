/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

struct Money {
    var amount: Int64

    init(amount: Int64) {
        this.amount = amount
    }

    // 对操作符“+”进行重载
    operator func +(rhs: Money): Money {
        Money(amount + rhs.amount)
    }
}

main() {
    let money1 = Money(8)
    var money2 = Money(10)
    money2 += money1  // Money类型支持复合赋值操作符“+=”
    println(money2.amount)  // 输出：18
}
