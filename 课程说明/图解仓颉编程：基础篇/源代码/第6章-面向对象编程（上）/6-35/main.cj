/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

from std import format.*

main() {
    let waterPump = WaterPump(500.0, 80)
    println("waterPump的电池状态：")
    waterPump.readBatteryData()

    let eBike = EBicycle(2900.0, 90)
    println("\neBike的电池状态：")
    eBike.readBatteryData()
}
