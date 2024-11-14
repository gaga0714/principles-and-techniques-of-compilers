/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */

main() {
    var memberPoints = 15550  // 会员积分
    var memberGrade = ""  // 会员等级

    if (memberPoints >= 0) {  // 在会员积分合法的情况下，进一步判断会员等级
        if (memberPoints == 0) {
            memberGrade = "非会员"
        } else if (memberPoints <= 1000) {
            memberGrade = "白银会员"
        } else if (memberPoints <= 5000) {
            memberGrade = "黄金会员"
        } else if (memberPoints <= 10000) {
            memberGrade = "铂金会员"
        } else {
            memberGrade = "钻石会员"
        }
        println("您的会员等级是：${memberGrade}。")
    } else {
        println("对不起，会员积分不可以为负数。")
    }
}
