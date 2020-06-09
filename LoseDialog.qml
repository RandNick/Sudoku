import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

Window {
    title: "Проверка"
    visible: false

    width: 350
    minimumWidth:350
    maximumWidth:350

    height: 100
    minimumHeight: 100
    maximumHeight: 100

    signal quit()
    signal newGameB()

    Text {
        x: 20
        y: 12
        text: "Что-то пошло не так, где-то ошибка..."
        font.pointSize: 11
    }

    Button {
        y: 50
        width: 99
        height: 50
        id: newGameButton
        text: "Новая игра"
        onClicked: newGameB()
    }
    Rectangle {
        width: 1
        height: 50
        y: 50
        x: 99
        color: "black"
    }
    Button {
        x: 100
        y: 50
        width: 150
        height: 50
        id: closeButton
        text: "Вернуться к решению"
        onClicked: close()
    }
    Rectangle {
        width: 1
        height: 50
        y: 50
        x: 250
        color: "black"
    }
    Button {
        x: 251
        y: 50
        width: 99
        height: 50
        id: quitButton
        text: "Выход"
        onClicked: quit()
    }
    Rectangle {
        width: 350
        height: 1
        y: 50
        color: "black"
    }
}
