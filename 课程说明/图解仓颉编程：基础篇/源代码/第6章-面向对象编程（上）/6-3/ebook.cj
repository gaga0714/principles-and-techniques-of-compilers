/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

from std import format.*  // 控制浮点数的输出格式

class EBook {
    static var counter = 0  // 用于统计EBook类的实例个数的静态成员变量
    let price: Float64  // 实例成员变量price
    var discount: Int64  // 实例成员变量discount

    // 构造函数
    init(price: Float64, discount: Int64) {
        this.price = price
        this.discount = discount
        counter++  // 也可以写为EBook.counter++
    }

    // 实例成员函数calcPayAmount
    func calcPayAmount() {
        price * (Float64(discount) / 100.0)
    }

    // 实例成员函数calcSavedAmount
    func calcSavedAmount() {
        price * (1.0 - Float64(discount) / 100.0)
    }
}

main() {
    let eBook1: EBook = EBook(60.0, 90)  // 构造EBook类的实例

    // 访问实例成员变量
    println("价格：${eBook1.price.format(".2")}")
    println("折扣：${eBook1.discount}%")

    // 调用实例成员函数
    println("应付金额：${eBook1.calcPayAmount().format(".2")}")
    println("节省金额：${eBook1.calcSavedAmount().format(".2")}")
}
