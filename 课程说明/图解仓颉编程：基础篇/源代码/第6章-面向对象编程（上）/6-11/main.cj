/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

from std import format.*

main() {
    let eBook = EBook(60.0, 90)
    println("折扣：${eBook.discount}%")
    println("节省金额：${eBook.calcSavedAmount().format(".2")}")
}
