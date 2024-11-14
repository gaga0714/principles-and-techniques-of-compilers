/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

from std import format.*

main() {
    let eBook = EBook(60.0, 90)  // EBook对象
    println("电子书：")
    println("\t价格：${eBook.propPrice.format(".2")}")
    println("\t应付金额：${eBook.calcPayAmount().format(".2")}")

    let waterPump = WaterPump(500.0, 80)  // WaterPump对象
    println("\n抽水泵：")
    println("\t价格：${waterPump.propPrice.format(".2")}")
    println("\t运费：${waterPump.propExpressFee}")
    println("\t应付金额：${waterPump.calcPayAmount().format(".2")}")

    let eBike = EBicycle(2900.0, 90)  // EBicycle对象
    println("\n电动自行车：")
    println("\t价格：${eBike.propPrice.format(".2")}")
    println("\t安装服务费：${eBike.propServiceFee}")
    println("\t应付金额：${eBike.calcPayAmount().format(".2")}")
}
