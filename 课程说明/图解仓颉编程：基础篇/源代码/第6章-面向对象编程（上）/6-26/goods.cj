/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

// 关键字class前面加上了open修饰符
open class Goods {
    private let price: Float64
    private var discount: Int64

    init(price: Float64, discount: Int64) {
        this.price = price
        this.discount = discount
    }

    prop propPrice: Float64 {
        get() {
            price
        }
    }

    mut prop propDiscount: Int64 {
        get() {
            discount
        }

        set(discount) {
            if (discount > 0 && discount <= 100) {
                this.discount = discount
            } else {
                println("\n对不起，参数错误无法修改!")
            }
        }
    }

    // 加上了修饰符protected和open
    protected open func calcPayAmount() {
        price * (Float64(discount) / 100.0)
    }

    // 加上了修饰符protected和open
    protected open func calcSavedAmount() {
        price * (1.0 - Float64(discount) / 100.0)
    }
}
