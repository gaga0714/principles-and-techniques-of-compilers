/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

package e_commerce

func printCalculationResults(goods: Goods) {
    println("\n应付金额：${goods.calcPayAmount().format(".2")}")
    println("节省金额：${goods.calcSavedAmount().format(".2")}")
}
