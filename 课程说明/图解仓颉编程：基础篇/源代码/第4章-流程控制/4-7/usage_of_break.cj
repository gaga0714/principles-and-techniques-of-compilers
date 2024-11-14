/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */
 
main() {
    var i = 1  // 表示当前项的值
    var sum = 0  // 表示和
    var product = 1  // 表示积

    while (true) {
        sum += i
        // 若sum > 100，则立即退出循环
        if (sum > 100) {
            break
        }

        product *= i
        // 若product > 500000，则立即退出循环
        if (product > 500000) {
            break
        }

        i++
        // 若i == 50，则立即退出循环
        if (i == 50) {
            break
        }
    }
    println("i:${i}  sum:${sum}  product:${product}")
}
