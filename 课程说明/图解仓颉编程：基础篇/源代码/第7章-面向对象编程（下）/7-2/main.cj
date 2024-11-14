/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

from std import format.*

main() {
    var goods: Goods

    goods = EBook(60.0, 90)
    println("电子书：")
    println("\t应付金额：${goods.calcPayAmount().format(".2")}")

    goods = WaterPump(500.0, 80)
    println("抽水泵：")
    println("\t应付金额：${goods.calcPayAmount().format(".2")}")

    goods = EBicycle(2900.0, 90)
    println("电动自行车：")
    println("\t应付金额：${goods.calcPayAmount().format(".2")}")
}
