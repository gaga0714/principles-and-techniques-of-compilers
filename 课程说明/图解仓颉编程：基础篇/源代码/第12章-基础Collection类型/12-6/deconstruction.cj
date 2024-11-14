/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

from std import collection.HashMap

main() {
    let map = HashMap([("语文", 89), ("数学", 90)])

    // 使用get函数获取HashMap指定键对应的值，并使用getOrThrow函数对结果进行解构
    if (map.contains("数学")) {
        println("数学：${map.get("数学").getOrThrow()}")
    } else {
        println("map不包含键：数学")
    }

    // 使用get函数获取HashMap指定键对应的值，并使用if-let表达式对结果进行解构
    if (let Some(elem) <- map.get("物理")) {
        println("物理：${elem}")
    } else {
        println("map不包含键：物理")
    }
}
