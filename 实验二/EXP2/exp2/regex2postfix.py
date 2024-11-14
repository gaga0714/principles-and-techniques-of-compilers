import re
#检验正则表达式是否合法
def validateRegex(regex):
    try:
        re.compile(regex)
    except re.error:
        print(f"非法正则表达式: {regex}")
        return False
    return True
class POSTFIX:
    def __init__(self, regex):
        self.regex = regex
        self.postfix = self.shunt_yard(regex)
    #返回后缀正则表达式
    def get_postfix(self):
        return self.postfix
    #用 Shunting Yard 算法实现中缀正则表达式到后缀表达式的转换
    def shunt_yard(self, regex):
        #定义了操作符优先级
        operators = {'*': 5, '+': 4, '?': 3, '.': 2, '|': 1}
        #postfix存储后缀表达式，stack用作Shunting Yard算法的中间栈
        postfix, stack = "", ""
        #处理字符类,如[abc]->(a|b|c)
        for i in range(len(regex)):
            c = regex[i]
            if c == '[':
                j = i + 1
                while regex[j] != ']':
                    if regex[j].isalnum() and regex[j + 1].isalnum():
                        regex = regex[:j + 1] + '|' + regex[j + 1:]
                    j += 1
        regex = regex.replace('[', '(')
        regex = regex.replace(']', ')')
        #处理连字符-（a-z -> a|b|……|z）
        hyphen_count = regex.count('-')
        for i in range(hyphen_count):
            for j in range(len(regex)):
                c = regex[j]
                if c == '-':
                    final = regex[j + 1]
                    first = regex[j - 1]
                    temp_list = ''
                    for k in range(int(ord(final) - ord(first))):
                        temp_list = temp_list + '|'
                        char = chr(ord(first) + k + 1)
                        temp_list = temp_list + char
                    regex = regex[0: j] + temp_list + regex[j + 2:]
                    break
        # 在任何两个相邻的字符之间插入连接符（.），前提是这两个字符不是操作符，且它们之间没有被操作符分隔，或者第二个字符是左括号。
        dotIndices = []
        for i in range(len(regex) - 1):
            startOps = [')', "*", "+", "*"]
            endOps = ["*", "+", ".", "|", ")"]
            # 如果当前字符是右括号、*、+、*，且下一个字符不是操作符，则需要插入连接符
            if regex[i] in startOps and regex[i + 1] not in endOps:
                dotIndices.append(i)
            # 如果当前字符是字面量字符，且下一个字符是字面量字符或左括号，则需要插入连接符
            elif regex[i].isalnum() and (regex[i + 1].isalnum() or regex[i + 1] == '('):
                dotIndices.append(i)
        # 遍历所有需要插入连接符的位置，并在合适位置插入'.'
        for i in range(len(dotIndices)):
            regex = regex[:dotIndices[i] + 1 + i] + '.' + regex[dotIndices[i] + 1 + i:]
        # 遍历正则表达式中的每个字符，执行 Shunting Yard 算法
        for i in range(len(regex)):
            c = regex[i]
            # 如果当前字符是左括号，将其压入栈中
            if c == '(':
                stack = stack + c
            # 如果当前字符是右括号，弹出栈中的操作符并添加到后缀表达式，直到遇到左括号为止
            elif c == ')':
                while stack[-1] != '(':
                    # 将栈顶字符添加到后缀表达式中
                    postfix = postfix + stack[-1]
                    # 删除栈顶字符
                    stack = stack[:-1]
                stack = stack[:-1]  # 弹出左括号
            # 如果当前字符是操作符，将栈中优先级高于或等于当前操作符的操作符弹出，并加入后缀表达式
            # 然后将当前操作符压入栈中
            elif c in operators:
                while stack and operators.get(c, 0) <= operators.get(stack[-1], 0):
                    postfix, stack = postfix + stack[-1], stack[:-1]
                stack = stack + c
            # 如果当前字符是操作数（即非操作符或括号），直接将其添加到后缀表达式中
            else:
                postfix = postfix + c
        # 遍历完所有字符后，将栈中剩余的操作符弹出，并加入后缀表达式
        while stack:
            postfix, stack = postfix + stack[-1], stack[:-1]
        return postfix