import graphviz
class MIN_DFA:
    def __init__(self, dfa):
        self.dfa = dfa
        self.states = self.dfa2min(dfa)
    # 返回状态对应key
    def getGroupKeys(self, group):
        keys = []
        for state in group:
            for key, value in state.items():
                keys.append(key)
        return keys
    # 从DFA转换为最小化的DFA
    def dfa2min(self, dfa):
        states = dfa.toDict()
        symbols = dfa.getSymbols()
        # 移除DFA中的初态
        states.pop('startingState')
        groups = []
        final_states = []
        non_final_states = []
        # 遍历所有状态，根据是否是终止状态进行分组
        for key, value in states.items():
            if value["isTerminatingState"] == True:
                final_states.append({key: value})
            else:
                non_final_states.append({key: value})
        groups.append(final_states)
        groups.append(non_final_states)
        # 对每个分组进行拆分，直到没有更多的拆分，如果分组中的某个状态在某个符号上具有不同的转移目标，则将该组拆分成两个组
        split = True #是否拆分标志
        while split:
            split = False 
            for i, group in enumerate(groups):
                if not group:
                    continue 
                targetGroups = {} #用于存储每个符号的目标分组
                first_state = next(iter(group))# 获取当前分组中的第一个状态
                # 遍历第一个状态的转移，获取每个符号对应的目标分组
                for key, value in first_state.items():
                    for symbol in symbols:
                        if symbol in value:
                            targetGroups[symbol] = [j for j, group in enumerate(groups) if value[symbol] in self.getGroupKeys(group)][0]  # {key1, key2}
                splitted_states = [] # 存储被拆分出来的状态
                for k, state in enumerate(group):
                    outputGroups = {} # 存储该状态的转移目标分组
                    for key, value in state.items():
                        for symbol in symbols:
                            if symbol in value:
                                List = [j for j, group in enumerate(groups) if value[symbol] in self.getGroupKeys(group)]
                                outputGroups[symbol] = List[0]
                    # 如果当前状态的转移目标与第一个状态的转移目标不同，则拆分该状态
                    if outputGroups != targetGroups:
                        split = True
                        splitted_states.append(state)
                # 如果当前分组被拆分，更新groups列表
                if len(splitted_states) > 0:
                    groups.insert(i+1, list(splitted_states))
                    groups[i] = [state for state in group if state not in splitted_states]        
        # 将拆分后的分组合并并生成新的状态
        newGroups = self.concatStates(groups)
        return newGroups

    #合并状态，将每个分组的状态重命名为组号
    def concatStates(self, groups):
        # 为每个状态组创建一个哈希表，键是组号
        hashTable = {}
        for g, group in enumerate(groups):
            # 为组中的每个状态重新命名为组号
            for state in group:
                for key, value in state.items():
                    hashTable[key] = str(g)
        
        # 创建一个新的字典，表示新的状态组
        newGroups = {'startingState':0}
        groupCopy = groups.copy()
        
        # 遍历所有的组
        for g, group in enumerate(groupCopy):
            # 遍历组中的状态
            for state in group:
                # 遍历组中的状态的转移
                for key, value in state.items():
                    # 如果目标状态属于另一个组，将其替换为组号
                    for symbol, next_state in value.items():
                        if next_state in hashTable:
                            value[symbol] = str(hashTable[next_state])
                            newGroups[str(g)] = value
        return newGroups

    # 导出最小化后的DFA
    def toDict(self):
        return self.states
    #可视化
    def visualize(self, name='output/min.gv', view=False):
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
        graph.render("output/min", view=False)
