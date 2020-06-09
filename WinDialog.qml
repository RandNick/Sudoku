import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Window 2.12

Window {
    title: "Проверка"
    visible: false

    width: 300
    minimumWidth:300
    maximumWidth:300

    height: 100
    minimumHeight: 100
    maximumHeight: 100

    signal quit()
    signal newGameB()

    Text {
        x: 12
        y: 12
        text: "Поздравляем! Всё правильно."
        font.pointSize: 12
    }

    Button {
        y: 50
        width: 149
        height: 50
        id: newGameButton
        text: "Новая игра"
        onClicked: newGameB()
    }
    Rectangle {
        width: 1
        height: 50
        y: 50
        x: 149
        color: "black"
    }
    Button {
        x: 150
        y: 50
        width: 150
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
