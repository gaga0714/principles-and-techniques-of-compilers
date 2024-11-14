/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

from std import format.*

main() {
    var goods: Goods = Goods(30.0, 80)
    println("Goods(30.0, 80)：")
    println("\t应付金额：${goods.calcPayAmount().format(".2")}")
    println("\t节省金额：${goods.calcSavedAmount().format(".2")}")

    goods = EBook(50.0, 90)
    println("\nEBook(50.0, 90)：")
    println("\t应付金额：${goods.calcPayAmount().format(".2")}")
    println("\t节省金额：${goods.calcSavedAmount().format(".2")}")

    goods = WaterPump(500.0, 80)
    println("\nWaterPump(500.0, 80)：")
    println("\t应付金额：${goods.calcPayAmount().format(".2")}")
    println("\t节省金额：${goods.calcSavedAmount().format(".2")}")
}
