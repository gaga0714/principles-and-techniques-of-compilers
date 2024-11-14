/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

open class Book {}
class Fiction <: Book {}

func printBookCategory(book: Fiction) {
    println("小说")
}

func outer() {
    func printBookCategory(book: Book) {
        println("图书")
    }

    printBookCategory(Fiction())  // 调用嵌套函数printBookCategory
}

main() {
    outer()  // 输出：图书
    printBookCategory(Fiction())  // 调用全局函数printBookCategory，输出：小说
}
