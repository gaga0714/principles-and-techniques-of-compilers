/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

from std import collection.ArrayList

main() {
    let numbers = ArrayList(30) {idx: Int64 => idx}  // 初始容量为30
    println("capacity: ${numbers.capacity()}  size: ${numbers.size}")

    numbers.reserve(100)  // 扩充容量
    println("capacity: ${numbers.capacity()}  size: ${numbers.size}")
}
