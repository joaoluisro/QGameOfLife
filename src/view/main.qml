import QtQuick 2.15
import QtQuick.Window 2.15

import QtQuick.Controls 2.15
Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("Game of Life")

    StackView{
        id:stackView
        initialItem: mainMenu
    }

    Component{
        id:mainMenu
        MainMenu{
            width:window.width
            height:window.height
            onPlay: stackView.push(playScreen)
            onChangeConfig: stackView.push(configScreen)
        }
    }

    Component{
        id:playScreen
        PlayScreen{
            width:window.width
            height:window.height
            onExitGame:stackView.pop()
        }
    }

    Component{
        id:configScreen
        ConfigScreen{
            width:window.width
            height:window.height
            onReturnBtnPressed: stackView.pop()
        }
    }


}
