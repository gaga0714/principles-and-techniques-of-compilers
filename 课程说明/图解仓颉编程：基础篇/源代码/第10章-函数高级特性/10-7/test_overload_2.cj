/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

open class Book {
    func printBookCategory(book: Fiction) {
        println("小说")
    }
}

class Fiction <: Book {
    func printBookCategory(book: Book) {
        println("图书")
    }
}

main() {
    let book = Fiction()
    book.printBookCategory(Fiction())  // 输出：小说
}
