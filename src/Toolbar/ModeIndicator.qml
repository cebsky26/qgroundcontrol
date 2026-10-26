import QtQuick
import QtQuick.Controls

import QGroundControl
import QGroundControl.Controls

//-------------------------------------------------------------------------
//-- Mode Indicator
QGCComboBox {
    anchors.verticalCenter: parent.verticalCenter
    alternateText:          _activeVehicle ? _activeVehicle.flightModeDisplayName(_activeVehicle.flightMode) : ""
    model:                  _activeVehicle ? _flightModes.map(mode => _activeVehicle.flightModeDisplayName(mode)) : []   // display names; onActivated uses the untranslated list
    font.pointSize:         ScreenTools.mediumFontPointSize
    currentIndex:           -1
    sizeToContents:         true

    property bool showIndicator: true

    property var _activeVehicle:    QGroundControl.multiVehicleManager.activeVehicle
    property var _flightModes:      _activeVehicle ? _activeVehicle.flightModes : [ ]

    onActivated: (index) => {
        _activeVehicle.flightMode = _flightModes[index]
        currentIndex = -1
    }
}
