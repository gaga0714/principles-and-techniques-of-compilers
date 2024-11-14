/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

class EBook {
    let price: Float64
    var discount: Int64

    init(price: Float64, discount: Int64) {
        this.price = price
        this.discount = discount
    }
}

main() {
    let eBook1 = EBook(60.0, 80)
    println("eBook1的折扣为：${eBook1.discount}%")

    eBook1.discount = 70  // 修改eBook1的成员变量discount
    println("修改后eBook1的折扣为：${eBook1.discount}%")

    let eBook2 = eBook1  // 将eBook1赋给eBook2
    println("\neBook2的折扣为：${eBook2.discount}%")

    eBook1.discount = 75  // 修改eBook1的成员变量discount
    println("\n修改后eBook1的折扣为：${eBook1.discount}%")
    println("修改后eBook2的折扣为：${eBook2.discount}%")

    eBook2.discount = 55  // 修改eBook2的成员变量discount
    println("\n修改后eBook1的折扣为：${eBook1.discount}%")
    println("修改后eBook2的折扣为：${eBook2.discount}%")
}
