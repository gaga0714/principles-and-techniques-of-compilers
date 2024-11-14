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
    operator func +(rhs: Money): Int64 {
        amount + rhs.amount
    }
}

main() {
    let money1 = Money(8)
    let money2 = Money(10)
    println(money1 + money2)  // 输出：18
}
