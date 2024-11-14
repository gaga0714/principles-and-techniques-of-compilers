import graphviz
from collections import deque


class DFA:
    #初始化
    def __init__(self, nfa):
        self.nfa = nfa
        self.states = self.nfa2dfa(nfa)
    # 返回状态、nfa的符号集
    def getStateByLabel(self, label):
        return self.nfa.getStateByLabel(label)
    def getStatesByLabel(self, labels):
        return self.nfa.getStatesByLabel(labels)
    def getSymbols(self):
        return self.nfa.getSymbols()
    # 计算给定状态集合的 ε-闭包，使用栈遍历每个状态，并通过 ε 转移递归地找到所有相关状态
    def epsilonClosure(self, states):
        closure = set(states)
        stack = list(states)
        while stack:
            state = stack.pop()
            for symbol, next_state in state.transitions:
                if next_state not in closure:
                    if symbol == "ϵ":
                        closure.add(next_state)
                        stack.append(next_state)
        # 将集合转换为列表
        closureList =  list(closure)
        # 对列表进行排序
        closureList.sort(key=lambda x: x.label)
        # 转换为字符串表示
        closureString = ''
        for state in closureList:
            closureString += ' ' + state.label
        # 去掉开头的空格
        return closureString[1:]

    def move(self, nfa, states, symbol):
        move_states = set()
        # 将字符串转换为列表
        statesList = states.split()
        # 将标签列表转换为状态列表
        states = []
        for label in statesList:
            states.append(nfa.getStateByLabel(label))
        for state in states:
            for s, next_state in state.transitions:
                if s == symbol:
                    move_states.add(next_state)
        return move_states

    # 将NFA转换成DFA
    def nfa2dfa(self, nfa):
        nfaStates = nfa.getStates()
        symbols = nfa.getSymbols()
        # 计算NFA的起始状态的 ε-闭包，并将其作为DFA的起始状态
        start_state = self.epsilonClosure([nfaStates[0]])
        self.states = {'startingState': start_state}
        # 使用队列进行广度优先搜索（BFS）
        queue = deque([start_state])
        seen = set([start_state])
        while queue:
            current_state = queue.popleft()
            for symbol in symbols:
                next_states = self.epsilonClosure(self.move(nfa, current_state, symbol))
                # 如果没有状态转移，跳过此符号
                if next_states == '' or next_states == ' ':
                    continue
                # 如果新的状态集合之前没有出现过，加入队列并记录已见状态
                if next_states not in seen:
                    queue.append(next_states)
                    seen.add(next_states)
                self.states.setdefault(current_state, {})[symbol] = next_states
            self.states.setdefault(current_state, {})['isTerminatingState'] = nfa.checkIfAcceptingState(nfa.getStatesByLabel(current_state))
        return self.states
    # 转字典
    def toDict(self):
        return self.states.copy()
    #可视化
    def visualize(self, name='output/dfa.gv', view=False):
        graph = graphviz.Digraph(engine='dot')
        for state, transitions in self.states.items():
            if state == 'startingState':
                continue
            if transitions['isTerminatingState']:
                graph.node(state, shape='doublecircle')
            else:
                graph.node(state, shape='circle')
            for char, next_state in transitions.items():
                if char == 'isTerminatingState':
                    continue
                children_states = next_state.split(',')
                for child in children_states:
                    graph.edge(state, child, label=char)
        graph.render("output/dfa", view=False)
