/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */
 
main() {
    for (i in 1..=9) {  // i控制行
        for (j in 1..=i) {  // j控制列
            print("${j}*${i}=${i * j}\t")  // 输出第i行的所有元素，从1*i到i*i
        }
        print("\n")  // 一行输出结束后，换行
    }
}
