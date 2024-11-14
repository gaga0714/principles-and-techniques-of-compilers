/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

class EBook {
    private let price: Float64
    private var discount: Int64

    init(price: Float64, discount: Int64) {
        this.price = price
        this.discount = discount
    }

    // 没有使用mut修饰的成员属性不能被赋值
    prop propPrice: Float64 {
        // 成员属性propPrice只有getter
        get() {
            price
        }
    }

    // 成员属性propDiscount
    mut prop propDiscount: Int64 {
        // 成员属性propDiscount的getter
        get() {
            discount
        }

        // 成员属性propDiscount的setter
        set(discount) {
            if (discount > 0 && discount <= 100) {
                this.discount = discount
            } else {
                println("\n对不起，参数错误无法修改!")
            }
        }
    }

    func calcPayAmount() {
        price * (Float64(discount) / 100.0)
    }

    func calcSavedAmount() {
        price * (1.0 - Float64(discount) / 100.0)
    }
}
