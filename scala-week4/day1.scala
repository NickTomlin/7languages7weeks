// Create a game of tic tac toe
class Board(state: Array[Array[String]] =
            Array(
                Array("_","_","_"),
                Array("_","_","_"),
                Array("_","_","_"))
) {
    val PLACEHOLDER = "_"
    def move(piece: String, row: Int, column: Int) {
        println("moving: ", state(row)(column))
        state(row)(column) = piece
        println("to: ", state(row)(column))
    }

    def vertical(column: Int): Boolean = {
        val start = state(0)(column)
        val mid = state(1)(column)
        val end = state(2)(column)

        start != PLACEHOLDER && start == mid && mid == end
    }

    def horizontal(row: Int): Boolean = {
        val start = state(row)(0)
        val mid = state(row)(1)
        val end = state(row)(2)

        start != PLACEHOLDER && start == mid && start == end
    }

    def diagonal(): Boolean = {
        val mid = state(1)(1)
        if (mid == PLACEHOLDER) return false
        val topLeft = state(0)(0)
        val botRight = state(2)(2)

        val topRight = state(0)(2)
        val botLeft = state(2)(0)

        return (topLeft == mid && botRight == mid) || (topRight == mid && botLeft == mid)
    }

    def getWinner(): String = {
        if (diagonal) return state(1)(1)

        // why the assignment here?
        val x = (0 until 3).foreach { i =>
            if (vertical(i)) {
                return state(0)(i)
            }
            if (horizontal(i)) {
                return state(i)(0)
            }
        }

        // if (tie()) return "tie"

        // check for tie?
        return PLACEHOLDER
    }

    def checkState() {
        val winner = getWinner()
        // case statement this
        if (winner == "_") {
            println("continue")
        } else if (winner == "tie"){
            println("tie")
        } else {
            println(winner + " has won.")
        }
    }
}

var b = new Board()

b.move("X", 1, 1)
b.move("X", 0 ,0)
b.move("X", 2 ,2)
b.winning()
