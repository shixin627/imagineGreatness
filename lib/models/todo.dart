enum TodoState {
  unAchieved,
  achieved,
}

class Todo {
  String content;
  TodoState state;
  Todo({this.content, this.state: TodoState.unAchieved});

  Todo updateWith({String content, TodoState state}) {
    if (content != null && content != this.content) this.content = content;
    if (state != null) this.state = state;
    return this;
  }
}
