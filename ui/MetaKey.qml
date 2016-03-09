/*****************************************************************************
 *   Copyright (C) 2016 by Hikmet Bas                                        *
 *   <hikmet.bas@pardus.org.tr>                                              *
 *                                                                           *
 *   This program is free software; you can redistribute it and/or modify    *
 *   it under the terms of the GNU General Public License as published by    *
 *   the Free Software Foundation; either version 2 of the License, or       *
 *   (at your option) any later version.                                     *
 *                                                                           *
 *   This program is distributed in the hope that it will be useful,         *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of          *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           *
 *   GNU General Public License for more details.                            *
 *                                                                           *
 *   You should have received a copy of the GNU General Public License       *
 *   along with this program; if not, write to the                           *
 *   Free Software Foundation, Inc.,                                         *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .          *
 *****************************************************************************/
import QtQuick 2.3

// MetaKey

Key {
    id: key

    function stickyPressed() {
        key.lock = true
        btnPressed()
        main.stickyKeyPressed(key.keyCode)

    }

    function stickyReleased(){
        key.lock = false
        btnHovered()
        main.stickyKeyReleased(key.keyCode)
    }

    Image {
        id: img
        width: parent.width * 2 / 3
        height: img.width
        source: "Images/pardus.svg"
        anchors.centerIn: parent
    }

    MouseArea {
        id: ma
        anchors.fill: parent

        onPressed: {
            if (!key.lock)
                stickyPressed()
            else stickyReleased()
        }

        onPressAndHold: {
            btnHold()
        }

        onReleased: {
            key.hold = false
        }

        onClicked: {
            btnClicked()
        }
    }
}
