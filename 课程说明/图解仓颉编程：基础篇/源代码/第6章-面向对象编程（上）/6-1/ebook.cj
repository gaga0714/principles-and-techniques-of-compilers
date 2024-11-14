/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

class EBook {
    let price: Float64  // 实例成员变量price
    var discount: Int64  // 实例成员变量discount

    // 构造函数
    init(price: Float64, discount: Int64) {
        this.price = price
        this.discount = discount
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
