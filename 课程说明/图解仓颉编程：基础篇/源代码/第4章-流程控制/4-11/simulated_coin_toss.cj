/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

from std import random.Random  // 导入标准库random包中的Random类

main() {
    let rnd = Random()  // 构造一个生成随机数的对象rnd
    var x: Bool  // 用于存储生成的随机布尔值
    var counterT = 0  // true的计数器
    var counterF = 0  // false的计数器

    for (_ in 0..10000) {
        x = rnd.nextBool()  // 生成随机布尔值并存入x
        if (x) {
            counterT++
        } else {
            counterF++
        }
    }

    println("正面出现的次数为：${counterT}")
    println("反面出现的次数为：${counterF}")
}
