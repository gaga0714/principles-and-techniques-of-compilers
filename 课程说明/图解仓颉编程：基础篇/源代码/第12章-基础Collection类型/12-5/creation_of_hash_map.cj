/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

from std import collection.*

main() {
    /*
     * 构造一个空的HashMap
     * 调用构造函数init()
     */
    let map1 = HashMap<Int64, Int64>()
    println(map1)  // 输出：[]

    /*
     * 通过的Array实例构造HashMap
     * 调用构造函数init(elements: Array<(K, V)>
     */
    let map2 = HashMap([("四川", "成都"), ("安徽", "合肥")])
    println(map2)  // 输出（元素顺序可能不同）：[(四川, 成都), (安徽, 合肥)]

    /*
     * 通过指定的Collection实例构造HashMap
     * 调用构造函数init(elements: Collection<(K, V)>)
     */
    let arrList = ArrayList([(1, "小明"), (2, "小美")])
    let map3 = HashMap(arrList)
    println(map3)  // 输出（元素顺序可能不同）：[(1, 小明), (2, 小美)]

    /*
     * 通过指定的元素个数和用于生成初始元素的函数或lambda表达式构造HashMap
     * 调用构造函数init(size: Int64, initElement: (Int64) -> (K, V))
     */
    let map4 = HashMap(3) {num: Int64 => (num * 2, num + 1)}
    println(map4)  // 输出（元素顺序可能不同）：[(0, 1), (2, 2), (4, 3)]
}
