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

Rectangle {
    id: mainPage
    anchors.fill: parent

    color: drkMd ? "#121212" : "white"

    property alias eqsts: settings.equalizerStatus
    property alias drkMd: settings.darkMode

    Timer {
        id: timer
    }

    function delay(delayTime,cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }

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

        property real output

        onStarted: print("pulse-vumeter started")
        onFinished: print("Closed")

        onErrorOccurred: console.log("Error Occurred: ", error)

        onReadyReadStandardOutput: {
            output = process6.readAll()
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
            if (eqsts === true) {
                console.log("EQ is still active");
            } else if (eqsts === false) {
                console.log("EQ is inactive");
            }
            console.log("Goodbye!");
        }
    }

    Component.onCompleted: {
        process5.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.7/scripts/equalizer_stop.sh"])
        eqswitch.checked = false
        eqsts = false
        prgrssbr.value = 0
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
                enabled: {
                    if (eqsts === true) {
                        true
                    } else if (eqsts === false) {
                        false
                    }
                }
                onClicked: {
                    process4.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.7/scripts/equalizer_stop.sh"])
                    bttn3.enabled = true
                    eqswitch.checked = false
                    txt2.text = ""
                    eqsts = false
                    process6.kill()
                    delay(500, function() {
                        prgrssbr.value = 0
                    })
                }
                StyleHints {
                    defaultColor: bttn2.pressed ? "#32517F" : "yellow"
                }
            }
            Button {
                id: bttn3
                enabled: {
                    if (eqsts === true) {
                        false
                    } else if (eqsts === false) {
                        true
                    }
                }
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
            foregroundColor: drkMd ? "#808080" : "black"
            backgroundColor: drkMd ? "#121212" : "white"
            dividerColor: drkMd ? "#808080" : "black"
        }
        contents: Rectangle {
            id: hdrrec
            anchors.fill: parent
            color: drkMd ? "#121212" : "white"
            Text {
                id: hdrtxt
                anchors.left: hdrrec.left
                anchors.verticalCenter: hdrrec.verticalCenter
                text: header.title
                color: drkMd ? "#808080" : "black"
                font.pointSize: units.gu(2)
            }
            Rectangle {
                id: clsbttn
                height: units.gu(4)
                width: units.gu(4)
                anchors.right: hdrrec.right
                anchors.verticalCenter: hdrrec.verticalCenter
                radius: units.gu(1)
                color: clsbttnma.pressed ? "red" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: clsbttnicn
                source: clsbttnma.pressed ? "../../assets/close_pressed.svg" : (drkMd ? "../../assets/close_darkmode.svg" : "../../assets/close_lightmode.svg")
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
//        contentHeight: units.gu(175)
        contentHeight: units.gu(180)
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
            spacing: units.gu(0.1)
            anchors.horizontalCenter: parent.horizontalCenter
            topPadding: units.gu(3)
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide1.value
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
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
                        width: units.gu(0.5)
                        height: slide1.availableHeight
                        radius: units.gu(0.25)
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "transparent" }
                            GradientStop { position: 0.05; color: "transparent" }
                            GradientStop { position: 0.05; color: "#32517F" } 
                            GradientStop { position: 0.1; color: "#32517F" }
                        }

                        Rectangle {
                            width: parent.width
                            height: slide1.visualPosition * parent.height
                            color: drkMd ? "#808080" : "#f1f1f1"
                            radius: units.gu(0.25)
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide1hndl
                        x: slide1.leftPadding + (slide1.horizontal ? slide1.visualPosition * (slide1.availableWidth - width) : (slide1.availableWidth - width) / 2)
                        y: slide1.topPadding + (slide1.vertical ? slide1.visualPosition * (slide1.availableHeight - height) : (slide1.availableHeight - height) / 2)
                        width: units.gu(3)
                        height: units.gu(3)
                        radius: units.gu(1.5)
                        color: slide1.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
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
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide2.value
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
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
                        width: units.gu(0.5)
                        height: slide2.availableHeight
                        radius: units.gu(0.25)
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "transparent" }
                            GradientStop { position: 0.05; color: "transparent" }
                            GradientStop { position: 0.05; color: "#32517F" } 
                            GradientStop { position: 0.1; color: "#32517F" }
                        }

                        Rectangle {
                            width: parent.width
                            height: slide2.visualPosition * parent.height
                            color: drkMd ? "#808080" : "#f1f1f1"
                            radius: units.gu(0.25)
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide2hndl
                        x: slide2.leftPadding + (slide2.horizontal ? slide2.visualPosition * (slide2.availableWidth - width) : (slide2.availableWidth - width) / 2)
                        y: slide2.topPadding + (slide2.vertical ? slide2.visualPosition * (slide2.availableHeight - height) : (slide2.availableHeight - height) / 2)
                        width: units.gu(3)
                        height: units.gu(3)
                        radius: units.gu(1.5)
                        color: slide2.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
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
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide3.value
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
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
                        width: units.gu(0.5)
                        height: slide3.availableHeight
                        radius: units.gu(0.25)
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "transparent" }
                            GradientStop { position: 0.05; color: "transparent" }
                            GradientStop { position: 0.05; color: "#32517F" } 
                            GradientStop { position: 0.1; color: "#32517F" }
                        }

                        Rectangle {
                            width: parent.width
                            height: slide3.visualPosition * parent.height
                            color: drkMd ? "#808080" : "#f1f1f1"
                            radius: units.gu(0.25)
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide3hndl
                        x: slide3.leftPadding + (slide3.horizontal ? slide3.visualPosition * (slide3.availableWidth - width) : (slide3.availableWidth - width) / 2)
                        y: slide3.topPadding + (slide3.vertical ? slide3.visualPosition * (slide3.availableHeight - height) : (slide3.availableHeight - height) / 2)
                        width: units.gu(3)
                        height: units.gu(3)
                        radius: units.gu(1.5)
                        color: slide3.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
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
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide4.value
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
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
                        width: units.gu(0.5)
                        height: slide4.availableHeight
                        radius: units.gu(0.25)
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "transparent" }
                            GradientStop { position: 0.05; color: "transparent" }
                            GradientStop { position: 0.05; color: "#32517F" } 
                            GradientStop { position: 0.1; color: "#32517F" }
                        }

                        Rectangle {
                            width: parent.width
                            height: slide4.visualPosition * parent.height
                            color: drkMd ? "#808080" : "#f1f1f1"
                            radius: units.gu(0.25)
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide4hndl
                        x: slide4.leftPadding + (slide4.horizontal ? slide4.visualPosition * (slide4.availableWidth - width) : (slide4.availableWidth - width) / 2)
                        y: slide4.topPadding + (slide4.vertical ? slide4.visualPosition * (slide4.availableHeight - height) : (slide4.availableHeight - height) / 2)
                        width: units.gu(3)
                        height: units.gu(3)
                        radius: units.gu(1.5)
                        color: slide4.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
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
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide5.value
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
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
                        width: units.gu(0.5)
                        height: slide5.availableHeight
                        radius: units.gu(0.25)
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "transparent" }
                            GradientStop { position: 0.05; color: "transparent" }
                            GradientStop { position: 0.05; color: "#32517F" } 
                            GradientStop { position: 0.1; color: "#32517F" }
                        }

                        Rectangle {
                            width: parent.width
                            height: slide5.visualPosition * parent.height
                            color: drkMd ? "#808080" : "#f1f1f1"
                            radius: units.gu(0.25)
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide5hndl
                        x: slide5.leftPadding + (slide5.horizontal ? slide5.visualPosition * (slide5.availableWidth - width) : (slide5.availableWidth - width) / 2)
                        y: slide5.topPadding + (slide5.vertical ? slide5.visualPosition * (slide5.availableHeight - height) : (slide5.availableHeight - height) / 2)
                        width: units.gu(3)
                        height: units.gu(3)
                        radius: units.gu(1.5)
                        color: slide5.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
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
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide6.value
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
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
                        width: units.gu(0.5)
                        height: slide6.availableHeight
                        radius: units.gu(0.25)
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "transparent" }
                            GradientStop { position: 0.05; color: "transparent" }
                            GradientStop { position: 0.05; color: "#32517F" } 
                            GradientStop { position: 0.1; color: "#32517F" }
                        }

                        Rectangle {
                            width: parent.width
                            height: slide6.visualPosition * parent.height
                            color: drkMd ? "#808080" : "#f1f1f1"
                            radius: units.gu(0.25)
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide6hndl
                        x: slide6.leftPadding + (slide6.horizontal ? slide6.visualPosition * (slide6.availableWidth - width) : (slide6.availableWidth - width) / 2)
                        y: slide6.topPadding + (slide6.vertical ? slide6.visualPosition * (slide6.availableHeight - height) : (slide6.availableHeight - height) / 2)
                        width: units.gu(3)
                        height: units.gu(3)
                        radius: units.gu(1.5)
                        color: slide6.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
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
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide7.value
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
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
                        width: units.gu(0.5)
                        height: slide7.availableHeight
                        radius: units.gu(0.25)
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "transparent" }
                            GradientStop { position: 0.05; color: "transparent" }
                            GradientStop { position: 0.05; color: "#32517F" } 
                            GradientStop { position: 0.1; color: "#32517F" }
                        }

                        Rectangle {
                            width: parent.width
                            height: slide7.visualPosition * parent.height
                            color: drkMd ? "#808080" : "#f1f1f1"
                            radius: units.gu(0.25)
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide7hndl
                        x: slide7.leftPadding + (slide7.horizontal ? slide7.visualPosition * (slide7.availableWidth - width) : (slide7.availableWidth - width) / 2)
                        y: slide7.topPadding + (slide7.vertical ? slide7.visualPosition * (slide7.availableHeight - height) : (slide7.availableHeight - height) / 2)
                        width: units.gu(3)
                        height: units.gu(3)
                        radius: units.gu(1.5)
                        color: slide7.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
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
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide8.value
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
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
                        width: units.gu(0.5)
                        height: slide8.availableHeight
                        radius: units.gu(0.25)
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "transparent" }
                            GradientStop { position: 0.05; color: "transparent" }
                            GradientStop { position: 0.05; color: "#32517F" } 
                            GradientStop { position: 0.1; color: "#32517F" }
                        }

                        Rectangle {
                            width: parent.width
                            height: slide8.visualPosition * parent.height
                            color: drkMd ? "#808080" : "#f1f1f1"
                            radius: units.gu(0.25)
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide8hndl
                        x: slide8.leftPadding + (slide8.horizontal ? slide8.visualPosition * (slide8.availableWidth - width) : (slide8.availableWidth - width) / 2)
                        y: slide8.topPadding + (slide8.vertical ? slide8.visualPosition * (slide8.availableHeight - height) : (slide8.availableHeight - height) / 2)
                        width: units.gu(3)
                        height: units.gu(3)
                        radius: units.gu(1.5)
                        color: slide8.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
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
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide9.value
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
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
                        width: units.gu(0.5)
                        height: slide9.availableHeight
                        radius: units.gu(0.25)
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "transparent" }
                            GradientStop { position: 0.05; color: "transparent" }
                            GradientStop { position: 0.05; color: "#32517F" } 
                            GradientStop { position: 0.1; color: "#32517F" }
                        }

                        Rectangle {
                            width: parent.width
                            height: slide9.visualPosition * parent.height
                            color: drkMd ? "#808080" : "#f1f1f1"
                            radius: units.gu(0.25)
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide9hndl
                        x: slide9.leftPadding + (slide9.horizontal ? slide9.visualPosition * (slide9.availableWidth - width) : (slide9.availableWidth - width) / 2)
                        y: slide9.topPadding + (slide9.vertical ? slide9.visualPosition * (slide9.availableHeight - height) : (slide9.availableHeight - height) / 2)
                        width: units.gu(3)
                        height: units.gu(3)
                        radius: units.gu(1.5)
                        color: slide9.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
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
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
                }
            }
            Column {
                Label {
                    width: parent.width
                    horizontalAlignment: Text.AlignHCenter
                    text: slide10.value
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
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
                        width: units.gu(0.5)
                        height: slide10.availableHeight
                        radius: units.gu(0.25)
                        border.width: 0
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "transparent" }
                            GradientStop { position: 0.05; color: "transparent" }
                            GradientStop { position: 0.05; color: "#32517F" } 
                            GradientStop { position: 0.1; color: "#32517F" }
                        }

                        Rectangle {
                            width: parent.width
                            height: slide10.visualPosition * parent.height
                            color: drkMd ? "#808080" : "#f1f1f1"
                            radius: units.gu(0.25)
                            border.width: 0
                        }
                    }
                    handle: Rectangle {
                        id: slide10hndl
                        x: slide10.leftPadding + (slide10.horizontal ? slide10.visualPosition * (slide10.availableWidth - width) : (slide10.availableWidth - width) / 2)
                        y: slide10.topPadding + (slide10.vertical ? slide10.visualPosition * (slide10.availableHeight - height) : (slide10.availableHeight - height) / 2)
                        width: units.gu(3)
                        height: units.gu(3)
                        radius: units.gu(1.5)
                        color: slide10.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
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
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(1)
                }
            }
        }

        Qqc.Slider {
            id: prgrssbr
            from: 0.00
            to: 1.00
            live: true
            stepSize: 0.01
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: row1.bottom
            anchors.topMargin: units.gu(1)
            enabled: true

            MouseArea {
                anchors.fill: parent
                enabled: true
            }

            background: Rectangle {
                x: (prgrssbr.width  - width) / 2
                y: (prgrssbr.height - height) / 2
                width: prgrssbr.availableWidth
                height: units.gu(0.5)
                radius: units.gu(0.25)
                color: drkMd ? "#808080" : "#f1f1f1"

                Rectangle {
                    width: prgrssbr.visualPosition * parent.width
                    height: parent.height
                    color: "#32517F"
                    radius: units.gu(0.25)
                }
            }

            handle: Rectangle {
                visible: false
                x: prgrssbr.leftPadding + (prgrssbr.horizontal ? prgrssbr.visualPosition * (prgrssbr.availableWidth - width) : (prgrssbr.availableWidth - width) / 2)
                y: prgrssbr.topPadding + (prgrssbr.vertical ? prgrssbr.visualPosition * (prgrssbr.availableHeight - height) : (prgrssbr.availableHeight - height) / 2)
                implicitWidth: 26
                implicitHeight: 26
                radius: 13
                color: prgrssbr.pressed ? "#32517F" : "#292929"
            }
        }

        Item {
            id: itm1
            anchors.top: prgrssbr.bottom
            anchors.left: parent.left
            anchors.leftMargin: (((parent.width / 4) + (parent.width / 4)) - units.gu(14))
            anchors.topMargin: units.gu(1)
            Rectangle {
                id: chngbttn
                height: units.gu(4)
                width: units.gu(4)
                radius: units.gu(1)
                color: chngbttnma.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: chngbttnicn
                source: chngbttnma.pressed ? "../../assets/change_pressed.svg" : (drkMd ? "../../assets/change_darkmode.svg" : "../../assets/change_lightmode.svg")
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
                    process3.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.7/scripts/equalizer_change.sh"])
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
            anchors.left: parent.left
            anchors.leftMargin: (((parent.width / 4) + (parent.width / 4)) - units.gu(3.5))
            anchors.top: prgrssbr.bottom
            anchors.topMargin: units.gu(1)

            indicator: Rectangle {
                id: rec1
                implicitWidth: units.gu(6)
                implicitHeight: units.gu(3)
                x: eqswitch.leftPadding
                y: parent.height / 2 - height / 2
                radius: units.gu(1.5)
                color: drkMd ? (eqswitch.checked ? "#32517F" : "#808080") : (eqswitch.checked ? "#32517F" : "#f1f1f1")

                Text {
                    id: txt
                    color: drkMd ? (eqswitch.checked ? "#808080" : "#292929") : (eqswitch.checked ? "white" : "black")
                    text: "I"
                    anchors.verticalCenter: rec5.verticalCenter
                    anchors.horizontalCenter: rec5.horizontalCenter
                }

                Rectangle {
                    id: rec5
                    visible: false
                    width: units.gu(3)
                    height: units.gu(3)
                    anchors.left: rec1.left
                    anchors.verticalCenter: rec1.verticalCenter
                    radius: units.gu(1.5)
                }

                Text {
                    id: txt10
                    color: drkMd ? (eqswitch.checked ? "#808080" : "#292929") : (eqswitch.checked ? "white" : "black")
                    text: "O"
                    anchors.verticalCenter: rec6.verticalCenter
                    anchors.horizontalCenter: rec6.horizontalCenter
                }

                Rectangle {
                    id: rec6
                    visible: false
                    width: units.gu(3)
                    height: units.gu(3)
                    anchors.right: rec1.right
                    anchors.verticalCenter: rec1.verticalCenter
                    radius: units.gu(1.5)
                }

                Rectangle {
                    id: rec2
                    x: eqswitch.checked ? parent.width - width : 0
                    width: units.gu(3)
                    height: units.gu(3)
                    radius: units.gu(1.5)
                    color: drkMd ? (eqswitch.down ? "#32517F" : "#292929") : (eqswitch.down ? "#32517F" : "white")
                }
                DropShadow {
                    anchors.fill: rec2
                    horizontalOffset: 1
                    verticalOffset: 1
                    radius: 6
                    samples: 13
                    color: "black"
                    source: rec2
                    spread: 0
                    cached: true
                }
            }
            onToggled: {
                if (eqsts === true) {                    
                    process2.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.7/scripts/equalizer_stop.sh"])
                    eqsts = checked
                    txt2.text = ""
                    process6.kill()
                    delay(500, function() {
                        prgrssbr.value = 0
                    })
                } else if (eqsts === false) {
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
                    process.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.7/scripts/equalizer_start.sh"])
                    eqsts = checked
                    txt2.text = i18n.tr("Please turn the equalizer off and on again after changing audio output.")
                    process6.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.7/bin/pulse-vumeter"])
                }
            }
        }

        Item {
            id: itm2
            anchors.top: prgrssbr.bottom
            anchors.right: parent.right
            anchors.rightMargin: ((((parent.width / 4) + (parent.width / 4)) - units.gu(14)) + units.gu(4))
            anchors.topMargin: units.gu(1)
            Rectangle {
                id: rstbttn
                height: units.gu(4)
                width: units.gu(4)
                radius: units.gu(1)
                color: rstbttnma.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: rstbttnicn
                source: rstbttnma.pressed ? "../../assets/resetzero_pressed.svg" : (drkMd ? "../../assets/resetzero_darkmode.svg" : "../../assets/resetzero_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: rstbttn
                z: 2
            }
            MouseArea {
                id: rstbttnma
                anchors.fill: rstbttn
 
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
            DropShadow {
                anchors.fill: rstbttn
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: rstbttn
                spread: 0
                cached: true
            }
        }

        Text {
            id: txt2
            text: ""
            color: "red"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: prgrssbr.bottom
            anchors.topMargin: units.gu(8)
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
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: txt2.bottom
            anchors.topMargin: units.gu(3)
            width: parent.width
            height: units.gu(5) - txt2.height
        }

        Text {
            id: txt1
            text: i18n.tr("Dark mode")
            color: drkMd ? "#808080" : "black"
            anchors.top: plchldrrec.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(3)
        }

        Qqc.Switch {
            id: drkmdswitch
            checked: drkMd
            anchors.top: plchldrrec.bottom
            anchors.right: parent.right
            anchors.topMargin: units.gu(2)

            indicator: Rectangle {
                id: rec3
                implicitWidth: units.gu(6)
                implicitHeight: units.gu(3)
                x: drkmdswitch.leftPadding
                y: parent.height / 2 - height / 2
                radius: units.gu(1.5)
                color: drkMd ? (drkmdswitch.checked ? "#32517F" : "#808080") : (drkmdswitch.checked ? "#32517F" : "#f1f1f1")

                Text {
                    id: txt9
                    color: drkMd ? (drkmdswitch.checked ? "#808080" : "#292929") : (drkmdswitch.checked ? "white" : "black")
                    text: "I"
                    anchors.verticalCenter: rec7.verticalCenter
                    anchors.horizontalCenter: rec7.horizontalCenter
                }

                Rectangle {
                    id: rec7
                    visible: false
                    width: units.gu(3)
                    height: units.gu(3)
                    anchors.left: rec3.left
                    anchors.verticalCenter: rec3.verticalCenter
                    radius: units.gu(1.5)
                }

                Text {
                    id: txt11
                    color: drkMd ? (drkmdswitch.checked ? "#808080" : "#292929") : (drkmdswitch.checked ? "white" : "black")
                    text: "O"
                    anchors.verticalCenter: rec8.verticalCenter
                    anchors.horizontalCenter: rec8.horizontalCenter
                }

                Rectangle {
                    id: rec8
                    visible: false
                    width: units.gu(3)
                    height: units.gu(3)
                    anchors.right: rec3.right
                    anchors.verticalCenter: rec3.verticalCenter
                    radius: units.gu(1.5)
                }

                Rectangle {
                    id: rec4
                    x: drkmdswitch.checked ? parent.width - width : 0
                    width: units.gu(3)
                    height: units.gu(3)
                    radius: units.gu(1.5)
                    color: drkMd ? (drkmdswitch.down ? "#32517F" : "#292929") : (drkmdswitch.down ? "#32517F" : "white")
                }
                DropShadow {
                    anchors.fill: rec4
                    horizontalOffset: 1
                    verticalOffset: 1
                    radius: 6
                    samples: 13
                    color: "black"
                    source: rec4
                    spread: 0
                    cached: true
                }
            }
            onToggled: {
                drkMd = checked
            }
        }

        Qqc.TextField {
            id: txtfld1
            color: drkMd ? "#808080" : "black"
            selectedTextColor: drkMd ? "#808080" : "white"
            selectionColor: "#32517F"
            text: settings.preset1name
            placeholderText: i18n.tr("Preset 1")
            anchors.top: txt1.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(3)
            background: Item {
                id: itm13
                Rectangle {
                    id: txtfld1rec
                    anchors.fill: parent
                    color: drkMd ? "#292929" : "white"
                    height: units.gu(4)
                    radius: units.gu(1)
                }

                DropShadow {
                    anchors.fill: txtfld1rec
                    horizontalOffset: 1
                    verticalOffset: 1
                    radius: 6
                    samples: 13
                    color: "black"
                    source: txtfld1rec
                    spread: 0
                    cached: true
                }
            }
            font.pixelSize: txt1.font.pixelSize
            width: flick1.width - units.gu(16)
            onAccepted: {
                settings.preset1name = txtfld1.text
                txtfld1.text = settings.preset1name
                ma1.focus = true
            }

            cursorDelegate: Rectangle {
                id: cursor
                visible: false
                color: drkMd ? "#808080" : "black"
                width: txtfld1.cursorRectangle.width

                SequentialAnimation {
                    loops: Animation.Infinite
                    running: txtfld1.cursorVisible

                    PropertyAction {
                        target: cursor
                        property: 'visible'
                        value: true
                    }

                    PauseAnimation {
                        duration: 600
                    }

                    PropertyAction {
                        target: cursor
                        property: 'visible'
                        value: false
                    }

                    PauseAnimation {
                        duration: 600
                    }

                    onStopped: {
                        cursor.visible = false
                    }
                }
            }

        }

        Item {
            id: itm3
            anchors.top: txt1.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(6)
            anchors.topMargin: units.gu(3)
            Rectangle {
                id: bttn5
                height: units.gu(4)
                width: units.gu(4)
                radius: units.gu(1)
                color: bttn5ma.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: bttn5icn
                source: bttn5ma.pressed ? "../../assets/load_pressed.svg" : (drkMd ? "../../assets/load_darkmode.svg" : "../../assets/load_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: bttn5
                z: 2
            }
            MouseArea {
                id: bttn5ma
                anchors.fill: bttn5
 
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
            DropShadow {
                anchors.fill: bttn5
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: bttn5
                spread: 0
                cached: true
            }
        }

        Item {
            id: itm4
            anchors.top: txt1.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(12)
            anchors.topMargin: units.gu(3)
            Rectangle {
                id: bttn4
                height: units.gu(4)
                width: units.gu(4)
                radius: units.gu(1)
                color: bttn4ma.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: bttn4icn
                source: bttn4ma.pressed ? "../../assets/save_pressed.svg" : (drkMd ? "../../assets/save_darkmode.svg" : "../../assets/save_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: bttn4
                z: 2
            }
            MouseArea {
                id: bttn4ma
                anchors.fill: bttn4
 
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
            DropShadow {
                anchors.fill: bttn4
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: bttn4
                spread: 0
                cached: true
            }
        }

        Qqc.TextField {
            id: txtfld2
            color: drkMd ? "#808080" : "black"
            selectedTextColor: drkMd ? "#808080" : "white"
            selectionColor: "#32517F"
            text: settings.preset2name
            placeholderText: i18n.tr("Preset 2")
            anchors.top: txtfld1.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(2)

            background: Item {
                id: itm14
                Rectangle {
                    id: txtfld2rec
                    anchors.fill: parent
                    color: drkMd ? "#292929" : "white"
                    height: units.gu(4)
                    radius: units.gu(1)
                }

                DropShadow {
                    anchors.fill: txtfld2rec
                    horizontalOffset: 1
                    verticalOffset: 1
                    radius: 6
                    samples: 13
                    color: "black"
                    source: txtfld2rec
                    spread: 0
                    cached: true
                }
            }
            font.pixelSize: txt1.font.pixelSize
            width: flick1.width - units.gu(16)

            onAccepted: {
                settings.preset2name = txtfld2.text
                txtfld2.text = settings.preset2name
                ma1.focus = true
            }

            cursorDelegate: Rectangle {
                id: cursor2
                visible: false
                color: drkMd ? "#808080" : "black"
                width: txtfld2.cursorRectangle.width

                SequentialAnimation {
                    loops: Animation.Infinite
                    running: txtfld2.cursorVisible

                    PropertyAction {
                        target: cursor2
                        property: 'visible'
                        value: true
                    }

                    PauseAnimation {
                        duration: 600
                    }

                    PropertyAction {
                        target: cursor2
                        property: 'visible'
                        value: false
                    }

                    PauseAnimation {
                        duration: 600
                    }

                    onStopped: {
                        cursor2.visible = false
                    }
                }
            }

        }

        Item {
            id: itm5
            anchors.top: itm3.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(6)
            anchors.topMargin: units.gu(6)
            Rectangle {
                id: bttn7
                height: units.gu(4)
                width: units.gu(4)
                radius: units.gu(1)
                color: bttn7ma.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: bttn7icn
                source: bttn7ma.pressed ? "../../assets/load_pressed.svg" : (drkMd ? "../../assets/load_darkmode.svg" : "../../assets/load_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: bttn7
                z: 2
            }
            MouseArea {
                id: bttn7ma
                anchors.fill: bttn7
 
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
            DropShadow {
                anchors.fill: bttn7
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: bttn7
                spread: 0
                cached: true
            }
        }

        Item {
            id: itm6
            anchors.top: itm4.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(12)
            anchors.topMargin: units.gu(6)
            Rectangle {
                id: bttn6
                height: units.gu(4)
                width: units.gu(4)
                radius: units.gu(1)
                color: bttn6ma.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: bttn6icn
                source: bttn6ma.pressed ? "../../assets/save_pressed.svg" : (drkMd ? "../../assets/save_darkmode.svg" : "../../assets/save_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: bttn6
                z: 2
            }
            MouseArea {
                id: bttn6ma
                anchors.fill: bttn6
 
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
            DropShadow {
                anchors.fill: bttn6
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: bttn6
                spread: 0
                cached: true
            }
        }

        Qqc.TextField {
            id: txtfld3
            color: drkMd ? "#808080" : "black"
            selectedTextColor: drkMd ? "#808080" : "white"
            selectionColor: "#32517F"
            text: settings.preset3name
            placeholderText: i18n.tr("Preset 3")
            anchors.top: txtfld2.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(2)

            background: Item {
                id: itm15
                Rectangle {
                    id: txtfld3rec
                    anchors.fill: parent
                    color: drkMd ? "#292929" : "white"
                    height: units.gu(4)
                    radius: units.gu(1)
                }

                DropShadow {
                    anchors.fill: txtfld3rec
                    horizontalOffset: 1
                    verticalOffset: 1
                    radius: 6
                    samples: 13
                    color: "black"
                    source: txtfld3rec
                    spread: 0
                    cached: true
                }
            }
            font.pixelSize: txt1.font.pixelSize
            width: flick1.width - units.gu(16)

            onAccepted: {
                settings.preset3name = txtfld3.text
                txtfld3.text = settings.preset3name
                ma1.focus = true
            }

            cursorDelegate: Rectangle {
                id: cursor3
                visible: false
                color: drkMd ? "#808080" : "black"
                width: txtfld3.cursorRectangle.width

                SequentialAnimation {
                    loops: Animation.Infinite
                    running: txtfld3.cursorVisible

                    PropertyAction {
                        target: cursor3
                        property: 'visible'
                        value: true
                    }

                    PauseAnimation {
                        duration: 600
                    }

                    PropertyAction {
                        target: cursor3
                        property: 'visible'
                        value: false
                    }

                    PauseAnimation {
                        duration: 600
                    }

                    onStopped: {
                        cursor3.visible = false
                    }
                }
            }

        }

        Item {
            id: itm7
            anchors.top: itm5.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(6)
            anchors.topMargin: units.gu(6)
            Rectangle {
                id: bttn9
                height: units.gu(4)
                width: units.gu(4)
                radius: units.gu(1)
                color: bttn9ma.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: bttn9icn
                source: bttn9ma.pressed ? "../../assets/load_pressed.svg" : (drkMd ? "../../assets/load_darkmode.svg" : "../../assets/load_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: bttn9
                z: 2
            }
            MouseArea {
                id: bttn9ma
                anchors.fill: bttn9
 
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
            DropShadow {
                anchors.fill: bttn9
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: bttn9
                spread: 0
                cached: true
            }
        }

        Item {
            id: itm8
            anchors.top: itm6.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(12)
            anchors.topMargin: units.gu(6)
            Rectangle {
                id: bttn8
                height: units.gu(4)
                width: units.gu(4)
                radius: units.gu(1)
                color: bttn8ma.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: bttn8icn
                source: bttn8ma.pressed ? "../../assets/save_pressed.svg" : (drkMd ? "../../assets/save_darkmode.svg" : "../../assets/save_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: bttn8
                z: 2
            }
            MouseArea {
                id: bttn8ma
                anchors.fill: bttn8
 
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
            DropShadow {
                anchors.fill: bttn8
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: bttn8
                spread: 0
                cached: true
            }
        }

        Qqc.TextField {
            id: txtfld4
            color: drkMd ? "#808080" : "black"
            selectedTextColor: drkMd ? "#808080" : "white"
            selectionColor: "#32517F"
            text: settings.preset4name
            placeholderText: i18n.tr("Preset 4")
            anchors.top: txtfld3.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(2)

            background: Item {
                id: itm16
                Rectangle {
                    id: txtfld4rec
                    anchors.fill: parent
                    color: drkMd ? "#292929" : "white"
                    height: units.gu(4)
                    radius: units.gu(1)
                }

                DropShadow {
                    anchors.fill: txtfld4rec
                    horizontalOffset: 1
                    verticalOffset: 1
                    radius: 6
                    samples: 13
                    color: "black"
                    source: txtfld4rec
                    spread: 0
                    cached: true
                }
            }
            font.pixelSize: txt1.font.pixelSize
            width: flick1.width - units.gu(16)

            onAccepted: {
                settings.preset4name = txtfld4.text
                txtfld4.text = settings.preset4name
                ma1.focus = true
            }

            cursorDelegate: Rectangle {
                id: cursor4
                visible: false
                color: drkMd ? "#808080" : "black"
                width: txtfld4.cursorRectangle.width

                SequentialAnimation {
                    loops: Animation.Infinite
                    running: txtfld4.cursorVisible

                    PropertyAction {
                        target: cursor4
                        property: 'visible'
                        value: true
                    }

                    PauseAnimation {
                        duration: 600
                    }

                    PropertyAction {
                        target: cursor4
                        property: 'visible'
                        value: false
                    }

                    PauseAnimation {
                        duration: 600
                    }

                    onStopped: {
                        cursor4.visible = false
                    }
                }
            }

        }

        Item {
            id: itm9
            anchors.top: itm7.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(6)
            anchors.topMargin: units.gu(6)
            Rectangle {
                id: bttn11
                height: units.gu(4)
                width: units.gu(4)
                radius: units.gu(1)
                color: bttn11ma.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: bttn11icn
                source: bttn11ma.pressed ? "../../assets/load_pressed.svg" : (drkMd ? "../../assets/load_darkmode.svg" : "../../assets/load_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: bttn11
                z: 2
            }
            MouseArea {
                id: bttn11ma
                anchors.fill: bttn11
 
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
            DropShadow {
                anchors.fill: bttn11
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: bttn11
                spread: 0
                cached: true
            }
        }

        Item {
            id: itm10
            anchors.top: itm8.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(12)
            anchors.topMargin: units.gu(6)
            Rectangle {
                id: bttn10
                height: units.gu(4)
                width: units.gu(4)
                radius: units.gu(1)
                color: bttn10ma.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: bttn10icn
                source: bttn10ma.pressed ? "../../assets/save_pressed.svg" : (drkMd ? "../../assets/save_darkmode.svg" : "../../assets/save_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: bttn10
                z: 2
            }
            MouseArea {
                id: bttn10ma
                anchors.fill: bttn10
 
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
            DropShadow {
                anchors.fill: bttn10
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: bttn10
                spread: 0
                cached: true
            }
        }

        Qqc.TextField {
            id: txtfld5
            color: drkMd ? "#808080" : "black"
            selectedTextColor: drkMd ? "#808080" : "white"
            selectionColor: "#32517F"
            text: settings.preset5name
            placeholderText: i18n.tr("Preset 5")
            anchors.top: txtfld4.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(2)

            background: Item {
                id: itm17
                Rectangle {
                    id: txtfld5rec
                    anchors.fill: parent
                    color: drkMd ? "#292929" : "white"
                    height: units.gu(4)
                    radius: units.gu(1)
                }

                DropShadow {
                    anchors.fill: txtfld5rec
                    horizontalOffset: 1
                    verticalOffset: 1
                    radius: 6
                    samples: 13
                    color: "black"
                    source: txtfld5rec
                    spread: 0
                    cached: true
                }
            }
            font.pixelSize: txt1.font.pixelSize
            width: flick1.width - units.gu(16)

            onAccepted: {
                settings.preset5name = txtfld5.text
                txtfld5.text = settings.preset5name
                ma1.focus = true
            }

            cursorDelegate: Rectangle {
                id: cursor5
                visible: false
                color: drkMd ? "#808080" : "black"
                width: txtfld5.cursorRectangle.width

                SequentialAnimation {
                    loops: Animation.Infinite
                    running: txtfld5.cursorVisible

                    PropertyAction {
                        target: cursor5
                        property: 'visible'
                        value: true
                    }

                    PauseAnimation {
                        duration: 600
                    }

                    PropertyAction {
                        target: cursor5
                        property: 'visible'
                        value: false
                    }

                    PauseAnimation {
                        duration: 600
                    }

                    onStopped: {
                        cursor5.visible = false
                    }
                }
            }

        }

        Item {
            id: itm11
            anchors.top: itm9.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(6)
            anchors.topMargin: units.gu(6)
            Rectangle {
                id: bttn13
                height: units.gu(4)
                width: units.gu(4)
                radius: units.gu(1)
                color: bttn13ma.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: bttn13icn
                source: bttn13ma.pressed ? "../../assets/load_pressed.svg" : (drkMd ? "../../assets/load_darkmode.svg" : "../../assets/load_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: bttn13
                z: 2
            }
            MouseArea {
                id: bttn13ma
                anchors.fill: bttn13
 
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
            DropShadow {
                anchors.fill: bttn13
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: bttn13
                spread: 0
                cached: true
            }
        }

        Item {
            id: itm12
            anchors.top: itm10.bottom
            anchors.right: parent.right
            anchors.rightMargin: units.gu(12)
            anchors.topMargin: units.gu(6)
            Rectangle {
                id: bttn12
                height: units.gu(4)
                width: units.gu(4)
                radius: units.gu(1)
                color: bttn12ma.pressed ? "#32517F" : (drkMd ? "#292929" : "white")
            }
            Icon {
                id: bttn12icn
                source: bttn12ma.pressed ? "../../assets/save_pressed.svg" : (drkMd ? "../../assets/save_darkmode.svg" : "../../assets/save_lightmode.svg")
                width: units.gu(3)
                height: units.gu(3)
                anchors.centerIn: bttn12
                z: 2
            }
            MouseArea {
                id: bttn12ma
                anchors.fill: bttn12
 
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
            DropShadow {
                anchors.fill: bttn12
                horizontalOffset: 1
                verticalOffset: 1
                radius: 6
                samples: 13
                color: "black"
                source: bttn12
                spread: 0
                cached: true
            }
        }

        ListItem {
            id: lstitm1
            height: header.height
            color: drkMd ? "#121212" : "white"
            divider.colorFrom: drkMd ? "#808080" : "black"
            divider.colorTo: drkMd ? "#808080" : "black"
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
                    color: drkMd ? "#808080" : "black"
                    font.pointSize: units.gu(2)
                    height: lstitm1.height
                    verticalAlignment: Text.AlignVCenter
                    bottomPadding: units.gu(2)
                }
            }
        }

        Icon {
            id: hlpicn1
            source: drkMd ? "../../assets/change_darkmode.svg" : "../../assets/change_lightmode.svg"
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
            color: drkMd ? "#808080" : "black"
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
            source: drkMd ? "../../assets/resetzero_darkmode.svg" : "../../assets/resetzero_lightmode.svg"
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
            color: drkMd ? "#808080" : "black"
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
            source: drkMd ? "../../assets/save_darkmode.svg" : "../../assets/save_lightmode.svg"
            width: units.gu(4)
            height: units.gu(4)
            anchors.top: lstitm1.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(23)
        }

        Icon {
            id: hlpicn4
            source: drkMd ? "../../assets/load_darkmode.svg" : "../../assets/load_lightmode.svg"
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
            color: drkMd ? "#808080" : "black"
            anchors.top: lstitm1.bottom
            anchors.left: hlpicn4.right
            anchors.right: parent.right
            anchors.leftMargin: units.gu(2)
            anchors.rightMargin: units.gu(2)
            anchors.topMargin: units.gu(24)
            horizontalAlignment: Text.AlignLeft
            lineHeight: 1.2
            wrapMode: Text.WordWrap
//            maximumLineCount: 10
            maximumLineCount: 8
        }

        Row {
            id: row2
            spacing: units.gu(0.4)
            anchors.horizontalCenter: parent.horizontalCenter
//            bottomPadding: units.gu(2)
//            bottomPadding: units.gu(22)
//            anchors.bottom: txt3.top
//            anchors.bottom: parent.bottom
            anchors.top: lstitm1.bottom
            anchors.topMargin: units.gu(46)

            Text {
                id: txt7
                text: i18n.tr("Made with")
                color: drkMd ? "#808080" : "black"
                lineHeight: 1.2
                font.bold: false
            }

            Image {
                id: img1
                source: "../../assets/heart.png"
                sourceSize.width: 47
                sourceSize.height: 47
                width: units.gu(2.3)
                height: units.gu(2.3)
            }

            Text {
                id: txt12
                text: i18n.tr("by bbisw")
                color: drkMd ? "#808080" : "black"
                lineHeight: 1.2
                font.bold: false
            }

        }

        Text {
            id: txt3
            text: i18n.tr("The caps plugin for the equalizer was published under the GNU Public License (version 3) by Tim Goetze. More information at <a href=\"http://quitte.de/dsp/caps.html\">quitte.de</a>.")
            color: drkMd ? "#808080" : "black"
            wrapMode: Text.WordWrap
            width: flick1.width
            lineHeight: 1.2
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            onLinkActivated: Qt.openUrlExternally(link)
//            anchors.bottom: txt8.top
//            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: units.gu(2)
            anchors.rightMargin: units.gu(2)
//            bottomPadding: units.gu(2)
//            bottomPadding: units.gu(14)
            maximumLineCount: 4
            anchors.top: lstitm1.bottom
            anchors.topMargin: units.gu(51)
            linkColor: "red"
        }

        Text {
            id: txt8
            text: i18n.tr("The pulse-vumeter binary was compiled from the source code found at <a href=\"https://github.com/Luciousdev/pulse-vumeter\">github.com</a>.")
            color: drkMd ? "#808080" : "black"
            wrapMode: Text.WordWrap
            width: flick1.width
            lineHeight: 1.2
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            onLinkActivated: Qt.openUrlExternally(link)
//            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.leftMargin: units.gu(2)
            anchors.rightMargin: units.gu(2)
//            bottomPadding: units.gu(2)
//            bottomPadding: units.gu(6)
            maximumLineCount: 3
            anchors.top: lstitm1.bottom
            anchors.topMargin: units.gu(63)
        }
    }
}
