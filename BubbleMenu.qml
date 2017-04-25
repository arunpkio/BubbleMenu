import QtQuick 2.0

Item {
    property int orgX: myRect.x
    property int orgY: myRect.y
    property int rads: 100
    property int bubbleSize: 60
    property int bubbleSizeC: 62
    property int bubbleRadius: bubbleSize / 2
    property real bubbleOpacity: 0
    property real bubbleScale: 0
    property int animDuration: 700
    property bool activeRotation: false

    function getNewX(rad, angle, obj)
    {
        var x = rad * Math.cos(angle) + obj
        return x
    }

    function getNewY(rad, angle, obj)
    {
        var y = rad * Math.sin(angle) + obj
        return y
    }

    State {
        id: parentState
        name: "rotated"
        PropertyChanges { target: nameText; rotation: 45; }
    }
    Transition {
        id: parentTransition
        from: "*"; to: "rotated"
        reversible: true
        NumberAnimation { properties: "rotation"; easing.type: Easing.InOutQuad; duration: animDuration - 200 }
    }

    State {
        id: rectState1
        name: "clicked"
        PropertyChanges { target: subRect1; x: getNewX(rads, 0, orgX); }
        PropertyChanges { target: subRect1; rotation: 360; }
        PropertyChanges { target: subRect1; opacity: 1; }
        PropertyChanges { target: subRect1; scale: 1; }
    }
    State {
        id: rectState2
        name: "clicked"
        PropertyChanges { target: subRect2; y: getNewY(rads, 4.71239, orgY); }
        PropertyChanges { target: subRect2; rotation: 360; }
        PropertyChanges { target: subRect2; opacity: 1; }
        PropertyChanges { target: subRect2; scale: 1; }
    }
    State {
        id: rectState3
        name: "clicked"
        PropertyChanges { target: subRect3; x: getNewX(rads, 5.49779, orgX); y: getNewY(rads, 5.49779, orgY); }
        PropertyChanges { target: subRect3; rotation: 360; }
        PropertyChanges { target: subRect3; opacity: 1; }
        PropertyChanges { target: subRect3; scale: 1; }
    }
    State {
        id: rectState4
        name: "clicked"
        PropertyChanges { target: subRect4; x: getNewX(rads, 0.785398, orgX); y: getNewY(rads, 0.785398, orgY); }
        PropertyChanges { target: subRect4; rotation: 360; }
        PropertyChanges { target: subRect4; opacity: 1; }
        PropertyChanges { target: subRect4; scale: 1; }
    }
    State {
        id: rectState5
        name: "clicked"
        PropertyChanges { target: subRect5; y: getNewY(rads, 1.5708, orgY); }
        PropertyChanges { target: subRect5; rotation: 360; }
        PropertyChanges { target: subRect5; opacity: 1; }
        PropertyChanges { target: subRect5; scale: 1; }
    }

    Transition {
        id: openTransition1
        from: "*"; to: "clicked"
        reversible: true
        NumberAnimation { properties: "x, rotation, opacity, scale"; easing.type: Easing.InOutSine; duration: animDuration }
    }
    Transition {
        id: openTransition2
        from: "*"; to: "clicked"
        reversible: true
        NumberAnimation { properties: "y, rotation, opacity, scale"; easing.type: Easing.InOutSine; duration: animDuration}
    }
    Transition {
        id: openTransition3
        from: "*"; to: "clicked"
        reversible: true
        NumberAnimation { properties: "x, y, rotation, opacity, scale"; easing.type: Easing.InOutSine; duration: animDuration }
    }
    Transition {
        id: openTransition4
        from: "*"; to: "clicked"
        reversible: true
        NumberAnimation { properties: "x, y, rotation, opacity, scale"; easing.type: Easing.InOutSine; duration: animDuration }
    }
    Transition {
        id: openTransition5
        from: "*"; to: "clicked"
        reversible: true
        NumberAnimation { properties: "y, rotation, opacity, scale"; easing.type: Easing.InOutSine; duration: animDuration }
    }

    State {
        id: fillState1
        name: "filled"
        PropertyChanges { target: subRect1; width: appWindow.width; height: appWindow.height }
    }
    Transition {
        id: fillTransition1
        from: "*"; to: "filled"
        reversible: true
        NumberAnimation { properties: "width, height"; easing.type: Easing.InOutQuad; duration: animDuration - 200 }
    }

    Rectangle {
        id: subRect1
        width: bubbleSize
        height: bubbleSize
        radius: bubbleRadius
        color: "blue"
        x: myRect.x
        y: myRect.y
        states: rectState1
        transitions: openTransition1
        opacity: bubbleOpacity
        scale: bubbleScale
    }

    Rectangle {
        id: subRect2
        width: bubbleSize
        height: bubbleSize
        radius: bubbleRadius
        color: "green"
        x: myRect.x
        y: myRect.y
        states: rectState2
        transitions: openTransition2
        opacity: bubbleOpacity
        scale: bubbleScale
    }

    Rectangle {
        id: subRect3
        width: bubbleSize
        height: bubbleSize
        radius: bubbleRadius
        color: "red"
        x: myRect.x
        y: myRect.y
        states: rectState3
        transitions: openTransition3
        opacity: bubbleOpacity
        scale: bubbleScale
    }

    Rectangle {
        id: subRect4
        width: bubbleSize
        height: bubbleSize
        radius: bubbleRadius
        color: "yellow"
        x: myRect.x
        y: myRect.y
        states: rectState4
        transitions: openTransition4
        opacity: bubbleOpacity
        scale: bubbleScale
    }
    Rectangle {
        id: subRect5
        width: bubbleSize
        height: bubbleSize
        radius: bubbleRadius
        color: "magenta"
        x: myRect.x
        y: myRect.y
        states: rectState5
        transitions: openTransition5
        opacity: bubbleOpacity
        scale: bubbleScale
    }


    Rectangle {
        id: myRect
        anchors.centerIn: parent
        width: bubbleSizeC
        height: bubbleSizeC
        radius: bubbleSizeC / 2
        color: "grey"


        Text {
            id: nameText
            anchors.centerIn: parent
            font.pointSize: 20
            text: "+"
            states: parentState
            transitions: parentTransition
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent
            onClicked: {
                subRect1.state == 'clicked' ? subRect1.state = "" : subRect1.state = 'clicked';
                subRect2.state == 'clicked' ? subRect2.state = "" : subRect2.state = 'clicked';
                subRect3.state == 'clicked' ? subRect3.state = "" : subRect3.state = 'clicked';
                subRect4.state == 'clicked' ? subRect4.state = "" : subRect4.state = 'clicked';
                subRect5.state == 'clicked' ? subRect5.state = "" : subRect5.state = 'clicked';
                nameText.state == "rotated" ? nameText.state = "" : nameText.state = "rotated";
            }
        }
    }
}
