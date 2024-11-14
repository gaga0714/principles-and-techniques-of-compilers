/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */
 
func matchScoreGrade(score: Int64) {
    let grade: String  // grade表示分数等级

    // 不含待匹配值的match表达式
    match {
        case score < 0 || score > 100 => grade = "无效分数"  // 小于0或大于100为无效分数
        case score < 60 => grade = "不及格"  // 0 ~ 59之间为不及格
        case score < 80 => grade = "及格"   // 60 ~ 79之间为及格
        case score < 90 => grade = "良好"   // 80 ~ 89之间为良好
        case _ => grade = "优秀"  // 90 ~ 100之间为优秀
    }

    println("您的分数等级为：${grade}")
}

main() {
    matchScoreGrade(79)
}
