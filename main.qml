import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle {
        id: r1
        color: "yellow"
        x: 0
        y: 0
        width: 0.618 * parent.width
        height: parent.height
    }

    Rectangle {
        id: r2
        x: r1.width
        y: 0
        color: "green"
        width: parent.width - r1.width
        height: 0.618 * parent.height
    }

    Rectangle {
        id: r3
        x: r1.width
        y: r2.height
        color: "red"
        width: r2.width
        height: parent.height - r2.height
    }

    RectangleHole {
        anchors.fill: parent
        px: 100
        py: 50
        pw: 100
        ph: 80
    }
}
