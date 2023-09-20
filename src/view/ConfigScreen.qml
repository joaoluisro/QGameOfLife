import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11

Item {
    signal confirmChange
    Rectangle{
        id: backgroundMenu
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color:"#1a1a1a"

    }

    Column{
        id: configCol

        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.10
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: parent.height * 0.10
        Item {
            width: backgroundMenu.width
            height: 100
            Text{
                id: textX
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Number of horizontal Tiles"
                color:"white"
            }
            SpinBox{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: textX.bottom
                anchors.topMargin: 25
                id: numberOfTilesX
            }
        }
        Item {
            width: backgroundMenu.width
            height: 100
            Text{
                id: textY
                anchors.horizontalCenter: parent.horizontalCenter
                text: "Number of vertical Tiles"
                color:"white"
            }
            SpinBox{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: textY.bottom
                anchors.topMargin: 25
                id: numberOfTilesY
            }
        }


    }

    Button{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.10
        anchors.horizontalCenter: parent.horizontalCenter
        text:"Confirm"
        onClicked: confirmChange()
    }

}
