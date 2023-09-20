import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11

Item {
    signal confirmChange
    signal returnBtnPressed
    property var controller: GameController
    Rectangle{
        id: backgroundMenu
        anchors.fill: parent
        width: parent.width
        height: parent.height
        color:"#1a1a1a"

    }

    Button{
        id: returnBtn
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.10
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.05
        text:"Back"
        onClicked: returnBtnPressed()
    }

    Column{
        id: configCol

        anchors.top: returnBtn.top
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
                value: {controller.ui_horizontalTiles}
                from: 1
                to: 1024
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
                value: {controller.ui_verticalTiles}
                from: 1
                to: 1024
            }
        }
    }

    Button{
        id: confirmConfigBtn
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.10
        anchors.horizontalCenter: parent.horizontalCenter
        text:"Configure"
        onClicked: controller.configure({"horizontal" : numberOfTilesX.value,
                                         "vertical" : numberOfTilesY.value})
    }



}
