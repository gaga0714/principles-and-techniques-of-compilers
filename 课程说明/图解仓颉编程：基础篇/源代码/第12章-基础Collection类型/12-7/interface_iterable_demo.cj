/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

main() {
    let numbers = [1, 2, 3, 4, 5]
    var iter = numbers.iterator()  // 获得numbers的迭代器

    println("while表达式")
    // 使用while表达式遍历numbers
    while (true) {
        match (iter.next()) {
            case Some(elem) => print(" ${elem}")
            case None => break
        }
    }

    iter = numbers.iterator()  // 再次获得numbers的迭代器
    println("\nwhile-let表达式")
    // 使用while-let表达式遍历numbers
    while (let Some(elem) <- iter.next()) {
        print(" ${elem}")
    }
}
