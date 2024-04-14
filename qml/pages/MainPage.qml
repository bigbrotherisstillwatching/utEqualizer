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
import Lomiri.Components.Styles 1.3
import QtGraphicalEffects 1.12

import "../colors"

Rectangle {
    id: mainPage
    anchors.fill: parent

    color: settings.darkMode ? "#121212" : "white"

    property var padding: units.gu(1)
    property alias eqsts: settings.equalizerStatus
    property alias drkMd: settings.darkMode

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

        property real output

        onStarted: print("pulse-vumeter started")
        onFinished: print("Closed")

        onErrorOccurred: console.log("Error Occurred: ", error)

        onReadyReadStandardOutput: {
            output = process8.readAll()
            prgrssbr.value = output
        }
    }

    Settings {
        id: settings
        property bool darkMode
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
        property bool equalizerStatus
        property string preset1equalizerControls1: ""
        property string preset1equalizerControls2: ""
        property string preset1equalizerControls3: ""
        property string preset1equalizerControls4: ""
        property string preset1equalizerControls5: ""
        property string preset1equalizerControls6: ""
        property string preset1equalizerControls7: ""
        property string preset1equalizerControls8: ""
        property string preset1equalizerControls9: ""
        property string preset1equalizerControls10: ""
        property string preset2equalizerControls1: ""
        property string preset2equalizerControls2: ""
        property string preset2equalizerControls3: ""
        property string preset2equalizerControls4: ""
        property string preset2equalizerControls5: ""
        property string preset2equalizerControls6: ""
        property string preset2equalizerControls7: ""
        property string preset2equalizerControls8: ""
        property string preset2equalizerControls9: ""
        property string preset2equalizerControls10: ""
        property string preset3equalizerControls1: ""
        property string preset3equalizerControls2: ""
        property string preset3equalizerControls3: ""
        property string preset3equalizerControls4: ""
        property string preset3equalizerControls5: ""
        property string preset3equalizerControls6: ""
        property string preset3equalizerControls7: ""
        property string preset3equalizerControls8: ""
        property string preset3equalizerControls9: ""
        property string preset3equalizerControls10: ""
        property string preset4equalizerControls1: ""
        property string preset4equalizerControls2: ""
        property string preset4equalizerControls3: ""
        property string preset4equalizerControls4: ""
        property string preset4equalizerControls5: ""
        property string preset4equalizerControls6: ""
        property string preset4equalizerControls7: ""
        property string preset4equalizerControls8: ""
        property string preset4equalizerControls9: ""
        property string preset4equalizerControls10: ""
        property string preset5equalizerControls1: ""
        property string preset5equalizerControls2: ""
        property string preset5equalizerControls3: ""
        property string preset5equalizerControls4: ""
        property string preset5equalizerControls5: ""
        property string preset5equalizerControls6: ""
        property string preset5equalizerControls7: ""
        property string preset5equalizerControls8: ""
        property string preset5equalizerControls9: ""
        property string preset5equalizerControls10: ""
        property string preset1name: ""
        property string preset2name: ""
        property string preset3name: ""
        property string preset4name: ""
        property string preset5name: ""
    }

    Connections {
        target: Qt.application
        onAboutToQuit: {
            if (settings.equalizerStatus === true) {
                console.log("EQ is still active");
            } else if (settings.equalizerStatus === false) {
                console.log("EQ is inactive");
            }
            process8.kill()
            console.log("Goodbye!");
        }
    }

    Component.onCompleted: {
        process6.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.3/scripts/equalizer_stop.sh"])
        eqswitch.checked = false
        eqsts = false
        process8.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.3/bin/pulse-vumeter"])
    }

    Component {
        id: dialog

        Dialog {
            id: dialog2
            title: i18n.tr("<font color=\"white\">Quit</font>")
            text: i18n.tr("<font color=\"white\">Are you sure that you want to close the app?</font>")
            style: ActionBarStyle {
                backgroundColor: "#292929"
            }
            Button {
                id: bttn1
                text: bttn1.pressed ? i18n.tr("<font color=\"white\">Cancel</font>") : i18n.tr("<font color=\"black\">Cancel</font>")
                onClicked: PopupUtils.close(dialog2)
                StyleHints {
                    defaultColor: bttn1.pressed ? "#32517F" : "red"
                }
            }
            Button {
                id: bttn2
                text: bttn2.pressed ? i18n.tr("<font color=\"white\">Turn off equalizer</font>") : i18n.tr("<font color=\"black\">Turn off equalizer</font>")
                onClicked: {
                    process4.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.3/scripts/equalizer_stop.sh"])
                    bttn3.enabled = true
                    process5.start("/bin/bash",["-c", "sed -i '13s/true/false/' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf"])
                    bttn1.enabled = false
                }
                StyleHints {
                    defaultColor: bttn2.pressed ? "#32517F" : "yellow"
                }
            }
            Button {
                id: bttn3
                enabled: false
                text: bttn3.pressed ? i18n.tr("<font color=\"white\">Ok</font>") : i18n.tr("<font color=\"black\">Ok</font>")
                onClicked: {
                    Qt.quit()
                }
                StyleHints {
                    defaultColor: bttn3.pressed ? "#32517F" : "green"
                }
            }
        }
    }

    PageHeader {
        id: header
        title: "utEqualizer"
        z: 1
        StyleHints {
            foregroundColor: settings.darkMode ? "#808080" : "black"
            backgroundColor: settings.darkMode ? "#121212" : "white"
            dividerColor: settings.darkMode ? "#808080" : "black"
        }
        contents: Rectangle {
            id: hdrrec
            anchors.fill: parent
            color: settings.darkMode ? "#121212" : "white"
            Text {
                id: hdrtxt
                anchors.left: hdrrec.left
                anchors.verticalCenter: hdrrec.verticalCenter
                text: header.title
                color: settings.darkMode ? "#808080" : "black"
                font.pointSize: 40
            }
            Rectangle {
                id: clsbttn
                height: units.gu(4)
                width: units.gu(4)
                anchors.right: hdrrec.right
                anchors.verticalCenter: hdrrec.verticalCenter
                radius: units.gu(1)
                color: clsbttnma.pressed ? "red" : (settings.darkMode ? "#292929" : "white")
            }
            Icon {
                id: clsbttnicn
                source: clsbttnma.pressed ? "../../assets/close_pressed.svg" : (settings.darkMode ? "../../assets/close_darkmode.svg" : "../../assets/close_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: clsbttn
                z: 2
            }
            MouseArea {
                id: clsbttnma
                anchors.fill: clsbttn
 
                onClicked: {
                    PopupUtils.open(dialog)
                }
            }
            DropShadow {
                anchors.fill: clsbttn
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: clsbttn
                spread: 0
                cached: true
            }
        }
    }

    Flickable {
        id: flick1
        anchors.top: header.bottom
        contentHeight: /*clmn1.height + txtfld1.height + txtfld2.height + txtfld3.height + txtfld4.height + txtfld5.height + txt3.height + */units.gu(300)
        contentWidth: mainPage.width
        width: mainPage.width
        height: mainPage.height - header.height
        anchors.horizontalCenter: mainPage.horizontalCenter
        flickableDirection: Flickable.VerticalFlick

        MouseArea {
            id: ma1
            anchors.fill: parent
 
            onClicked: {
                focus = true
            }
        }

        Row {
            id: row1
            spacing: 1
            anchors.horizontalCenter: parent.horizontalCenter
            topPadding: units.gu(3)
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide1.value
                    color: settings.darkMode ? "#808080" : "black"
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
                    background: Rectangle {
                        x: (slide1.width  - width) / 2
                        y: (slide1.height - height) / 2
                        implicitHeight: slide1.horizontal ? 1 : 200
                        width: 4
                        height: slide1.availableHeight
                        radius: 2
                        color: "#32517F"
                        border.width: 0

                        Rectangle {
                            implicitWidth: parent.width
                            implicitHeight: slide1.visualPosition * parent.height
                            color: settings.darkMode ? "#808080" : "#f1f1f1"
                            radius: 2
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide1hndl
                        x: slide1.leftPadding + (slide1.horizontal ? slide1.visualPosition * (slide1.availableWidth - width) : (slide1.availableWidth - width) / 2)
                        y: slide1.topPadding + (slide1.vertical ? slide1.visualPosition * (slide1.availableHeight - height) : (slide1.availableHeight - height) / 2)
                        implicitWidth: 52
                        implicitHeight: 52
                        radius: 26
                        color: slide1.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "white")
//                        border.color: settings.darkMode ? "#808080" : "#e2e2e2"
                        border.width: 0
                    }
                    DropShadow {
                        anchors.fill: slide1hndl
                        horizontalOffset: 1
                        verticalOffset: 1
                        radius: 6
                        samples: 13
                        color: "black"
                        source: slide1hndl
                        spread: 0
                        cached: true
                    }
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "31Hz"
                    color: settings.darkMode ? "#808080" : "black"
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide2.value
                    color: settings.darkMode ? "#808080" : "black"
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
                    background: Rectangle {
                        x: (slide2.width  - width) / 2
                        y: (slide2.height - height) / 2
                        implicitHeight: slide2.horizontal ? 1 : 200
                        width: 4
                        height: slide2.availableHeight
                        radius: 2
                        color: "#32517F"
                        border.width: 0

                        Rectangle {
                            implicitWidth: parent.width
                            implicitHeight: slide2.visualPosition * parent.height
                            color: settings.darkMode ? "#808080" : "#f1f1f1"
                            radius: 2
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide2hndl
                        x: slide2.leftPadding + (slide2.horizontal ? slide2.visualPosition * (slide2.availableWidth - width) : (slide2.availableWidth - width) / 2)
                        y: slide2.topPadding + (slide2.vertical ? slide2.visualPosition * (slide2.availableHeight - height) : (slide2.availableHeight - height) / 2)
                        implicitWidth: 52
                        implicitHeight: 52
                        radius: 26
                        color: slide2.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "white")
//                        border.color: settings.darkMode ? "#808080" : "#f1f1f1"
                        border.width: 0
                    }
                    DropShadow {
                        anchors.fill: slide2hndl
                        horizontalOffset: 1
                        verticalOffset: 1
                        radius: 6
                        samples: 13
                        color: "black"
                        source: slide2hndl
                        spread: 0
                        cached: true
                    }
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "63Hz"
                    color: settings.darkMode ? "#808080" : "black"
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide3.value
                    color: settings.darkMode ? "#808080" : "black"
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
                    background: Rectangle {
                        x: (slide3.width  - width) / 2
                        y: (slide3.height - height) / 2
                        implicitHeight: slide3.horizontal ? 1 : 200
                        width: 4
                        height: slide3.availableHeight
                        radius: 2
                        color: "#32517F"
                        border.width: 0

                        Rectangle {
                            implicitWidth: parent.width
                            implicitHeight: slide3.visualPosition * parent.height
                            color: settings.darkMode ? "#808080" : "#f1f1f1"
                            radius: 2
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide3hndl
                        x: slide3.leftPadding + (slide3.horizontal ? slide3.visualPosition * (slide3.availableWidth - width) : (slide3.availableWidth - width) / 2)
                        y: slide3.topPadding + (slide3.vertical ? slide3.visualPosition * (slide3.availableHeight - height) : (slide3.availableHeight - height) / 2)
                        implicitWidth: 52
                        implicitHeight: 52
                        radius: 26
                        color: slide3.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "white")
//                        border.color: settings.darkMode ? "#808080" : "#f1f1f1"
                        border.width: 0
                    }
                    DropShadow {
                        anchors.fill: slide3hndl
                        horizontalOffset: 1
                        verticalOffset: 1
                        radius: 6
                        samples: 13
                        color: "black"
                        source: slide3hndl
                        spread: 0
                        cached: true
                    }
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "125Hz"
                    color: settings.darkMode ? "#808080" : "black"
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide4.value
                    color: settings.darkMode ? "#808080" : "black"
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
                    background: Rectangle {
                        x: (slide4.width  - width) / 2
                        y: (slide4.height - height) / 2
                        implicitHeight: slide4.horizontal ? 1 : 200
                        width: 4
                        height: slide4.availableHeight
                        radius: 2
                        color: "#32517F"
                        border.width: 0

                        Rectangle {
                            implicitWidth: parent.width
                            implicitHeight: slide4.visualPosition * parent.height
                            color: settings.darkMode ? "#808080" : "#f1f1f1"
                            radius: 2
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide4hndl
                        x: slide4.leftPadding + (slide4.horizontal ? slide4.visualPosition * (slide4.availableWidth - width) : (slide4.availableWidth - width) / 2)
                        y: slide4.topPadding + (slide4.vertical ? slide4.visualPosition * (slide4.availableHeight - height) : (slide4.availableHeight - height) / 2)
                        implicitWidth: 52
                        implicitHeight: 52
                        radius: 26
                        color: slide4.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "white")
//                        border.color: settings.darkMode ? "#808080" : "#f1f1f1"
                        border.width: 0
                    }
                    DropShadow {
                        anchors.fill: slide4hndl
                        horizontalOffset: 1
                        verticalOffset: 1
                        radius: 6
                        samples: 13
                        color: "black"
                        source: slide4hndl
                        spread: 0
                        cached: true
                    }
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "250Hz"
                    color: settings.darkMode ? "#808080" : "black"
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide5.value
                    color: settings.darkMode ? "#808080" : "black"
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
                    background: Rectangle {
                        x: (slide5.width  - width) / 2
                        y: (slide5.height - height) / 2
                        implicitHeight: slide5.horizontal ? 1 : 200
                        width: 4
                        height: slide5.availableHeight
                        radius: 2
                        color: "#32517F"
                        border.width: 0

                        Rectangle {
                            implicitWidth: parent.width
                            implicitHeight: slide5.visualPosition * parent.height
                            color: settings.darkMode ? "#808080" : "#f1f1f1"
                            radius: 2
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide5hndl
                        x: slide5.leftPadding + (slide5.horizontal ? slide5.visualPosition * (slide5.availableWidth - width) : (slide5.availableWidth - width) / 2)
                        y: slide5.topPadding + (slide5.vertical ? slide5.visualPosition * (slide5.availableHeight - height) : (slide5.availableHeight - height) / 2)
                        implicitWidth: 52
                        implicitHeight: 52
                        radius: 26
                        color: slide5.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "white")
//                        border.color: settings.darkMode ? "#808080" : "#f1f1f1"
                        border.width: 0
                    }
                    DropShadow {
                        anchors.fill: slide5hndl
                        horizontalOffset: 1
                        verticalOffset: 1
                        radius: 6
                        samples: 13
                        color: "black"
                        source: slide5hndl
                        spread: 0
                        cached: true
                    }
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "500Hz"
                    color: settings.darkMode ? "#808080" : "black"
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide6.value
                    color: settings.darkMode ? "#808080" : "black"
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
                    background: Rectangle {
                        x: (slide6.width  - width) / 2
                        y: (slide6.height - height) / 2
                        implicitHeight: slide6.horizontal ? 1 : 200
                        width: 4
                        height: slide6.availableHeight
                        radius: 2
                        color: "#32517F"
                        border.width: 0

                        Rectangle {
                            implicitWidth: parent.width
                            implicitHeight: slide6.visualPosition * parent.height
                            color: settings.darkMode ? "#808080" : "#f1f1f1"
                            radius: 2
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide6hndl
                        x: slide6.leftPadding + (slide6.horizontal ? slide6.visualPosition * (slide6.availableWidth - width) : (slide6.availableWidth - width) / 2)
                        y: slide6.topPadding + (slide6.vertical ? slide6.visualPosition * (slide6.availableHeight - height) : (slide6.availableHeight - height) / 2)
                        implicitWidth: 52
                        implicitHeight: 52
                        radius: 26
                        color: slide6.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "white")
//                        border.color: settings.darkMode ? "#808080" : "#f1f1f1"
                        border.width: 0
                    }
                    DropShadow {
                        anchors.fill: slide6hndl
                        horizontalOffset: 1
                        verticalOffset: 1
                        radius: 6
                        samples: 13
                        color: "black"
                        source: slide6hndl
                        spread: 0
                        cached: true
                    }
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "1kHz"
                    color: settings.darkMode ? "#808080" : "black"
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide7.value
                    color: settings.darkMode ? "#808080" : "black"
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
                    background: Rectangle {
                        x: (slide7.width  - width) / 2
                        y: (slide7.height - height) / 2
                        implicitHeight: slide7.horizontal ? 1 : 200
                        width: 4
                        height: slide7.availableHeight
                        radius: 2
                        color: "#32517F"
                        border.width: 0

                        Rectangle {
                            implicitWidth: parent.width
                            implicitHeight: slide7.visualPosition * parent.height
                            color: settings.darkMode ? "#808080" : "#f1f1f1"
                            radius: 2
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide7hndl
                        x: slide7.leftPadding + (slide7.horizontal ? slide7.visualPosition * (slide7.availableWidth - width) : (slide7.availableWidth - width) / 2)
                        y: slide7.topPadding + (slide7.vertical ? slide7.visualPosition * (slide7.availableHeight - height) : (slide7.availableHeight - height) / 2)
                        implicitWidth: 52
                        implicitHeight: 52
                        radius: 26
                        color: slide7.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "white")
//                        border.color: settings.darkMode ? "#808080" : "#f1f1f1"
                        border.width: 0
                    }
                    DropShadow {
                        anchors.fill: slide7hndl
                        horizontalOffset: 1
                        verticalOffset: 1
                        radius: 6
                        samples: 13
                        color: "black"
                        source: slide7hndl
                        spread: 0
                        cached: true
                    }
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "2kHz"
                    color: settings.darkMode ? "#808080" : "black"
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide8.value
                    color: settings.darkMode ? "#808080" : "black"
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
                    background: Rectangle {
                        x: (slide8.width  - width) / 2
                        y: (slide8.height - height) / 2
                        implicitHeight: slide8.horizontal ? 1 : 200
                        width: 4
                        height: slide8.availableHeight
                        radius: 2
                        color: "#32517F"
                        border.width: 0

                        Rectangle {
                            implicitWidth: parent.width
                            implicitHeight: slide8.visualPosition * parent.height
                            color: settings.darkMode ? "#808080" : "#f1f1f1"
                            radius: 2
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide8hndl
                        x: slide8.leftPadding + (slide8.horizontal ? slide8.visualPosition * (slide8.availableWidth - width) : (slide8.availableWidth - width) / 2)
                        y: slide8.topPadding + (slide8.vertical ? slide8.visualPosition * (slide8.availableHeight - height) : (slide8.availableHeight - height) / 2)
                        implicitWidth: 52
                        implicitHeight: 52
                        radius: 26
                        color: slide8.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "white")
//                        border.color: settings.darkMode ? "#808080" : "#f1f1f1"
                        border.width: 0
                    }
                    DropShadow {
                        anchors.fill: slide8hndl
                        horizontalOffset: 1
                        verticalOffset: 1
                        radius: 6
                        samples: 13
                        color: "black"
                        source: slide8hndl
                        spread: 0
                        cached: true
                    }
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "4kHz"
                    color: settings.darkMode ? "#808080" : "black"
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide9.value
                    color: settings.darkMode ? "#808080" : "black"
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
                    background: Rectangle {
                        x: (slide9.width  - width) / 2
                        y: (slide9.height - height) / 2
                        implicitHeight: slide9.horizontal ? 1 : 200
                        width: 4
                        height: slide9.availableHeight
                        radius: 2
                        color: "#32517F"
                        border.width: 0

                        Rectangle {
                            implicitWidth: parent.width
                            implicitHeight: slide9.visualPosition * parent.height
                            color: settings.darkMode ? "#808080" : "#f1f1f1"
                            radius: 2
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide9hndl
                        x: slide9.leftPadding + (slide9.horizontal ? slide9.visualPosition * (slide9.availableWidth - width) : (slide9.availableWidth - width) / 2)
                        y: slide9.topPadding + (slide9.vertical ? slide9.visualPosition * (slide9.availableHeight - height) : (slide9.availableHeight - height) / 2)
                        implicitWidth: 52
                        implicitHeight: 52
                        radius: 26
                        color: slide9.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "white")
//                        border.color: settings.darkMode ? "#808080" : "#f1f1f1"
                        border.width: 0
                    }
                    DropShadow {
                        anchors.fill: slide9hndl
                        horizontalOffset: 1
                        verticalOffset: 1
                        radius: 6
                        samples: 13
                        color: "black"
                        source: slide9hndl
                        spread: 0
                        cached: true
                    }
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "8kHz"
                    color: settings.darkMode ? "#808080" : "black"
                    font.pointSize: 20
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide10.value
                    color: settings.darkMode ? "#808080" : "black"
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
                    background: Rectangle {
                        x: (slide10.width  - width) / 2
                        y: (slide10.height - height) / 2
                        implicitHeight: slide10.horizontal ? 1 : 200
                        width: 4
                        height: slide10.availableHeight
                        radius: 2
                        color: "#32517F"
                        border.width: 0

                        Rectangle {
                            implicitWidth: parent.width
                            implicitHeight: slide10.visualPosition * parent.height
                            color: settings.darkMode ? "#808080" : "#f1f1f1"
                            radius: 2
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide10hndl
                        x: slide10.leftPadding + (slide10.horizontal ? slide10.visualPosition * (slide10.availableWidth - width) : (slide10.availableWidth - width) / 2)
                        y: slide10.topPadding + (slide10.vertical ? slide10.visualPosition * (slide10.availableHeight - height) : (slide10.availableHeight - height) / 2)
                        implicitWidth: 52
                        implicitHeight: 52
                        radius: 26
                        color: slide10.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "white")
//                        border.color: settings.darkMode ? "#808080" : "#f1f1f1"
                        border.width: 0
                    }
                    DropShadow {
                        anchors.fill: slide10hndl
                        horizontalOffset: 1
                        verticalOffset: 1
                        radius: 6
                        samples: 13
                        color: "black"
                        source: slide10hndl
                        spread: 0
                        cached: true
                    }
                }
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: "16kHz"
                    color: settings.darkMode ? "#808080" : "black"
                    font.pointSize: 20
                }
            }
        }

        ProgressBar {
            id: prgrssbr
            maximumValue: 1.00
            minimumValue: 0.00
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: row1.bottom
            anchors.topMargin: units.gu(3)
        }

/*                Button {
                    id: chngbttn
                    height: units.gu(4)
                    width: units.gu(4)
                    iconSource: chngbttn.pressed ? "../../assets/change_pressed.svg" : (settings.darkMode ? "../../assets/change_darkmode.svg" : "../../assets/change_lightmode.svg")
                    StyleHints {
                        defaultColor: chngbttn.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "#f1f1f1")
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
                        process3.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.3/scripts/equalizer_change.sh"])
                    }
                }*/

        Item {
            anchors.top: prgrssbr.bottom
            anchors.right: eqswitch.left
            anchors.rightMargin: units.gu(5)
            anchors.topMargin: units.gu(3)
            Rectangle {
                id: chngbttn
                height: units.gu(4)
                width: units.gu(4)
//                anchors.right: hdrrec.right
//                y: 20
//                anchors.verticalCenter: hdrrec.verticalCenter
                radius: units.gu(1)
                color: chngbttnma.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "white")
            }
            Icon {
                id: chngbttnicn
                source: chngbttnma.pressed ? "../../assets/change_pressed.svg" : (settings.darkMode ? "../../assets/change_darkmode.svg" : "../../assets/change_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: chngbttn
                z: 2
            }
            MouseArea {
                id: chngbttnma
                anchors.fill: chngbttn
 
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
                    process3.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.3/scripts/equalizer_change.sh"])
                }
            }
            DropShadow {
                anchors.fill: chngbttn
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: chngbttn
                spread: 0
                cached: true
            }
        }

        Qqc.Switch {
            id: eqswitch
            anchors.horizontalCenter: parent.horizontalCenter
            y: 5
            onClicked: {
                if (settings.equalizerStatus === true) {
                    process2.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.3/scripts/equalizer_stop.sh"])
                    eqsts = checked
                    txt2.text = ""
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
                    process.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.3/scripts/equalizer_start.sh"])
                    eqsts = checked
                    txt2.text = i18n.tr("Please turn the equalizer off and on again after changing audio output.")
                }
            }
        }
    }
}
/*            Button {
                id: rstbttn
                height: units.gu(4)
                width: units.gu(4)
                iconSource: rstbttn.pressed ? "../../assets/resetzero_pressed.svg" : (settings.darkMode ? "../../assets/resetzero_darkmode.svg" : "../../assets/resetzero_lightmode.svg")
                StyleHints {
                    defaultColor: rstbttn.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "#f1f1f1")
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
            }*/
//        }
/*            Text {
                 id: txt2
                 text: ""
                 color: "red"
                 anchors.horizontalCenter: parent.horizontalCenter
                 wrapMode: Text.WordWrap
                 width: parent.width
                 lineHeight: 1.2
                 horizontalAlignment: Text.AlignHCenter
                 leftPadding: units.gu(3)
                 rightPadding: units.gu(3)
            }
            Rectangle {
                 id: plchldrrec
                 color: "transparent"
                 anchors.horizontalCenter: clmn1.horizontalCenter
                 width: parent.width
                 height: units.gu(5) - txt2.height
            }
        }

        Text {
            id: txt1
            text: i18n.tr("Dark mode")
            color: settings.darkMode ? "#808080" : "black"
            anchors.top: clmn1.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
        }
        Qqc.Switch {
            id: drkmdswitch
            y: -15
            checked: settings.darkMode
            anchors.top: clmn1.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(1)
            anchors.topMargin: units.gu(1)

            onClicked: {
                drkMd = checked
//                txt2.text = i18n.tr("Please restart the app for the dark mode option change to take effect.")
            }
        }

        TextField {
            id: txtfld1
            color: settings.darkMode ? "#808080" : "black"
            text: settings.preset1name
            placeholderText: i18n.tr("Preset 1")
            hasClearButton: false
            anchors.top: txt1.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(3)
            width: flick1.width / 2
            style: ActionBarStyle {
                backgroundColor: "transparent"
            }
            onAccepted: {
                settings.preset1name = txtfld1.text
                txtfld1.text = settings.preset1name
                ma1.focus = true
            }
        }

        Button {
            id: bttn5
            height: units.gu(4)
            width: units.gu(4)
            anchors.top: txt1.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(3)
            iconSource: bttn5.pressed ? "../../assets/load_pressed.svg" : (settings.darkMode ? "../../assets/load_darkmode.svg" : "../../assets/load_lightmode.svg")
            StyleHints {
                defaultColor: bttn5.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "#f1f1f1")
            }
            onClicked: {
                slide1.value = settings.preset1equalizerControls1
                slide2.value = settings.preset1equalizerControls2
                slide3.value = settings.preset1equalizerControls3
                slide4.value = settings.preset1equalizerControls4
                slide5.value = settings.preset1equalizerControls5
                slide6.value = settings.preset1equalizerControls6
                slide7.value = settings.preset1equalizerControls7
                slide8.value = settings.preset1equalizerControls8
                slide9.value = settings.preset1equalizerControls9
                slide10.value = settings.preset1equalizerControls10
            }
        }

        Button {
            id: bttn4
            height: units.gu(4)
            width: units.gu(4)
            anchors.top: txt1.bottom
            anchors.right: bttn5.left
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(3)
            iconSource: bttn4.pressed ? "../../assets/save_pressed.svg" : (settings.darkMode ? "../../assets/save_darkmode.svg" : "../../assets/save_lightmode.svg")
            StyleHints {
                defaultColor: bttn4.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "#f1f1f1")
            }
            onClicked: {
                settings.preset1equalizerControls1 = slide1.value.toFixed(1)
                settings.preset1equalizerControls2 = slide2.value.toFixed(1)
                settings.preset1equalizerControls3 = slide3.value.toFixed(1)
                settings.preset1equalizerControls4 = slide4.value.toFixed(1)
                settings.preset1equalizerControls5 = slide5.value.toFixed(1)
                settings.preset1equalizerControls6 = slide6.value.toFixed(1)
                settings.preset1equalizerControls7 = slide7.value.toFixed(1)
                settings.preset1equalizerControls8 = slide8.value.toFixed(1)
                settings.preset1equalizerControls9 = slide9.value.toFixed(1)
                settings.preset1equalizerControls10 = slide10.value.toFixed(1)
            }
        }

        TextField {
            id: txtfld2
            color: settings.darkMode ? "#808080" : "black"
            text: settings.preset2name
            placeholderText: i18n.tr("Preset 2")
            hasClearButton: false
            anchors.top: txtfld1.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
            width: flick1.width / 2
            style: ActionBarStyle {
                backgroundColor: "transparent"
            }
            onAccepted: {
                settings.preset2name = txtfld2.text
                txtfld2.text = settings.preset2name
                ma1.focus = true
            }
        }

        Button {
            id: bttn7
            height: units.gu(4)
            width: units.gu(4)
            anchors.top: bttn5.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
            iconSource: bttn7.pressed ? "../../assets/load_pressed.svg" : (settings.darkMode ? "../../assets/load_darkmode.svg" : "../../assets/load_lightmode.svg")
            StyleHints {
                defaultColor: bttn7.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "#f1f1f1")
            }
            onClicked: {
                slide1.value = settings.preset2equalizerControls1
                slide2.value = settings.preset2equalizerControls2
                slide3.value = settings.preset2equalizerControls3
                slide4.value = settings.preset2equalizerControls4
                slide5.value = settings.preset2equalizerControls5
                slide6.value = settings.preset2equalizerControls6
                slide7.value = settings.preset2equalizerControls7
                slide8.value = settings.preset2equalizerControls8
                slide9.value = settings.preset2equalizerControls9
                slide10.value = settings.preset2equalizerControls10
            }
        }

        Button {
            id: bttn6
            height: units.gu(4)
            width: units.gu(4)
            anchors.top: bttn4.bottom
            anchors.right: bttn7.left
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
            iconSource: bttn6.pressed ? "../../assets/save_pressed.svg" : (settings.darkMode ? "../../assets/save_darkmode.svg" : "../../assets/save_lightmode.svg")
            StyleHints {
                defaultColor: bttn6.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "#f1f1f1")
            }
            onClicked: {
                settings.preset2equalizerControls1 = slide1.value.toFixed(1)
                settings.preset2equalizerControls2 = slide2.value.toFixed(1)
                settings.preset2equalizerControls3 = slide3.value.toFixed(1)
                settings.preset2equalizerControls4 = slide4.value.toFixed(1)
                settings.preset2equalizerControls5 = slide5.value.toFixed(1)
                settings.preset2equalizerControls6 = slide6.value.toFixed(1)
                settings.preset2equalizerControls7 = slide7.value.toFixed(1)
                settings.preset2equalizerControls8 = slide8.value.toFixed(1)
                settings.preset2equalizerControls9 = slide9.value.toFixed(1)
                settings.preset2equalizerControls10 = slide10.value.toFixed(1)
            }
        }

        TextField {
            id: txtfld3
            color: settings.darkMode ? "#808080" : "black"
            text: settings.preset3name
            placeholderText: i18n.tr("Preset 3")
            hasClearButton: false
            anchors.top: txtfld2.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
            width: flick1.width / 2
            style: ActionBarStyle {
                backgroundColor: "transparent"
            }
            onAccepted: {
                settings.preset3name = txtfld3.text
                txtfld3.text = settings.preset3name
                ma1.focus = true
            }
        }

        Button {
            id: bttn9
            height: units.gu(4)
            width: units.gu(4)
            anchors.top: bttn7.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
            iconSource: bttn9.pressed ? "../../assets/load_pressed.svg" : (settings.darkMode ? "../../assets/load_darkmode.svg" : "../../assets/load_lightmode.svg")
            StyleHints {
                defaultColor: bttn9.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "#f1f1f1")
            }
            onClicked: {
                slide1.value = settings.preset3equalizerControls1
                slide2.value = settings.preset3equalizerControls2
                slide3.value = settings.preset3equalizerControls3
                slide4.value = settings.preset3equalizerControls4
                slide5.value = settings.preset3equalizerControls5
                slide6.value = settings.preset3equalizerControls6
                slide7.value = settings.preset3equalizerControls7
                slide8.value = settings.preset3equalizerControls8
                slide9.value = settings.preset3equalizerControls9
                slide10.value = settings.preset3equalizerControls10
            }
        }

        Button {
            id: bttn8
            height: units.gu(4)
            width: units.gu(4)
            anchors.top: bttn6.bottom
            anchors.right: bttn9.left
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
            iconSource: bttn8.pressed ? "../../assets/save_pressed.svg" : (settings.darkMode ? "../../assets/save_darkmode.svg" : "../../assets/save_lightmode.svg")
            StyleHints {
                defaultColor: bttn8.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "#f1f1f1")
            }
            onClicked: {
                settings.preset3equalizerControls1 = slide1.value.toFixed(1)
                settings.preset3equalizerControls2 = slide2.value.toFixed(1)
                settings.preset3equalizerControls3 = slide3.value.toFixed(1)
                settings.preset3equalizerControls4 = slide4.value.toFixed(1)
                settings.preset3equalizerControls5 = slide5.value.toFixed(1)
                settings.preset3equalizerControls6 = slide6.value.toFixed(1)
                settings.preset3equalizerControls7 = slide7.value.toFixed(1)
                settings.preset3equalizerControls8 = slide8.value.toFixed(1)
                settings.preset3equalizerControls9 = slide9.value.toFixed(1)
                settings.preset3equalizerControls10 = slide10.value.toFixed(1)
            }
        }

        TextField {
            id: txtfld4
            color: settings.darkMode ? "#808080" : "black"
            text: settings.preset4name
            placeholderText: i18n.tr("Preset 4")
            hasClearButton: false
            anchors.top: txtfld3.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
            width: flick1.width / 2
            style: ActionBarStyle {
                backgroundColor: "transparent"
            }
            onAccepted: {
                settings.preset4name = txtfld4.text
                txtfld4.text = settings.preset4name
                ma1.focus = true
            }
        }

        Button {
            id: bttn11
            height: units.gu(4)
            width: units.gu(4)
            anchors.top: bttn9.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
            iconSource: bttn11.pressed ? "../../assets/load_pressed.svg" : (settings.darkMode ? "../../assets/load_darkmode.svg" : "../../assets/load_lightmode.svg")
            StyleHints {
                defaultColor: bttn11.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "#f1f1f1")
            }
            onClicked: {
                slide1.value = settings.preset4equalizerControls1
                slide2.value = settings.preset4equalizerControls2
                slide3.value = settings.preset4equalizerControls3
                slide4.value = settings.preset4equalizerControls4
                slide5.value = settings.preset4equalizerControls5
                slide6.value = settings.preset4equalizerControls6
                slide7.value = settings.preset4equalizerControls7
                slide8.value = settings.preset4equalizerControls8
                slide9.value = settings.preset4equalizerControls9
                slide10.value = settings.preset4equalizerControls10
            }
        }

        Button {
            id: bttn10
            height: units.gu(4)
            width: units.gu(4)
            anchors.top: bttn8.bottom
            anchors.right: bttn11.left
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
            iconSource: bttn10.pressed ? "../../assets/save_pressed.svg" : (settings.darkMode ? "../../assets/save_darkmode.svg" : "../../assets/save_lightmode.svg")
            StyleHints {
                defaultColor: bttn10.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "#f1f1f1")
            }
            onClicked: {
                settings.preset4equalizerControls1 = slide1.value.toFixed(1)
                settings.preset4equalizerControls2 = slide2.value.toFixed(1)
                settings.preset4equalizerControls3 = slide3.value.toFixed(1)
                settings.preset4equalizerControls4 = slide4.value.toFixed(1)
                settings.preset4equalizerControls5 = slide5.value.toFixed(1)
                settings.preset4equalizerControls6 = slide6.value.toFixed(1)
                settings.preset4equalizerControls7 = slide7.value.toFixed(1)
                settings.preset4equalizerControls8 = slide8.value.toFixed(1)
                settings.preset4equalizerControls9 = slide9.value.toFixed(1)
                settings.preset4equalizerControls10 = slide10.value.toFixed(1)
            }
        }

        TextField {
            id: txtfld5
            color: settings.darkMode ? "#808080" : "black"
            text: settings.preset5name
            placeholderText: i18n.tr("Preset 5")
            hasClearButton: false
            anchors.top: txtfld4.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
            width: flick1.width / 2
            style: ActionBarStyle {
                backgroundColor: "transparent"
            }
            onAccepted: {
                settings.preset5name = txtfld5.text
                txtfld5.text = settings.preset5name
                ma1.focus = true
            }
        }

        Button {
            id: bttn13
            height: units.gu(4)
            width: units.gu(4)
            anchors.top: bttn11.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
            iconSource: bttn13.pressed ? "../../assets/load_pressed.svg" : (settings.darkMode ? "../../assets/load_darkmode.svg" : "../../assets/load_lightmode.svg")
            StyleHints {
                defaultColor: bttn13.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "#f1f1f1")
            }
            onClicked: {
                slide1.value = settings.preset5equalizerControls1
                slide2.value = settings.preset5equalizerControls2
                slide3.value = settings.preset5equalizerControls3
                slide4.value = settings.preset5equalizerControls4
                slide5.value = settings.preset5equalizerControls5
                slide6.value = settings.preset5equalizerControls6
                slide7.value = settings.preset5equalizerControls7
                slide8.value = settings.preset5equalizerControls8
                slide9.value = settings.preset5equalizerControls9
                slide10.value = settings.preset5equalizerControls10
            }
        }

        Button {
            id: bttn12
            height: units.gu(4)
            width: units.gu(4)
            anchors.top: bttn10.bottom
            anchors.right: bttn13.left
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
            iconSource: bttn12.pressed ? "../../assets/save_pressed.svg" : (settings.darkMode ? "../../assets/save_darkmode.svg" : "../../assets/save_lightmode.svg")
            StyleHints {
                defaultColor: bttn12.pressed ? "#32517F" : (settings.darkMode ? "#292929" : "#f1f1f1")
            }
            onClicked: {
                settings.preset5equalizerControls1 = slide1.value.toFixed(1)
                settings.preset5equalizerControls2 = slide2.value.toFixed(1)
                settings.preset5equalizerControls3 = slide3.value.toFixed(1)
                settings.preset5equalizerControls4 = slide4.value.toFixed(1)
                settings.preset5equalizerControls5 = slide5.value.toFixed(1)
                settings.preset5equalizerControls6 = slide6.value.toFixed(1)
                settings.preset5equalizerControls7 = slide7.value.toFixed(1)
                settings.preset5equalizerControls8 = slide8.value.toFixed(1)
                settings.preset5equalizerControls9 = slide9.value.toFixed(1)
                settings.preset5equalizerControls10 = slide10.value.toFixed(1)
            }
        }

        ListItem {
            id: lstitm1
            height: lstitmlay1.height + (divider.visible ? divider.height : 0)
            color: settings.darkMode ? "#121212" : "white"
            divider.colorFrom: settings.darkMode ? "#808080" : "black"
            divider.colorTo: settings.darkMode ? "#808080" : "black"
            anchors.top: txtfld5.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.topMargin: units.gu(2)
            width: flick1.width

            ListItemLayout {
                id: lstitmlay1

                Text {
                    id: hlptxt
                    SlotsLayout.position: SlotsLayout.Leading
                    text: i18n.tr("Help")
                    color: settings.darkMode ? "#808080" : "black"
                    font.pointSize: 40
                }
            }
        }

        Icon {
            id: hlpicn1
            source: settings.darkMode ? "../../assets/change_darkmode.svg" : "../../assets/change_lightmode.svg"
            width: units.gu(4)
            height: units.gu(4)
            anchors.top: lstitm1.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(2)
        }

        Text {
            id: txt4
            text: i18n.tr("Apply equalizer changes, when it's already activated.")
            color: settings.darkMode ? "#808080" : "black"
            anchors.top: lstitm1.bottom
            anchors.left: hlpicn1.right
            anchors.right: parent.right
            anchors.leftMargin: units.gu(8)
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(3)
            horizontalAlignment: Text.AlignLeft
            lineHeight: 1.2
            wrapMode: Text.WordWrap
            maximumLineCount: 3
        }

        Icon {
            id: hlpicn2
            source: settings.darkMode ? "../../assets/resetzero_darkmode.svg" : "../../assets/resetzero_lightmode.svg"
            width: units.gu(4)
            height: units.gu(4)
            anchors.top: lstitm1.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(12)
        }

        Text {
            id: txt5
            text: i18n.tr("Reset all bars to 0.0.")
            color: settings.darkMode ? "#808080" : "black"
            anchors.top: lstitm1.bottom
            anchors.left: hlpicn2.right
            anchors.right: parent.right
            anchors.leftMargin: units.gu(8)
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(13)
            horizontalAlignment: Text.AlignLeft
            lineHeight: 1.2
            wrapMode: Text.WordWrap
            maximumLineCount: 3
        }

        Icon {
            id: hlpicn3
            source: settings.darkMode ? "../../assets/save_darkmode.svg" : "../../assets/save_lightmode.svg"
            width: units.gu(4)
            height: units.gu(4)
            anchors.top: lstitm1.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(23)
        }

        Icon {
            id: hlpicn4
            source: settings.darkMode ? "../../assets/load_darkmode.svg" : "../../assets/load_lightmode.svg"
            width: units.gu(4)
            height: units.gu(4)
            anchors.top: lstitm1.bottom
            anchors.left: hlpicn3.right
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(23)
        }

        Text {
            id: txt6
            text: i18n.tr("Save and load a preset. You can also give them a name (please don't forget to confirm with the return key). Apply the loaded equalizer settings by clicking the change button or by activating the equalizer.")
            color: settings.darkMode ? "#808080" : "black"
            anchors.top: lstitm1.bottom
            anchors.left: hlpicn4.right
            anchors.right: parent.right
            anchors.leftMargin: units.gu(2)
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(24)
            horizontalAlignment: Text.AlignLeft
            lineHeight: 1.2
            wrapMode: Text.WordWrap
            maximumLineCount: 10
        }

        Text {
            id: txt7
            text: i18n.tr("Made with ") + "<img src=\"../../assets/heart.png\">" + i18n.tr(" by bbisw")
            color: settings.darkMode ? "#808080" : "black"
            wrapMode: Text.WordWrap
            width: flick1.width
            lineHeight: 1.2
            horizontalAlignment: Text.AlignHCenter
            font.bold: false
            anchors.bottom: txt3.top
            bottomPadding: units.gu(2)
        }

        Text {
            id: txt3
            text: i18n.tr("The caps plugin for the equalizer was published under the GNU Public License (version 3) by Tim Goetze. More information at <a href=\"http://quitte.de/dsp/caps.html\">quitte.de</a>.")
            color: settings.darkMode ? "#808080" : "black"
            wrapMode: Text.WordWrap
            width: flick1.width
            lineHeight: 1.2
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            onLinkActivated: Qt.openUrlExternally(link)
            anchors.bottom: txt8.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: units.gu(2)
            anchors.rightMargin: units.gu(2)
            bottomPadding: units.gu(2)
        }

        Text {
            id: txt8
            text: i18n.tr("The pulse-vumeter binary was compiled from the source code found at <a href=\"https://github.com/Luciousdev/pulse-vumeter\">github.com</a>.")
            color: settings.darkMode ? "#808080" : "black"
            wrapMode: Text.WordWrap
            width: flick1.width
            lineHeight: 1.2
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            onLinkActivated: Qt.openUrlExternally(link)
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: units.gu(2)
            anchors.rightMargin: units.gu(2)
            bottomPadding: units.gu(2)
        }
    }
}*/
