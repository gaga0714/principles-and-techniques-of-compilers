import graphviz
from State import State 
class NFA:
    #构造NFA
    def __init__(self, start=None, accept=None, postfix=None):
        self.start = start
        self.accept = accept
        #传入正则表达式则使用postfix2nfa构造NFA
        if not start and not accept and postfix:
            obj = self.postfix2nfa(postfix)
            self.start = obj.start
            self.accept = obj.accept
    # 根据label获取状态
    def getStateByLabel(self, label):
        for state in self.getStates():
            if state.label == label:
                return state
        return None
    #根据labels列表获取状态
    def getStatesByLabel(self, labels):
        labels = labels.split()
        statesList = []
        for label in labels:
            for state in self.getStates():
                if state.label == label:
                    statesList.append(state)
        return statesList
    #检查是否为终态
    def checkIfAcceptingState(self, states):
        for state in states:
            if state.is_accept:
                return True
        return False
    #获取状态，使用广度优先搜索（BFS）从初态开始遍历
    def getStates(self):
        visited = set()
        states = []
        queue = [self.start]
        visited.add(self.start)
        while queue:
            state = queue.pop(0)
            states.append(state)
            for (transition) in state.transitions:
                if transition[1] not in visited:
                    visited.add(transition[1])
                    queue.append(transition[1])
        return states
    #获取NFA中的所有符号（除空）
    def getSymbols(self):
        states = self.getStates()
        symbols = set()
        for state in states:
            for symbol, next_state in state.transitions:
                if symbol != 'ϵ':
                    symbols.add(symbol)
        return list(symbols)
    #用堆栈操作实现将后缀正则表达式转换为NFA
    def postfix2nfa(self, postfix):
        nfaStack = []
        i = 0
        for c in postfix:
            if c == '*':
                nfa1 = nfaStack.pop()
                start, accept = State('S' + str(i)), State('S' + str(i + 1))
                start.add_transition('ϵ', nfa1.start)
                start.add_transition('ϵ', accept)
                nfa1.accept.add_transition('ϵ', start)
                nfa1.accept.add_transition('ϵ', accept)
                nfaStack.append(NFA(start, accept))
                i += 2
            elif c == '.':
                nfa2, nfa1 = nfaStack.pop(), nfaStack.pop()
                nfa1.accept.add_transition('ϵ', nfa2.start)
                nfaStack.append(NFA(nfa1.start, nfa2.accept))
            elif c == '|':
                nfa2, nfa1 = nfaStack.pop(), nfaStack.pop()
                start, accept = State('S' + str(i)), State('S' + str(i + 1))
                start.add_transition('ϵ', nfa1.start)
                start.add_transition('ϵ', nfa2.start)
                nfa1.accept.add_transition('ϵ', accept)
                nfa2.accept.add_transition('ϵ', accept)
                nfaStack.append(NFA(start, accept))
                i += 2
            elif c == '+':
                nfa1 = nfaStack.pop()
                start, accept = State('S' + str(i)), State('S' + str(i + 1))
                start.add_transition('ϵ', nfa1.start)
                nfa1.accept.add_transition('ϵ', start)
                nfa1.accept.add_transition('ϵ', accept)
                nfaStack.append(NFA(start, accept))
                i += 2
            elif c == '?':
                nfa1 = nfaStack.pop()
                start, accept = State('S' + str(i)), State('S' + str(i + 1))
                start.add_transition('ϵ', nfa1.start)
                start.add_transition('ϵ', accept)
                nfa1.accept.add_transition('ϵ', accept)
                nfaStack.append(NFA(start, accept))
                i += 2
            else:
                start, accept = State('S' + str(i)), State('S' + str(i + 1))
                start.add_transition(c, accept)
                nfaStack.append(NFA(start, accept))
                i += 2
        return nfaStack.pop()
    # 将NFA转化为字典表示，便于可视化和打印。每个状态的转换信息被记录下来，并标明是否为接受状态。
    def toDict(self):
        states = {}
        for state in self.getStates():
            state_dict = {
                'isTerminatingState': state.is_accept,
            }
            for char, next_state in state.transitions:
                if char not in state_dict:
                    state_dict[char] = next_state.label
                else:
                    state_dict[char] += ',' + next_state.label
            states[state.label] = state_dict

        return {
            'startingState': self.start.label,
            **states,
        }
    #可视化NFA
    def visualize(self, name='output/nfa', view=False):
        nfa_json = self.toDict()
        graph = graphviz.Digraph(engine='dot')
        for state, transitions in nfa_json.items():
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
        graph.render(name, view=view)
        return graph
