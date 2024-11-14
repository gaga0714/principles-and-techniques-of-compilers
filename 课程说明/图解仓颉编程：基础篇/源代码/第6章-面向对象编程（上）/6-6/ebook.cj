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

    // 静态成员函数
    static func printCounter() {
        println("创建的对象个数为：${counter}")
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
    let eBook1: EBook = EBook(60.0, 90)  // 构造EBook类的实例eBook1

    // 访问eBook1的实例成员变量和实例成员函数
    println("价格：${eBook1.price.format(".2")}")
    println("折扣：${eBook1.discount}%")
    println("应付金额：${eBook1.calcPayAmount().format(".2")}")
    println("节省金额：${eBook1.calcSavedAmount().format(".2")}")

    println("创建的对象个数为：${EBook.counter}")  // 访问静态成员变量

    let eBook2: EBook = EBook(80.0, 70)  // 构造EBook类的实例eBook2

    // 访问eBook2的实例成员变量和实例成员函数
    println("\n价格：${eBook2.price.format(".2")}")
    println("折扣：${eBook2.discount}%")
    println("应付金额：${eBook2.calcPayAmount().format(".2")}")
    println("节省金额：${eBook2.calcSavedAmount().format(".2")}")

    println("创建的对象个数为：${EBook.counter}")  // 再次访问静态成员变量
}
