import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

GridLayout{
    id: gl
    height: 900
    width: 900

    columns: 9
    rows: 9

    columnSpacing: 0
    rowSpacing: 0

    function newGame() {
        const newGameConfigs = helper.newGame()
        for (let i = 0; i < newGameConfigs.length; i++)
        {
            bricks.itemAt(i).config = newGameConfigs[i]
            if (bricks.itemAt(i).config > 0)
                bricks.itemAt(i).col = true
        }
    }

    function check() {
        const brickConfigs = []
        for(let i = 0; i < bricks.count; i++)
            brickConfigs.push(bricks.itemAt(i).config)
        const brickCheck = helper.check(brickConfigs)
        if (brickCheck === true)
            win.visible = true
        else
            lose.visible = true
    }

    Repeater{
        id: bricks
        model: 81

        Brick {
        }
    }

    Item {
        Rectangle {
            x: 297
            y: 0
            width: 5
            height: 900
            color: "black"
        }

        Rectangle {
            x: 597
            y: 0
            width: 5
            height: 900
            color: "black"
        }

        Rectangle {
            x: 0
            y: 297
            width: 900
            height: 5
            color: "black"
        }

        Rectangle {
            x: 0
            y: 597
            width: 900
            height: 5
            color: "black"
        }
    }

    Component.onCompleted: {
        newGame()
   }

    LoseDialog {
        id: lose
        onNewGameB:
        {
            newGame()
            visible = false
        }

        onQuit: Qt.quit()
    }

    WinDialog {
        id: win
        onNewGameB:
        {
            newGame()
            visible = false
        }
        onQuit: Qt.quit()
    }
}
