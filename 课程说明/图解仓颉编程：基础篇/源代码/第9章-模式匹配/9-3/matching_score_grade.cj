/*
 * 作者：刘玥 张荣超
 * 抖音/微信视频号/微信公众号：九丘教育
 */
 
func matchScoreGrade(score: Int64) {
    if (score >= 0 && score <= 100) {
        let grade = match (score / 10) {
            case 0 | 1 | 2 | 3 | 4 | 5 => "不及格"
            case 6 | 7 => "及格"
            case 8 => "良好"
            case x => "优秀，分数至少为${x * 10}"  // 绑定模式
        }
        println(grade)
    } else {
        println("无效分数")
    }
}

main() {
    matchScoreGrade(96)  // 输出：优秀，分数至少为90
}
