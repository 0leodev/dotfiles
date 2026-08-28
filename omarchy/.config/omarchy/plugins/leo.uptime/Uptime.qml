import QtQuick
import Quickshell
import Quickshell.Io
import qs.Ui
import qs.Commons

BarWidget {
  id: root
  moduleName: "leo.uptime"

  property string uptimeText: ""

  function refresh() {
    uptimeProc.running = true
  }

  function formatUptime(seconds) {
    var days = Math.floor(seconds / 86400)
    var hours = Math.floor((seconds % 86400) / 3600)
    var mins = Math.floor((seconds % 3600) / 60)

    var parts = []
    if (days > 0) parts.push(days + "d")
    if (hours > 0) parts.push(hours + "h")
    parts.push(mins + "m")
    return parts.join(" ")
  }

  Component.onCompleted: refresh()

  Process {
    id: uptimeProc
    command: ["cat", "/proc/uptime"]
    stdout: StdioCollector {
      waitForEnd: true
      onStreamFinished: {
        var val = parseFloat((text || "").trim().split(" ")[0])
        if (!isNaN(val)) {
          root.uptimeText = root.formatUptime(Math.floor(val))
        }
      }
    }
  }

  Timer {
    interval: 60000
    running: true
    repeat: true
    onTriggered: root.refresh()
  }

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  WidgetButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: root.uptimeText
    fontSize: Style.font.body
    horizontalMargin: 6
    tooltipText: "System uptime"
  }
}
