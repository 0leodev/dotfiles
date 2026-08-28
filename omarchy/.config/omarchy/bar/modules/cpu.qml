import QtQuick
import Quickshell
import Quickshell.Io

Item {
  id: root

  property var bar: null
  property string moduleName: ""
  property var settings: ({})

  property string outputText: ""
  property string outputTooltip: ""
  property string outputClass: "normal"

  implicitWidth: bg.implicitWidth + 16
  implicitHeight: bar ? bar.barSize : 26

  Process {
    id: cpuProc
    command: ["bash", "-lc", "~/.config/omarchy/bar/scripts/cpu"]
    stdout: StdioCollector {
      waitForEnd: true
      onStreamFinished: root.parseOutput(text)
    }
  }

  Timer {
    interval: (root.settings && root.settings.interval ? root.settings.interval : 2) * 1000
    running: true
    repeat: true
    onTriggered: { if (!cpuProc.running) cpuProc.running = true }
  }

  Component.onCompleted: { if (!cpuProc.running) cpuProc.running = true }

  function parseOutput(raw) {
    var trimmed = (raw || "").trim()
    try {
      var lastNewline = trimmed.lastIndexOf("\n")
      var line = lastNewline >= 0 ? trimmed.substring(lastNewline + 1) : trimmed
      var data = JSON.parse(line)
      outputText = data.text || ""
      outputTooltip = data.tooltip || ""
      outputClass = data.class || "normal"
    } catch (e) {
      outputText = trimmed
      outputTooltip = ""
      outputClass = "normal"
    }
  }

  function getBgColor() {
    if (outputClass === "critical") return Qt.rgba(1, 0.3, 0.3, 0.25)
    if (outputClass === "warning") return Qt.rgba(1, 0.75, 0.3, 0.25)
    return Qt.rgba(1, 1, 1, 0.09)
  }

  function getTextColor() {
    if (outputClass === "critical") return Qt.rgba(1, 0.4, 0.4, 1)
    if (outputClass === "warning") return Qt.rgba(1, 0.85, 0.4, 1)
    return root.bar ? root.bar.foreground : "white"
  }

  Rectangle {
    id: bg
    anchors.fill: parent
    anchors.margins: 5
    radius: 20
    color: root.getBgColor()
    implicitWidth: label.implicitWidth + 15
    implicitHeight: label.implicitHeight + 10

    Text {
      id: label
      anchors.centerIn: parent
      text: root.outputText
      color: root.getTextColor()
      font.family: root.bar ? root.bar.fontFamily : "monospace"
      font.pixelSize: root.settings.fontSize || 12
    }
  }

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    acceptedButtons: Qt.LeftButton | Qt.RightButton
    onClicked: function(mouse) {
      if (!root.bar) return
      if (mouse.button === Qt.RightButton) {
        root.bar.run("notify-send 'CPU' '" + root.outputTooltip + "'")
      } else {
        root.bar.run("omarchy launch btop")
      }
    }
    onWheel: function(wheel) {
      if (!root.bar) return
      if (wheel.angleDelta.y > 0) {
        root.bar.run("notify-send 'CPU' '" + root.outputTooltip + "'")
      }
    }
  }
}
