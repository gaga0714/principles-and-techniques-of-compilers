/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

func getElemByIndex1(goods: Array<String>, idx: Int64) {
    // 使用get函数获取单个Array元素，并使用if-let表达式对结果进行解构
    if (let Some(elem) <- goods.get(idx)) {
        println("goods[${idx}]: ${elem}")
    } else {
        println("索引越界，获取失败")
    }
}

func getElemByIndex2(goods: Array<String>, idx: Int64) {
    // 使用get函数获取单个Array元素，并使用match表达式对结果进行解构
    match (goods.get(idx)) {
        case Some(elem) => println("goods[${idx}]: ${elem}")
        case None => println("索引越界，获取失败")
    }
}

func getElemByIndex3(goods: Array<String>, idx: Int64) {
    // 使用get函数获取单个Array元素，并使用getOrThrow函数对结果进行解构
    if (idx >= 0 && idx < goods.size) {
        println("goods[${idx}]: ${goods.get(idx).getOrThrow()}")
    } else {
        println("索引越界，获取失败")
    }
}

main() {
    let goods = ["手机", "冰箱", "洗衣机", "电脑", "电视"]
    getElemByIndex1(goods, 3)
    getElemByIndex2(goods, 5)
    getElemByIndex3(goods, 2)
}
