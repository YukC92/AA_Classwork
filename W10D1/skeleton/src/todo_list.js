let toDoForm = document.querySelector('.add-todo-form');//from <form>
let todoList = document.querySelector('.todos'); //from <ul>
let todos = []

function addTodo(e) {
    e.preventDefault();
  let output = document.querySelector('[name=add-todo]').value;
    let todo = {
        output, //value of add-todo;
        done: false
    }
    // debugger
    todos.push(todo)
    e.currentTarget.reset();
    populateList(todos, todoList);
}

toDoForm.addEventListener('submit', addTodo); //that's the event(e) submit

function populateList(todos = [], todoList) {
  todoList.innerHTML = todos.map((todo, i) => {
    return `
        <li>
            <input type = "checkbox" value="${todo.done ? "checked" : ""}">
            <label>${i}. :${todo.output}</label>
        </li>
    `
  })
}