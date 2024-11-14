/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

from std import random.Random
from std import collection.HashSet

func generateArray(start: Int64, end: Int64, count: Int64): Array<Int64> {
    let set = HashSet<Int64>()  // 创建一个空HashSet
    let rnd = Random(6)  // 创建Random对象

    // 不断生成随机数放入set，直到set的元素个数为count
    while (set.size < count) {
        let randomNumber = rnd.nextInt64(end - start) + start  // 生成一个随机数
        set.put(randomNumber)  // 将生成的随机数放入set
    }

    set.toArray()  // 将set转换为Array返回
}

main() {
    let arr = generateArray(10, 100, 10)
    println(arr)
}
