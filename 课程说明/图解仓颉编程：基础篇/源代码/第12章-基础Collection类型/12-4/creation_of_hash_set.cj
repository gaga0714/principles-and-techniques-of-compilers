/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

// 导入标准库collection包中的所有顶层声明，其中包括HashSet和ArrayList
from std import collection.*

main() {
    /*
     * 构造一个空的HashSet
     * 调用构造函数init()
     */
    let set1 = HashSet<Int64>()
    println(set1)  // 输出：[]

    /*
     * 通过指定的Array实例构造HashSet
     * 调用构造函数init(elements: Array<T>)
     */
    let set2 = HashSet([1, 2, 3, 3, 2, 1])
    // HashSet的元素不允许重复，重复的元素会自动去重
    println(set2)  // 输出（元素顺序可能不同）：[1, 2, 3]

    /*
     * 通过指定的Collection实例构造HashSet
     * 调用构造函数init(elements: Collection<T>)
     */ 
    let arrList = ArrayList([2, 4, 6, 8, 10])
    let set3 = HashSet(arrList)
    println(set3)  // 输出（元素顺序可能不同）：[2, 4, 6, 8, 10]

    /*
     * 通过指定的元素个数和用于生成初始元素的函数或lambda表达式构造HashSet
     * 调用构造函数init(size: Int64, initElement: (Int64) -> T)
     */
    let set4 = HashSet(3) {num: Int64 => (num + 1) * 3}
    println(set4)  // 输出（元素顺序可能不同）：[3, 6, 9]
}
