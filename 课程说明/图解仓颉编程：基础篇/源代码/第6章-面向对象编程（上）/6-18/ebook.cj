/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

// EBook类继承了Goods类
class EBook <: Goods {
    init(price: Float64, discount: Int64) {
        super(price, discount)  // 通过super调用父类Goods的构造函数
    }
}
