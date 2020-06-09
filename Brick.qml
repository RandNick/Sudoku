import QtQuick 2.12

Rectangle {
    height: 100
    width: 100

    property int config: 0
    property bool col: false

    border.width: 1
    border.color: "#3cb371"

    function change() {
        if (col == false)
        {
            config ++
            if (config == 10)
                config = 0
        }
    }

    Text {
        text: ("1")
        x: 27
        color: col ? "#000080" : ""
        font.pointSize: 47
        visible: parent.config == 1
    }
    Text {
        text: ("2")
        x: 27
        color: col ? "#000080" : ""
        font.pointSize: 47
        visible: parent.config == 2
    }
    Text {
        text: ("3")
        x: 27
        color: col ? "#000080" : ""
        font.pointSize: 47
        visible: parent.config == 3
    }
    Text {
        text: ("4")
        x: 27
        color: col ? "#000080" : ""
        font.pointSize: 47
        visible: parent.config == 4
    }
    Text {
        text: ("5")
        x: 27
        color: col ? "#000080" : ""
        font.pointSize: 47
        visible: parent.config == 5
    }
    Text {
        text: ("6")
        x: 27
        color: col ? "#000080" : ""
        font.pointSize: 47
        visible: parent.config == 6
    }
    Text {
        text: ("7")
        x: 27
        color: col ? "#000080" : ""
        font.pointSize: 47
        visible: parent.config == 7
    }
    Text {
        text: ("8")
        x: 27
        color: col ? "#000080" : ""
        font.pointSize: 47
        visible: parent.config == 8
    }
    Text {
        text: ("9")
        x: 27
        color: col ? "#000080" : ""
        font.pointSize: 47
        visible: parent.config == 9
    }

    MouseArea {
        anchors.fill: parent

        onClicked: {
            change()
        }
    }
}
