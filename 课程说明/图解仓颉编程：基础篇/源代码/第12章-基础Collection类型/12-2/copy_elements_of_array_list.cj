/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

from std import collection.ArrayList

main() {
    let arrList1 = ArrayList([1, 2, 3, 4, 5])
    println(arrList1)  // 输出：[1, 2, 3, 4, 5]

    // 通过切片创建ArrayList的副本
    let arrList2 = arrList1[..]
    println(arrList2)  // 输出：[1, 2, 3, 4, 5]
    // arrList1和arrList2互不影响
    arrList1[0] = -1
    println(arrList1)  // 输出：[-1, 2, 3, 4, 5]
    println(arrList2)  // 输出：[1, 2, 3, 4, 5]

    // 通过clone函数创建ArrayList的副本
    let arrList3 = arrList1.clone()
    println(arrList3)  // 输出：[-1, 2, 3, 4, 5]
    // arrList1和arrList3互不影响
    arrList3[2] = -2
    println(arrList1)  // 输出：[-1, 2, 3, 4, 5]
    println(arrList3)  // 输出：[-1, 2, -2, 4, 5]

    // 通过切片获得ArrayList的部分元素对应的ArrayList实例（副本）
    let arrList4 = arrList1[3..]
    println(arrList4)  // 输出：[4, 5]
    // arrList1和arrList4互不影响
    arrList1[0] = 99
    println(arrList1)  // 输出：[99, 2, 3, 4, 5]
    println(arrList4)  // 输出：[4, 5]
}
