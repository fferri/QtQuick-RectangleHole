import QtQuick 2.0

Rectangle {
    id: root
    color: "transparent"
    property string fillColor: "gray"
    property int px: 0
    property int py: 0
    property int pw: 0
    property int ph: 0
    opacity: 0.9

    MouseArea {
        anchors.fill: parent
        onClicked: timer.running = !timer.running
    }

    Behavior on px { PropertyAnimation {duration: 1000; easing.type: Easing.InOutQuart} }
    Behavior on py { PropertyAnimation {duration: 1000; easing.type: Easing.InOutQuart} }
    Behavior on pw { PropertyAnimation {duration: 1000; easing.type: Easing.InOutQuart} }
    Behavior on ph { PropertyAnimation {duration: 1000; easing.type: Easing.InOutQuart} }

    Timer {
        id: timer
        running: true
        interval: 1500
        repeat: true
        onTriggered: {
            var npx = Math.random() * root.width * 0.8
            var npy = Math.random() * root.height * 0.8
            var npw = (root.width - npx) * (0.8 * Math.random() + 0.2)
            var nph = (root.height - npy) * (0.8 * Math.random() + 0.2)
            root.px = npx; root.py = npy; root.pw = npw; root.ph = nph
        }
    }

    Rectangle {
        color: "transparent"
        border.color: "blue"
        border.width: 5
        x: px; y: py; width: pw; height: ph
    }

    Rectangle {
        id: leftRect
        x: 0; y: 0
        width: px; height: root.height
        color: root.fillColor
        opacity: root.opacity
    }

    Rectangle {
        id: rightRect
        x: px + pw; y: 0
        width: root.width - x; height: root.height
        color: root.fillColor
        opacity: root.opacity
    }

    Rectangle {
        id: topRect
        x: px; y: 0
        width: pw; height: py
        color: root.fillColor
        opacity: root.opacity
    }

    Rectangle {
        id: bottomRect
        x: px; y: py + ph
        width: pw; height: root.height - y
        color: root.fillColor
        opacity: root.opacity
    }
}
