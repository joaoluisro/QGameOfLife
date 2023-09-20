import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    signal exitGame
    Rectangle{
        id: backgroundMenu
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color:"#1a1a1a"
    }

    Button{
        text:"Exit"
        onClicked: exitGame()
    }
}
