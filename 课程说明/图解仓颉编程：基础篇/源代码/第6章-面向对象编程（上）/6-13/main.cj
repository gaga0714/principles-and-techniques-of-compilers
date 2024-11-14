/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

from std import format.*

main() {
    let eBook = EBook(60.0, 90)
    // println("折扣：${eBook.discount}%")  // 错误，不可以直接访问discount

    // 通过成员函数getDiscount读取成员变量discount
    println("折扣：${eBook.getDiscount()}%")
    println("节省金额：${eBook.calcSavedAmount().format(".2")}")

    // 通过成员函数setDiscount修改成员变量discount
    eBook.setDiscount(-20)  // 参数错误，无法修改

    eBook.setDiscount(70)   // 参数通过检查，修改成功
    println("\n折扣：${eBook.getDiscount()}%")
    println("节省金额：${eBook.calcSavedAmount().format(".2")}")
}
