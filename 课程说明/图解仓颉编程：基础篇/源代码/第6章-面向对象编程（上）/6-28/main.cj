/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

from std import format.*

main() {
    // 将Goods对象的引用赋给Goods类型的变量goods1
    let goods1: Goods = Goods(500.0, 80)
    println("goods1的应付金额为：${goods1.calcPayAmount().format(".2")}")

    // 将WaterPump对象的引用赋给WaterPump类型的变量goods2
    let goods2: WaterPump = WaterPump(500.0, 80)
    println("goods2的应付金额为：${goods2.calcPayAmount().format(".2")}")

    // 将WaterPump对象的引用赋给Goods类型的变量goods3
    let goods3: Goods = WaterPump(500.0, 80)
    println("goods3的应付金额为：${goods3.calcPayAmount().format(".2")}")
}
