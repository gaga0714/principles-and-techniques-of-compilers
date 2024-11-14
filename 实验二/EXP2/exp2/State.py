class State:
    def __init__(self, label, transitions=[], parents=[], is_start=False, is_accept=True):
        self.label = label
        self.parents = []#父状态列表
        self.transitions = []#转移状态列表
        self.is_start = is_start
        self.is_accept = is_accept
    #添加转移状态
    def add_transition(self, symbol, state):
        self.transitions.append((symbol, state))
        self.is_accept = False
        state.parents.append(self)

    #返回父状态
    def get_parents(self):
        return self.parents.copy()