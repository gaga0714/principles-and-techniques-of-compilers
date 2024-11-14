from postfix2nfa import NFA
from nfa2dfa import DFA
from dfa2min import MIN_DFA
from regex2postfix import POSTFIX, validateRegex

def main():
    regex = input("请输入正则表达式: ")
    if not validateRegex(regex):
        print("输入正则表达式不合法！")
        return
    else:
        print("正则式合法！")

    try:
        print("中缀正则表达式:", regex)
        #初始化正则表达式并将中缀正则表达式转换为后缀正则表达式
        postfix = POSTFIX(regex)
        print("后缀正则表达式: ", postfix.get_postfix())
        #后缀正则表达式转NFA
        nfa = NFA(postfix=postfix.get_postfix())
        print("NFA: ", nfa.toDict())
        nfa.visualize(name='output/nfa.gv', view=False)
        print("----------------------------------------------------------------")
        #NFA转DFA
        dfa = DFA(nfa)
        print("DFA: ", dfa.toDict())
        dfa.visualize(name='output/dfa.gv', view=False)
        print("----------------------------------------------------------------")
        #最小化DFA
        minDfa = MIN_DFA(dfa)
        print("最小化DFA: ", minDfa.toDict())
        minDfa.visualize(name='output/min_dfa.gv', view=False)
    except Exception as e:
        print(e)
        print("转换失败")

if __name__ == '__main__':
    main()
