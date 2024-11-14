/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

class EBook {
    let price: Float64
    var discount: Int64

    init(price: Float64, discount: Int64) {
        this.price = price
        this.discount = discount
    }

    func calcPayAmount() {
        price * (Float64(discount) / 100.0)
    }

    func calcSavedAmount() {
        price * (1.0 - Float64(discount) / 100.0)
    }
}
