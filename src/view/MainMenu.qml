import QtQuick 2.15
import QtQuick.Controls 2.15

Item {

    signal play
    signal changeConfig
    Rectangle{
        id: backgroundMenu
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color:"#1a1a1a"
    }

    Text{
        id: title
        text: "John Conway's Game of life"
        font.pixelSize: 36
        color:"white"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1
    }

    Column{
        anchors.top: title.bottom
        anchors.centerIn: parent
        spacing: parent.width * 0.10

        Button{

            id: playButton
            text:"Play"
            onPressed: play()

        }

        Button{
            id: configButton
            text:"Config"
            onPressed: changeConfig()

        }
    }

}
