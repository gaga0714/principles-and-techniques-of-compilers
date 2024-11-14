/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

from std import format.*

main() {
    var pointsCalculable: PointsCalculable

    pointsCalculable = WaterPump(500.0, 80)
    println("抽水泵：")
    println("\t积分：${pointsCalculable.calcPoints()}")

    pointsCalculable = EBicycle(2900.0, 90)
    println("电动自行车：")
    println("\t积分：${pointsCalculable.calcPoints()}")
}
