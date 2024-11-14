/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */
 
main() {
    for (i in 1..=9) {
        for (j in 1..=9) {
            // 如果j > i，则换行并使用break退出内层循环
            if (j > i) {
                print("\n")
                break
            }
            print("${j}*${i}=${i * j}\t")
        }
    }
}
