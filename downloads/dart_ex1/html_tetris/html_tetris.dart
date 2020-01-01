// 滑鼠點選繪圖區後, 利用方向鍵以及 spacebar 控制
import 'dart:html';
import 'dart:async';
import 'dart:math';


void main() => Game().start();

class Block {
  List<Tile> tiles = List<Tile>(4);
  Tile rotationTile;
  String color;

  void move(String direction) {
    switch (direction) {
      case 'left':
        tiles.forEach((t) => t.x -= 1);
        break;
      case 'right':
        tiles.forEach((t) => t.x += 1);
        break;
      case 'up':
        tiles.forEach((t) => t.y -= 1);
        break;
      case 'down':
        tiles.forEach((t) => t.y += 1);
        break;
    }
  }

  rotateRight() {
    tiles.forEach((tile) {
      int x = tile.x;
      tile.x = rotationTile.x - tile.y + rotationTile.y;
      tile.y = rotationTile.y + x - rotationTile.x;
    });
  }

  rotateLeft() {
    tiles.forEach((tile) {
      int x = tile.x;
      tile.x = rotationTile.x + tile.y - rotationTile.y;
      tile.y = rotationTile.y - x + rotationTile.x;
    });
  }
}

// (0, 1), (1, 1), (2, 1), (3, 1)
// (1, 0), (1, 1), (1, 2), (1, 3)


class IBlock extends Block {
  IBlock(int width) {
    tiles[0] = Tile((width / 2 - 2).floor(), -1);
    tiles[1] = Tile((width / 2 - 1).floor(), -1);
    tiles[2] = Tile((width / 2).floor(), -1);
    tiles[3] = Tile((width / 2 + 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'cyan';
  }
}

// ====

class OBlock extends Block {
  OBlock(int width) {
    tiles[0] = Tile((width / 2).floor(), -1);
    tiles[1] = Tile((width / 2 + 1).floor(), -1);
    tiles[2] = Tile((width / 2).floor(), 0);
    tiles[3] = Tile((width / 2 + 1).floor(), 0);
    rotationTile = tiles[1];
    color = 'yellow';
  }
}

// ==
// ==

class JBlock extends Block {
  JBlock(int width) {
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width / 2 + 1).floor(), 0);
    tiles[3] = Tile((width / 2 - 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'blue';
  }
}

// =
// ===

class LBlock extends Block {
  LBlock(int width) {
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width / 2 + 1).floor(), 0);
    tiles[3] = Tile((width / 2 + 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'orange';
  }
}

//   =
// ===

class TBlock extends Block {
  TBlock(int width) {
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width / 2 + 1).floor(), 0);
    tiles[3] = Tile((width / 2).floor(), -1);
    rotationTile = tiles[1];
    color = 'purple';
  }
}

//  =
// ===

class ZBlock extends Block {
  ZBlock(int width) {
    tiles[0] = Tile((width / 2 - 1).floor(), 0);
    tiles[1] = Tile((width / 2).floor(), 0);
    tiles[2] = Tile((width / 2).floor(), -1);
    tiles[3] = Tile((width / 2 + 1).floor(), -1);
    rotationTile = tiles[1];
    color = 'red';
  }
}

// ==
//  ==

class SBlock extends Block {
  SBlock(int width) {
    tiles[0] = Tile((width / 2 - 1).floor(), -1);
    tiles[1] = Tile((width / 2).floor(), -1);
    tiles[2] = Tile((width / 2).floor(), 0);
    tiles[3] = Tile((width / 2 + 1).floor(), 0);
    rotationTile = tiles[1];
    color = 'green';
  }
}

//  ==
// ==


class Tile {
  int x;
  int y;

  Tile(
    int x,
    int y,
  )   : this.x = x,
        this.y = y;
}

class Game {
  CanvasElement board;
  Element gameScore;
  Block currentBlock;

  static int width = 10;
  static int height = 20;
  static int cellSize = 30;

  static int linesCleared;
  static CanvasRenderingContext2D ctx;

  static List<List<int>> boardState;
  static List<int> rowState;

  Game() {
    linesCleared = 0;
    gameScore = Element.div()..id = "score";

    rowState = List<int>.filled(height, 0);
    boardState = List<int>(width)
        .map(
          (_) => List<int>.filled(height, 0),
        )
        .toList();
  }

  Block getRandomPiece() {
    int randomInt = Random().nextInt(7);
    switch (randomInt) {
      case 0:
        return IBlock(width);
      case 1:
        return OBlock(width);
      case 2:
        return JBlock(width);
      case 3:
        return TBlock(width);
      case 4:
        return LBlock(width);
      case 5:
        return ZBlock(width);
      case 6:
        return SBlock(width);
    }
    return Block();
  }

  void clearRows() {
    for (int idx = 0; idx < rowState.length; idx++) {
      int row = rowState[idx];

      if (row == width) {
        ImageData imageData =
            ctx.getImageData(0, 0, cellSize * width, cellSize * idx);
        ctx.putImageData(imageData, 0, cellSize);

        for (int y = idx; y > 0; y--) {
          for (int x = 0; x < width; x++) {
            boardState[x][y] = boardState[x][y - 1];
          }
          rowState[y] = rowState[y - 1];
        }

        rowState[0] = 0;
        boardState.forEach((c) => c[0] = 0);
        linesCleared++;
      }
    }
  }

  //[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  //[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,7,4,10]
  //[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,7,4]

  //      0        1        2        3
  // [[0,0,0,0][0,0,0,0][0,0,0,0][0,0,0,0]]
  // [[0,0,0,1][0,0,1,1][0,1,1,1][0,0,1,1]]
  // [[0,0,0,0][0,0,0,1][0,0,1,1][0,0,0,1]]

  bool validMove() {
    for (Tile tile in currentBlock.tiles) {
      if (tile.x >= width ||
          tile.x < 0 ||
          tile.y >= height ||
          tile.y < 0 ||
          boardState[tile.x][tile.y] == 1) {
        return false;
      }
    }
    return true;
  }

  bool pieceMoving(String s) {
    bool pieceIsMoving = true;

    ctx.fillStyle = 'grey';

    currentBlock.tiles.forEach((Tile tile) {
      // to clear the edges
      // Draw outline for each cell
      ctx.beginPath();
      ctx.lineWidth = 2;
      ctx.strokeStyle = 'grey';
      ctx.moveTo(tile.x* cellSize, tile.y*cellSize);
      ctx.lineTo(tile.x* cellSize + cellSize, tile.y*cellSize);
      ctx.lineTo(tile.x* cellSize + cellSize, tile.y*cellSize + cellSize);
      ctx.lineTo(tile.x* cellSize, tile.y*cellSize + cellSize);
      ctx.lineTo(tile.x* cellSize, tile.y*cellSize);
      ctx.closePath();
      ctx.stroke();
      // to clear the previous cell
      ctx.fillRect(
        tile.x * cellSize,
        tile.y * cellSize,
        cellSize,
        cellSize,
      );
    });

    if (s == 'rotate') {
      currentBlock.rotateRight();
    } else {
      currentBlock.move(s);
    }

    if (!(pieceIsMoving = validMove())) {
      if (s == 'rotate') currentBlock.rotateLeft();
      if (s == 'left') currentBlock.move('right');
      if (s == 'right') currentBlock.move('left');
      if (s == 'down') currentBlock.move('up');
      if (s == 'up') currentBlock.move('down');
    }

    ctx.fillStyle = currentBlock.color;

    currentBlock.tiles.forEach((tile) {
      
      // Draw outline for each cell
      ctx.beginPath();
      ctx.lineWidth = 2;
      ctx.strokeStyle = "#grey";
      ctx.moveTo(tile.x* cellSize, tile.y*cellSize);
      ctx.lineTo(tile.x* cellSize + cellSize, tile.y*cellSize);
      ctx.lineTo(tile.x* cellSize + cellSize, tile.y*cellSize + cellSize);
      ctx.lineTo(tile.x* cellSize, tile.y*cellSize + cellSize);
      ctx.lineTo(tile.x* cellSize, tile.y*cellSize);
      ctx.closePath();
      ctx.stroke();
      
      ctx.fillRect(
        tile.x * cellSize,
        tile.y * cellSize,
        cellSize,
        cellSize,
      );
    });

    return pieceIsMoving;
  }

  void updateGame(Timer timer) {
    window.console.log(boardState);
    window.console.log(rowState);
    gameScore.setInnerHtml(
      "<p>Score: ${linesCleared} Lines</p>",
    );

    if (!pieceMoving('down')) {
      currentBlock.tiles.forEach((t) {
        boardState[t.x][t.y] = 1;
        rowState[t.y]++;
      });
      clearRows();
      currentBlock = getRandomPiece();
      if (!pieceMoving('down')) {
        timer.cancel();
      }
    }
  }

  void initializeCanvas() {
    board = Element.html('<canvas/>');
    board.width = width * cellSize;
    board.height = height * cellSize;
    ctx = board.context2D;

    ctx.fillStyle = 'grey';
    ctx.fillRect(0, 0, board.width, board.height);
  }

  void handleKeyboard(Timer timer) {
    document.onKeyDown.listen((event) {
      if (timer.isActive) {
        // 37 is left arrow key
        if (event.keyCode == 37) pieceMoving('left');
        // 38 is up arrow key
        if (event.keyCode == 38) pieceMoving('rotate');
        // 39 is right arrow key
        if (event.keyCode == 39) pieceMoving('right');
        // 40 is down arrow key
        if (event.keyCode == 40) pieceMoving('down');
        // 32 is spacebar key
        if (event.keyCode == 32) while (pieceMoving('down')) {}
      }
    });
  }

  void start() {
    initializeCanvas();

    Element entryPoint = querySelector('#tetris_output');

    entryPoint.nodes.add(board);
    entryPoint.nodes.add(gameScore);

    Timer timer = Timer.periodic(
      Duration(milliseconds: 500),
      updateGame,
    );

    currentBlock = getRandomPiece();
    handleKeyboard(timer);
  }
}
