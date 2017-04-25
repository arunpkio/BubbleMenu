import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 640
    height: 640
    title: qsTr("Hello World")

    background: Rectangle {
        anchors.fill: parent
        color: "#000000"
    }

    BubbleMenu {
        anchors.centerIn: parent
    }
}
