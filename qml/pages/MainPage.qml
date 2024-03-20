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
//import QtMultimedia 5.12
import Qt.labs.settings 1.0
import QtQuick.Controls 2.7 as Qqc
import Process 1.0

//import "../net"
//import "../util"
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
        property string equalizerStatus: ""
    }

    PageHeader {
        id: header
        title: "Equalizer"
//        title.color: Colors.mainText
//        title.font.bold: true
        StyleHints {
            foregroundColor: Colors.mainText
            backgroundColor: Colors.backgroundColor
//            backgroundColor: Colors.surfaceColor
            dividerColor: Colors.borderColor
        }
        contents: Rectangle {
            id: hdrrec
            anchors.fill: parent
            color: Colors.backgroundColor
            Text {
                id: hdrtxt
//                anchors.centerIn: parent
                anchors.left: hdrrec.left
//                anchors.bottom: hdrrec.bottom
                anchors.verticalCenter: hdrrec.verticalCenter
                text: header.title
                color: Colors.mainText
                font.pointSize: 40
//                font.bold: true
            }
        }
        trailingActionBar {
            actions: [
                Action {
                    iconName: "close"
                    text: "Close"
                }
            ]
        }
    }

/*
    Flickable {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        contentWidth: parent.width
        contentHeight: childrenRect.height

        clip: true
*/
    Column {
        id: clmn1
//        anchors.left: parent.left
//        anchors.right: parent.right
        anchors.top: header.bottom
        anchors.horizontalCenter: mainPage.horizontalCenter
//        anchors.centerIn: parent
        topPadding: units.gu(3)
        spacing: units.gu(3)
/*
            ListItem {
                height: l1.height + (divider.visible ? divider.height : 0)
                color: Colors.surfaceColor
                divider.colorFrom: Colors.borderColor
                divider.colorTo: Colors.borderColor
                highlightColor: Colors.highlightColor

                ListItemLayout {
                    id: l1
                    title.text: i18n.tr("Appearance")
                    title.font.bold: true
                    title.color: Colors.mainText
                    summary.text: i18n.tr("Restart the app after changing dark mode option")
                    summary.color: "red"
                    summary.visible: false
                    summary.wrapMode: Text.WordWrap
                }
            }
*/
/*
            ListItem {
//                anchors.left: parent.left
//                anchors.right: parent.right
//                anchors.top: text1.bottom
                color: Colors.surfaceColor
                divider.colorFrom: Colors.borderColor
                divider.colorTo: Colors.borderColor
                highlightColor: Colors.highlightColor

                height: l2.height + (divider.visible ? divider.height : 0)

                ListItemLayout {
                    id: l2
                    title.text: i18n.tr("Dark Mode")
                    title.font.bold: true
                    title.color: Colors.mainText
                    summary.text: i18n.tr("Restart the app after changing dark mode option")
                    summary.color: "red"
                    summary.visible: false
                    summary.wrapMode: Text.WordWrap
//                    mainSlot: Text {
//                        anchors.verticalCenter: parent.verticalCenter
//                        text: i18n.tr("Dark mode")
//                        color: Colors.mainText
//                    }
                    Switch {
                        checked: settings.darkMode
                        SlotsLayout.position: SlotsLayout.Trailing

                        onClicked: {
                            settings.darkMode = checked
                            l2.summary.visible = true
                        }
                    }
                }
            }

            ListItem {
                height: l3.height + (divider.visible ? divider.height : 0)
                color: Colors.surfaceColor
                divider.colorFrom: Colors.borderColor
                divider.colorTo: Colors.borderColor
                highlightColor: Colors.highlightColor

                ListItemLayout {
                    id: l3
                    title.text: i18n.tr("Equalizer")
                    title.font.bold: true
                    title.color: Colors.mainText

                    Rectangle {
                        id: statusrec1
                        SlotsLayout.position: SlotsLayout.Trailing;
                        width: units.gu(2)
                        height: units.gu(2)
                        color: settings.value("equalizerStatus")
                        visible: true
                        radius: units.gu(1)
                    }
                }
            }
*/
        Row {
            id: row1
//            anchors.horizontalCenter: parent.horizontalCenter
//            anchors.centerIn: parent
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
//            spacing: units.gu(5)
            Button {
                id: chngbttn
                height: units.gu(4)
                width: units.gu(4)
                iconName: "media-playlist-shuffle"
                color: Colors.surfaceColor
            }
            Qqc.Switch {
                id: eqswitch
                y: 10
            }
            Button {
                id: rstbttn
                height: units.gu(4)
                width: units.gu(4)
                iconName: "reset"
                color: Colors.surfaceColor
            }
        }
    }
}
/*
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: mainPage.padding
                Button {
                    id: eqaButton
                    text: i18n.tr("On")
                    color: Colors.surfaceColor
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
                        process.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.0/scripts/equalizer_start.sh"])
                        text1.visible = true
                        settings.equalizerStatus = "green"
                        statusrec1.color = "green"
                    }
                }
                Button {
                    id: eqdButton
                    text: i18n.tr("Off")
                    color: Colors.surfaceColor
                    onClicked: {
                        process2.start("/bin/bash",["-c", "/opt/click.ubuntu.com/utequalizer.bigbrotherisstillwatching/1.0.0/scripts/equalizer_stop.sh"])
                        text1.visible = false
                        settings.equalizerStatus = "red"
                        statusrec1.color = "red"
                    }
                }
                Button {
                    id: chaButton
                    text: i18n.tr("Change")
                    color: Colors.surfaceColor
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
                Button {
                    id: resButton
                    text: i18n.tr("Reset")
                    color: Colors.surfaceColor
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
            Text {
                id: text1
                text: i18n.tr("Please turn off equalizer <u>before</u> changing audio output, closing the app or rebooting the phone!")
                color: "red"
//                anchors.horizontalCenter: mainPage.horizontalCenter
                topPadding: units.gu(3)
                bottomPadding: units.gu(3)
                wrapMode: Text.WordWrap
                width: mainPage.width
                lineHeight: 1.2
                horizontalAlignment: Text.AlignHCenter
                visible: false
                leftPadding: units.gu(3)
                rightPadding: units.gu(3)
            }
*/
/*
        }
    }
}
*/
/*
            ListItem {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: text1.bottom
                color: Colors.surfaceColor
                divider.colorFrom: Colors.borderColor
                divider.colorTo: Colors.borderColor
                highlightColor: Colors.highlightColor

                height: l2.height + (divider.visible ? divider.height : 0)

                SlotsLayout {
                    id: l2
                    mainSlot: Text {
                        anchors.verticalCenter: parent.verticalCenter
                        text: i18n.tr("Dark mode")
                        color: Colors.mainText
                    }
                    Switch {
                        checked: settings.darkMode
                        SlotsLayout.position: SlotsLayout.Trailing

                        onClicked: {
                            settings.darkMode = checked
                            l2.summary.visible = true
                        }
                    }
                }
            }
*/
