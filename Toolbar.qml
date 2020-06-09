import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

RowLayout {
    signal newGame()
    signal check()
    signal quitApp()
    spacing: 0

    Button {
        id: newGameButton
        Layout.minimumWidth: 300
        text: "Новая игра"
        font.pointSize: 20
        onClicked: newGame()
    }
    Rectangle {
        Layout.minimumWidth: 1
        Layout.minimumHeight: 52
        color: "black"
    }
    Button {
        id: checkButton
        Layout.minimumWidth: 298
        text: "Проверка"
        font.pointSize: 20
        onClicked: check()
    }
    Rectangle {
        Layout.minimumWidth: 1
        Layout.minimumHeight: 52
        color: "black"
    }
    Button {
        id: quitButton
        Layout.minimumWidth: 300
        text: "Выход"
        font.pointSize: 20
        onClicked: quitApp()
    }
    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: ["Ctrl+N"]
        onActivated: newGame()
    }
    Shortcut {
        context: Qt.ApplicationShortcut
        sequences: [StandardKey.Close,"Ctrl+Q"]
        onActivated: quitApp()
    }
}
