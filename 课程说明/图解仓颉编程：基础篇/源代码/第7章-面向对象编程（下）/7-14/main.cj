/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

from std import format.*

main() {
    let waterPump = WaterPump(500.0, 80, LeadAcidBattery())  // 传入的是铅酸电池

    println("铅酸电池：")
    waterPump.readBatteryData()

    waterPump.propBatteryPluggable = LithiumBattery()  // 将铅酸电池更换为锂电池
    println("\n锂电池：")
    waterPump.readBatteryData()
}
