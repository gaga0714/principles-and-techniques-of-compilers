/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

interface Changeable {
    mut func changeAmount(): Unit
}

struct Money <: Changeable {
    var amount = 10

    // 实现接口中的mut函数
    public mut func changeAmount() {
        amount++
    }
}

main() {
    var money: Money = Money()
    println("money.amount = ${money.amount}")  // 输出：money.amount = 10
    money.changeAmount()
    println("money.amount = ${money.amount}")  // 输出：money.amount = 11
}
