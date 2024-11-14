/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

from std import format.*

main() {
    let eBook = EBook(60.0, 90)

    // 通过成员属性propDiscount读取成员变量discount
    println("折扣：${eBook.propDiscount}%")
    println("节省金额：${eBook.calcSavedAmount().format(".2")}")

    // 通过成员属性propDiscount修改成员变量discount
    eBook.propDiscount = -20  // 参数错误，无法修改
    eBook.propDiscount = 70   // 参数通过检查，修改成功
    println("\n折扣：${eBook.propDiscount}%")
    println("节省金额：${eBook.calcSavedAmount().format(".2")}")
}
