/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

main() {
    var m = 63
    var n = 72
    var r = 0

    do {
        r = m % n
        m = n
        n = r
    } while (r != 0)

    println("最大公约数为：${m}")
}
