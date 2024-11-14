/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

class EBook {
    let price: Float64
    var discount: Int64

    init(price: Float64, discount: Int64) {
        // 在构造函数中访问实例成员变量
        this.price = price
        this.discount = discount
    }

    func calcPayAmount() {
        // 在实例成员函数中访问实例成员变量
        this.price * (Float64(this.discount) / 100.0)
    }

    func calcSavedAmount() {
        price * (1.0 - Float64(discount) / 100.0)  // 省略了this
    }

    func printPayAmount() {
        println("应付金额：${this.calcPayAmount()}")  // 在实例成员函数中调用实例成员函数
    }
}

main() {
    let eBook = EBook(60.0, 90)
    println("应付金额：${eBook.calcPayAmount()}")
    eBook.printPayAmount()
}
