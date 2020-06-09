import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12

Window {
    id: w
    visible: true
    minimumWidth: 900
    maximumWidth: 900
    width: 900

    minimumHeight: cl.height
    maximumHeight: cl.height
    height: cl.height

    title: qsTr("Судоку")

    ColumnLayout {
        id: cl
        anchors.centerIn: w.contentItem
        spacing: 0
        Gameplay {
            id: gameplay
        }
        Toolbar {
            id: toolbar
            onNewGame: gameplay.newGame()
            onCheck: gameplay.check()
            onQuitApp: Qt.quit()
        }
    }
}
