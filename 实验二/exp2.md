```c++
NFA Atom(char c){
	//新节点
	Node startNode = new_node();
	Node endNode = new_node();
	//新边
	Edge newEdge;
	newEdge.Begin = startNode;
	newEdge.End = endNode;
	newEdge.Thro = c;
	//新NFA
	NFA newElem;
	newElem.NumOfEdge = 0;
	newElem.edgeSet[newElem.NumOfEdge++] = newEdge;
	newElem.Begin = newElem.edgeSet[0].Begin;
	newElem.End = newElem.edgeSet[0].End;
	return newElem;
}

```

```c++
NFA Join(NFA fir, NFA sec){
	//将fir的结束状态和sec的开始状态合并，将sec的边复制给fir，将fir返回
	//将sec中所有以StartState开头的边全部修改
	for (int i = 0; i < sec.NumOfEdge; i++) {
		if (sec.edgeSet[i].Begin.nodeName.compare(sec.Begin.nodeName) == 0) {
			sec.edgeSet[i].Begin = fir.End; //该边的开始状态就是NFA(b)的起始状态
		} else if (sec.edgeSet[i].End.nodeName.compare(sec.Begin.nodeName) == 0) {
			sec.edgeSet[i].End = fir.End; //该边的结束状态就是NFA(a)的起始状态
		}
	}
	sec.Begin = fir.End;
	elem_copy(fir, sec);
	//将fir的结束状态更新为sec的结束状态
	fir.End = sec.End;
	return fir;
}
```

```c++
NFA Unit(NFA fir, NFA sec) {
	NFA newElem;
	newElem.NumOfEdge = 0;
	Edge edge1, edge2, edge3, edge4;
	//获得新的状态结点
	Node startNode = new_node();
	Node endNode = new_node();
	//连接新起点和AB的起点A
	edge1.Begin = startNode;
	edge1.End = fir.Begin;
	edge1.Thro = '#';
	//连接新起点和CD的起点C）
	edge2.Begin = startNode;
	edge2.End = sec.Begin;
	edge2.Thro = '#';
	//连接AB的终点和新终点
	edge3.Begin = fir.End;
	edge3.End = endNode;
	edge3.Thro = '#';
	//连接CD的终点和新终点
	edge4.Begin = sec.End;
	edge4.End = endNode;
	edge4.Thro = '#';
	//将fir和sec合并
	elem_copy(newElem, fir);
	elem_copy(newElem, sec);
	//新构建的4条边
	newElem.edgeSet[newElem.NumOfEdge++] = edge1;
	newElem.edgeSet[newElem.NumOfEdge++] = edge2;
	newElem.edgeSet[newElem.NumOfEdge++] = edge3;
	newElem.edgeSet[newElem.NumOfEdge++] = edge4;
	newElem.Begin = startNode;
	newElem.End = endNode;
	return newElem;
}
```

```c++
NFA Star(NFA Elem) {
	NFA newElem;
	newElem.NumOfEdge = 0;
	Edge edge1, edge2, edge3, edge4;
	//获得新状态节点
	Node startNode = new_node();
	Node endNode = new_node();
	//e1
	edge1.Begin = startNode;
	edge1.End = endNode;
	edge1.Thro = '#';
	//e2
	edge2.Begin = Elem.End;
	edge2.End = Elem.Begin;
	edge2.Thro = '#';
	//e3
	edge3.Begin = startNode;
	edge3.End = Elem.Begin;
	edge3.Thro = '#';
	//e4
	edge4.Begin = Elem.End;
	edge4.End = endNode;
	edge4.Thro = '#';
	//构建单元
	elem_copy(newElem, Elem);
	//将新构建的四条边加入EdgeSet
	newElem.edgeSet[newElem.NumOfEdge++] = edge1;
	newElem.edgeSet[newElem.NumOfEdge++] = edge2;
	newElem.edgeSet[newElem.NumOfEdge++] = edge3;
	newElem.edgeSet[newElem.NumOfEdge++] = edge4;
	//构建NewElem的初态和终态
	newElem.Begin = startNode;
	newElem.End = endNode;
	return newElem;
}
```

```c++
NFA express_to_NFA(string expression) {
	int length = expression.size();
	char element;
	NFA Elem, fir, sec;
	stack<NFA> STACK;
	for (int i = 0; i < length; i++) {
		element = expression.at(i);
		switch (element) {
		case '|':
			sec = STACK.top();
			STACK.pop();
			fir = STACK.top();
			STACK.pop();
			Elem = Unit(fir, sec);
			STACK.push(Elem);
			break;
		case '*':
			fir = STACK.top();
			STACK.pop();
			Elem = Star(fir);
			STACK.push(Elem);
			break;
		case '+':
			sec = STACK.top();
			STACK.pop();
			fir = STACK.top();
			STACK.pop();
			Elem = Join(fir, sec);
			STACK.push(Elem);
			break;
		default:
			Elem = Atom(element);
			STACK.push(Elem);
		}
	}
	cout << "已将正则表达式转换为NFA!" << endl;
	Elem = STACK.top();
	STACK.pop();
	return Elem;
}
```

```c++
class Check {
public:
	Check() {};
	
	bool isletter(char ch) {
		if ((ch >= 'a' && ch <= 'z' )||( ch >= 'A' && ch <= 'Z')) {
			return true;
		}
		else {
			return false;
		}
	}
	
	bool islegal(string s) {
		int Lbracket = 0;
		int Rbracket = 0;
		Check r;
		for (int i = 0; i < int(s.length()); i++) {
			char ch = s[i];
			if (ch == '*' || ch == '|' || ch == '.') {
				continue;
			}
			//数字不考虑判断
			else if (ch >= 0 && ch <= 9) {
				continue;
			}
			else if (r.isletter(ch)) {
				continue;
			}
			else if (ch == '(') {
				Lbracket++;
			}
			else if (ch == ')') {
				Rbracket++;
			}
			else {
				return false;
			}
		}
		if (Lbracket != Rbracket) {
			return false;
		}
		else {
			return true;
		}
	}
};

		if(r.islegal(Regular_Expression)){
			cout<<"输入的正规式合法！"<<endl;
```

```python
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
```

