class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard()
    this.bindEvents()
  }

  bindEvents() {
    $("ul").on('click', () => {
      let $square = $(event.target)
      this.makeMove($square)
    });
  }
  
  makeMove($square) {
    let input = this.game.currentPlayer
    let pos = $square.data("pos")
    try {
      this.game.playMove(pos);
      $square.html(input)
      $square.addClass(input)
    } catch (e) {
      alert(e.msg);
    }
    
    if (this.game.isOver()) {
      if (this.game.winner()) {
        alert(`${this.game.winner()} WINS!`)
      } else {
        alert("Tie Game!")
      }
      location.reload()
    }
  }


  setupBoard() {
    const $grid = $("<ul>");
    for (let row = 0; row < 3; row++) {
      for (let col = 0; col < 3; col++) {
        const $cell = $("<li>");
        $cell.data("pos", [row, col])
        $grid.append($cell)
      }
    }
    this.$el.append($grid)
  }
}

module.exports = View;
