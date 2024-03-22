/*
 * Copyright (C) 2024  bbisw
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * utequalizer is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import Lomiri.Components 1.3
import Lomiri.Components.ListItems 1.3
import QtQuick 2.7
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import QtQuick.Controls 2.7 as Qqc
import Process 1.0
import Lomiri.Components.Popups 1.3

import "../colors"

Rectangle {
    id: mainPage
    anchors.fill: parent

    color: Colors.backgroundColor

    property var padding: units.gu(1)

    Process {
        id: process
    }

    Process {
        id: process2
    }

    Process {
        id: process3
    }

    Process {
        id: process4
    }

    Process {
        id: process5
    }

    Process {
        id: process6
    }

    Process {
        id: process7
    }

    Process {
        id: process8
    }

    Process {
        id: process9
    }

    Settings {
        id: settings
        property bool darkMode: true
        property string equalizerControls1: ""
        property string equalizerControls2: ""
        property string equalizerControls3: ""
        property string equalizerControls4: ""
        property string equalizerControls5: ""
        property string equalizerControls6: ""
        property string equalizerControls7: ""
        property string equalizerControls8: ""
        property string equalizerControls9: ""
        property string equalizerControls10: ""
        property bool equalizerStatus: false
//        property string properlyClosed: ""
    }

    Connections {
        target: Qt.application
        onAboutToQuit: {
            if (settings.equalizerStatus === true) {
//                console.log("Goodbye!");
                console.log("EQ is still active");
//                settings.properlyClosed = "No"
//                settings.equalizerStatus = checked
//                settings.sync()
            } else if (settings.equalizerStatus === false) {
                console.log("EQ is inactive");
//                settings.properlyClosed = "Yes"
            }
//            settings.equalizerStatus = unchecked
//            settings.sync()
            console.log("Goodbye!");
        }
    }

    Component.onCompleted: {
//        if (settings.properlyClosed === Yes) {
//            ;
//        } else {
        process6.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.0/scripts/equalizer_stop.sh"])
//            settings.properlyClosed = "No"
        eqswitch.checked = false
        process7.start("/bin/bash",["-c", "sed -i '13s/true/false/' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf"])
//        }
    }

    Component {
        id: dialog

        Dialog {
            id: dialog2
            title: "Quit"
            text: "Are you sure that you want to close the app?"
            Button {
                id: bttn1
                text: "Cancel"
                onClicked: PopupUtils.close(dialog2)
            }
            Button {
                id: bttn2
                text: "Turn off equalizer"
                onClicked: {
                    process4.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.0/scripts/equalizer_stop.sh"])
                    bttn3.enabled = true
                    eqswitch.checked = false
                    process5.start("/bin/bash",["-c", "sed -i '13s/true/false/' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf"])
                    bttn1.enabled = false
//                    settings.properlyClosed = "Yes"
                }
            }
            Button {
                id: bttn3
                enabled: false
                text: "OK"
                onClicked: {
                    Qt.quit()
                }
            }
        }
    }

    PageHeader {
        id: header
        title: "Equalizer"
        StyleHints {
            foregroundColor: Colors.mainText
            backgroundColor: Colors.backgroundColor
            dividerColor: Colors.mainText
        }
        contents: Rectangle {
            id: hdrrec
            anchors.fill: parent
            color: Colors.backgroundColor
            Text {
                id: hdrtxt
                anchors.left: hdrrec.left
                anchors.verticalCenter: hdrrec.verticalCenter
                text: header.title
                color: Colors.mainText
                font.pointSize: 40
            }
            Button {
                id: clsbttn
                height: units.gu(4)
                width: units.gu(4)
                iconName: "close"
                anchors.right: hdrrec.right
                y: 20
                StyleHints {
                    defaultColor: clsbttn.pressed ? "red" : Colors.surfaceColor
                }
                onClicked: {
                    PopupUtils.open(dialog)
                }
            }
        }
    }

    Column {
        id: clmn1
        anchors.top: header.bottom
        anchors.horizontalCenter: mainPage.horizontalCenter
        topPadding: units.gu(3)
        spacing: units.gu(3)

        Row {
            id: row1
            spacing: 1
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide1.value
                    color: Colors.mainText
                    font.pointSize: 20
                }
                Qqc.Slider {
                    id: slide1
                    from: -48.0
                    to: 24.0
                    live: true
                    orientation: Qt.Vertical
                    stepSize: 0.5
                    value: settings.equalizerControls1
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "31Hz"
                    color: Colors.mainText
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide2.value
                    color: Colors.mainText
                    font.pointSize: 20
                }
                Qqc.Slider {
                    id: slide2
                    from: -48.0
                    to: 24.0
                    live: true
                    orientation: Qt.Vertical
                    stepSize: 0.5
                    value: settings.equalizerControls2
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "63Hz"
                    color: Colors.mainText
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide3.value
                    color: Colors.mainText
                    font.pointSize: 20
                }
                Qqc.Slider {
                    id: slide3
                    from: -48.0
                    to: 24.0
                    live: true
                    orientation: Qt.Vertical
                    stepSize: 0.5
                    value: settings.equalizerControls3
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "125Hz"
                    color: Colors.mainText
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide4.value
                    color: Colors.mainText
                    font.pointSize: 20
                }
                Qqc.Slider {
                    id: slide4
                    from: -48.0
                    to: 24.0
                    live: true
                    orientation: Qt.Vertical
                    stepSize: 0.5
                    value: settings.equalizerControls4
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "250Hz"
                    color: Colors.mainText
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide5.value
                    color: Colors.mainText
                    font.pointSize: 20
                }
                Qqc.Slider {
                    id: slide5
                    from: -48.0
                    to: 24.0
                    live: true
                    orientation: Qt.Vertical
                    stepSize: 0.5
                    value: settings.equalizerControls5
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "500Hz"
                    color: Colors.mainText
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide6.value
                    color: Colors.mainText
                    font.pointSize: 20
                }
                Qqc.Slider {
                    id: slide6
                    from: -48.0
                    to: 24.0
                    live: true
                    orientation: Qt.Vertical
                    stepSize: 0.5
                    value: settings.equalizerControls6
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "1kHz"
                    color: Colors.mainText
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide7.value
                    color: Colors.mainText
                    font.pointSize: 20
                }
                Qqc.Slider {
                    id: slide7
                    from: -48.0
                    to: 24.0
                    live: true
                    orientation: Qt.Vertical
                    stepSize: 0.5
                    value: settings.equalizerControls7
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "2kHz"
                    color: Colors.mainText
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide8.value
                    color: Colors.mainText
                    font.pointSize: 20
                }
                Qqc.Slider {
                    id: slide8
                    from: -48.0
                    to: 24.0
                    live: true
                    orientation: Qt.Vertical
                    stepSize: 0.5
                    value: settings.equalizerControls8
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "4kHz"
                    color: Colors.mainText
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide9.value
                    color: Colors.mainText
                    font.pointSize: 20
                }
                Qqc.Slider {
                    id: slide9
                    from: -48.0
                    to: 24.0
                    live: true
                    orientation: Qt.Vertical
                    stepSize: 0.5
                    value: settings.equalizerControls9
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "8kHz"
                    color: Colors.mainText
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide10.value
                    color: Colors.mainText
                    font.pointSize: 20
                }
                Qqc.Slider {
                    id: slide10
                    from: -48.0
                    to: 24.0
                    live: true
                    orientation: Qt.Vertical
                    stepSize: 0.5
                    value: settings.equalizerControls10
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "16kHz"
                    color: Colors.mainText
                    font.pointSize: 20
                }
            }
        }

        Row {
            id: row2
            anchors.horizontalCenter: clmn1.horizontalCenter
            spacing: units.gu(5)
            Button {
                id: chngbttn
                height: units.gu(4)
                width: units.gu(4)
                iconName: "media-playlist-shuffle"
                StyleHints {
                    defaultColor: chngbttn.pressed ? "green" : Colors.surfaceColor
                }
                onClicked: {
                    settings.equalizerControls1 = slide1.value.toFixed(1)
                    settings.equalizerControls2 = slide2.value.toFixed(1)
                    settings.equalizerControls3 = slide3.value.toFixed(1)
                    settings.equalizerControls4 = slide4.value.toFixed(1)
                    settings.equalizerControls5 = slide5.value.toFixed(1)
                    settings.equalizerControls6 = slide6.value.toFixed(1)
                    settings.equalizerControls7 = slide7.value.toFixed(1)
                    settings.equalizerControls8 = slide8.value.toFixed(1)
                    settings.equalizerControls9 = slide9.value.toFixed(1)
                    settings.equalizerControls10 = slide10.value.toFixed(1)
                    process3.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.0/scripts/equalizer_change.sh"])
                }
            }
            Qqc.Switch {
                id: eqswitch
                y: 5
//                checked: settings.equalizerStatus
                onClicked: {
                    if (settings.equalizerStatus === true) {
                        process2.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.0/scripts/equalizer_stop.sh"])
                        settings.equalizerStatus = checked
//                        process8.start("/bin/bash",["-c", "sed -i '13s/true/false/' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf"])
                    } else if (settings.equalizerStatus === false) {
                        settings.equalizerControls1 = slide1.value.toFixed(1)
                        settings.equalizerControls2 = slide2.value.toFixed(1)
                        settings.equalizerControls3 = slide3.value.toFixed(1)
                        settings.equalizerControls4 = slide4.value.toFixed(1)
                        settings.equalizerControls5 = slide5.value.toFixed(1)
                        settings.equalizerControls6 = slide6.value.toFixed(1)
                        settings.equalizerControls7 = slide7.value.toFixed(1)
                        settings.equalizerControls8 = slide8.value.toFixed(1)
                        settings.equalizerControls9 = slide9.value.toFixed(1)
                        settings.equalizerControls10 = slide10.value.toFixed(1)
                        process.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.0/scripts/equalizer_start.sh"])
                        settings.equalizerStatus = checked
//                        process9.start("/bin/bash",["-c", "sed -i '13s/false/true/' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf"])
                    }
                }
            }
            Button {
                id: rstbttn
                height: units.gu(4)
                width: units.gu(4)
                iconName: "reset"
                StyleHints {
                    defaultColor: rstbttn.pressed ? "green" : Colors.surfaceColor
                }
                onClicked: {
                    slide1.value = 0.0
                    slide2.value = 0.0
                    slide3.value = 0.0
                    slide4.value = 0.0
                    slide5.value = 0.0
                    slide6.value = 0.0
                    slide7.value = 0.0
                    slide8.value = 0.0
                    slide9.value = 0.0
                    slide10.value = 0.0
                    settings.equalizerControls1 = slide1.value.toFixed(1)
                    settings.equalizerControls2 = slide2.value.toFixed(1)
                    settings.equalizerControls3 = slide3.value.toFixed(1)
                    settings.equalizerControls4 = slide4.value.toFixed(1)
                    settings.equalizerControls5 = slide5.value.toFixed(1)
                    settings.equalizerControls6 = slide6.value.toFixed(1)
                    settings.equalizerControls7 = slide7.value.toFixed(1)
                    settings.equalizerControls8 = slide8.value.toFixed(1)
                    settings.equalizerControls9 = slide9.value.toFixed(1)
                    settings.equalizerControls10 = slide10.value.toFixed(1)
                }
            }
        }
        Row {
            id: row3
            anchors.horizontalCenter: clmn1.horizontalCenter
            spacing: units.gu(25)
            Text {
                id: txt1
                text: "Dark Mode"
                color: Colors.mainText
            }
            Qqc.Switch {
                id: drkmdswitch
                y: -15
                checked: settings.darkMode

                onClicked: {
                    settings.darkMode = checked
//                    txt3.text = i18n.tr("Restart the app after changing dark mode option")
                }
            }
        }
    }
}
