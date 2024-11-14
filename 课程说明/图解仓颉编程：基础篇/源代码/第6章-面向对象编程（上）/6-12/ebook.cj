/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

class EBook {
    let price: Float64
    private var discount: Int64

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

    // 读取折扣值
    func getDiscount() {
        discount
    }

    // 修改折扣值
    func setDiscount(discount: Int64) {
        // 只有传入的参数合理时才能修改成员变量discount
        if (discount > 0 && discount <= 100) {
            this.discount = discount
        } else {
            println("\n对不起，参数错误无法修改！")
        }
    }
}
