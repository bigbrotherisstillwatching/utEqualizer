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
//import Process2 1.0

import "../colors"

Rectangle {
    id: mainPage
    anchors.fill: parent

    color: Colors.backgroundColor

    property var padding: units.gu(1)
    property alias eqsts: settings.equalizerStatus
    property alias drkMd: settings.darkMode
//    property string command: "/home/phablet/Downloads/vumeter/pulse-vumeter-main/pulse-vumeter-main/pulse-vumeter"

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

        onStarted: print("Started")
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
            console.log("Goodbye!");
            process8.terminate()
        }
    }

    Component.onCompleted: {
        process6.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.2/scripts/equalizer_stop.sh"])
        eqswitch.checked = false
        eqsts = false
        process8.start("/bin/bash",["-c", "/home/phablet/Downloads/vumeter/pulse-vumeter-main/pulse-vumeter-main/pulse-vumeter"])
    }

    Component {
        id: dialog

        Dialog {
            id: dialog2
            title: i18n.tr("<font color=\"white\">Quit</font>")
            text: i18n.tr("<font color=\"white\">Are you sure that you want to close the app?</font>")
            style: ActionBarStyle {
                backgroundColor: Colors.surfaceColor2
            }
            Button {
                id: bttn1
                text: i18n.tr("Cancel")
                onClicked: PopupUtils.close(dialog2)
                StyleHints {
                    defaultColor: bttn1.pressed ? Colors.surfaceColor : "red"
                }
            }
            Button {
                id: bttn2
                text: i18n.tr("Turn off equalizer")
                onClicked: {
                    process4.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.2/scripts/equalizer_stop.sh"])
                    bttn3.enabled = true
                    process5.start("/bin/bash",["-c", "sed -i '13s/true/false/' /home/phablet/.config/utequalizer.bigbrotherisstillwatching/utequalizer.bigbrotherisstillwatching.conf"])
                    bttn1.enabled = false
                }
                StyleHints {
                    defaultColor: bttn2.pressed ? Colors.surfaceColor : "yellow"
                }
            }
            Button {
                id: bttn3
                enabled: false
                text: i18n.tr("Ok")
                onClicked: {
                    Qt.quit()
                }
                StyleHints {
                    defaultColor: bttn3.pressed ? Colors.surfaceColor : "green"
                }
            }
        }
    }

    PageHeader {
        id: header
        title: "utEqualizer"
        z: 1
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

    Flickable {
        id: flick1
        anchors.top: header.bottom
        contentHeight: clmn1.height + txtfld1.height + txtfld2.height + txtfld3.height + txtfld4.height + txtfld5.height + txt3.height + units.gu(70)
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

        Column {
            id: clmn1
            topPadding: units.gu(3)
            spacing: units.gu(3)
            width: flick1.width

            Row {
                id: row1
                spacing: 1
                anchors.horizontalCenter: clmn1.horizontalCenter
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

            ProgressBar {
                id: prgrssbr
                maximumValue: 1.00
                minimumValue: 0.00
                anchors.top: clmn1.bottom
//                anchors.horizontalCenter: clmn1.horizontalCenter
            }

            Row {
                id: row2
                anchors.horizontalCenter: clmn1.horizontalCenter
                spacing: units.gu(5)
                Button {
                    id: chngbttn
                    height: units.gu(4)
                    width: units.gu(4)
                    iconSource: "../../assets/change.svg"
                    StyleHints {
                        defaultColor: chngbttn.pressed ? "32517F" : Colors.surfaceColor
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
                        process3.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.2/scripts/equalizer_change.sh"])
                    }
                }
                Qqc.Switch {
                    id: eqswitch
                    y: 5
                    onClicked: {
                        if (settings.equalizerStatus === true) {
                            process2.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.2/scripts/equalizer_stop.sh"])
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
                            process.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.2/scripts/equalizer_start.sh"])
                            eqsts = checked
                            txt2.text = i18n.tr("Please turn the equalizer off and on again after changing audio output.")
                        }
                    }
                }
                Button {
                    id: rstbttn
                    height: units.gu(4)
                    width: units.gu(4)
                    iconSource: "../../assets/resetzero.svg"
                    StyleHints {
                        defaultColor: rstbttn.pressed ? "#32517F" : Colors.surfaceColor
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
/*            Row {
                id: row3
                anchors.horizontalCenter: clmn1.horizontalCenter
                spacing: units.gu(25)
                Text {
                    id: txt1
                    text: i18n.tr("Dark mode")
                    color: Colors.mainText
                }
                Qqc.Switch {
                    id: drkmdswitch
                    y: -15
                    checked: settings.darkMode

                    onClicked: {
                        drkMd = checked
                        txt2.text = i18n.tr("Please restart the app for the dark mode to take effect.")
                    }
                }
            }*/
            Text {
                 id: txt2
                 text: ""
                 color: "red"
                 anchors.horizontalCenter: clmn1.horizontalCenter
                 wrapMode: Text.WordWrap
                 width: clmn1.width
                 lineHeight: 1.2
                 horizontalAlignment: Text.AlignHCenter
                 leftPadding: units.gu(3)
                 rightPadding: units.gu(3)
            }
            Rectangle {
                 id: plchldrrec
                 color: "transparent"
                 anchors.horizontalCenter: clmn1.horizontalCenter
                 width: clmn1.width
                 height: units.gu(5) - txt2.height
            }
        }

/*        ProgressBar {
            id: prgrssbr
            maximumValue: 1.00
            minimumValue: 0.00
            anchors.top: clmn1.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }*/

        Text {
            id: txt1
            text: i18n.tr("Dark mode")
            color: Colors.mainText
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
                txt2.text = i18n.tr("Please restart the app for the dark mode option change to take effect.")
            }
        }

        TextField {
            id: txtfld1
            color: Colors.mainText
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
            iconSource: "../../assets/load.svg"
            StyleHints {
                defaultColor: bttn5.pressed ? "#32517F" : Colors.surfaceColor
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
            iconName: "save"
            StyleHints {
                defaultColor: bttn4.pressed ? "#32517F" : Colors.surfaceColor
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
            color: Colors.mainText
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
            iconSource: "../../assets/load.svg"
            StyleHints {
                defaultColor: bttn7.pressed ? "#32517F" : Colors.surfaceColor
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
            iconName: "save"
            StyleHints {
                defaultColor: bttn6.pressed ? "#32517F" : Colors.surfaceColor
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
            color: Colors.mainText
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
            iconSource: "../../assets/load.svg"
            StyleHints {
                defaultColor: bttn9.pressed ? "#32517F" : Colors.surfaceColor
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
            iconName: "save"
            StyleHints {
                defaultColor: bttn8.pressed ? "#32517F" : Colors.surfaceColor
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
            color: Colors.mainText
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
            iconSource: "../../assets/load.svg"
            StyleHints {
                defaultColor: bttn11.pressed ? "#32517F" : Colors.surfaceColor
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
            iconName: "save"
            StyleHints {
                defaultColor: bttn10.pressed ? "#32517F" : Colors.surfaceColor
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
            color: Colors.mainText
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
            iconSource: "../../assets/load.svg"
            StyleHints {
                defaultColor: bttn13.pressed ? "#32517F" : Colors.surfaceColor
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
            iconName: "save"
            StyleHints {
                defaultColor: bttn12.pressed ? "#32517F" : Colors.surfaceColor
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
            color: Colors.backgroundColor
            divider.colorFrom: Colors.mainText
            divider.colorTo: Colors.mainText
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
                    color: Colors.mainText
                    font.pointSize: 40
                }
            }
        }

        Icon {
            id: hlpicn1
            source: "../../assets/change.svg"
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
            color: Colors.mainText
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
            source: "../../assets/resetzero.svg"
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
            color: Colors.mainText
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
            name: "save"
            width: units.gu(4)
            height: units.gu(4)
            anchors.top: lstitm1.bottom
            anchors.left: parent.left
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(23)
        }

        Icon {
            id: hlpicn4
            source: "../../assets/load.svg"
            width: units.gu(4)
            height: units.gu(4)
            anchors.top: lstitm1.bottom
            anchors.left: hlpicn3.right
            anchors.leftMargin: units.gu(2)
            anchors.topMargin: units.gu(23)
        }

        Text {
            id: txt6
            text: i18n.tr("Save and load a preset. You can also give them a name. Apply the settings by clicking the change button or by activating the equalizer.")
            color: Colors.mainText
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
            color: Colors.mainText
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
            color: Colors.mainText
            wrapMode: Text.WordWrap
            width: flick1.width
            lineHeight: 1.2
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            onLinkActivated: Qt.openUrlExternally(link)
            anchors.bottom: parent.bottom
            bottomPadding: units.gu(2)
        }
    }
}
