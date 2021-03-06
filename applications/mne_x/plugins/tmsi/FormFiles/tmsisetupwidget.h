//=============================================================================================================
/**
* @file     tmsisetupwidget.h
* @author   Lorenz Esch <lorenz.esch@tu-ilmenau.de>;
*           Christoph Dinh <chdinh@nmr.mgh.harvard.edu>;
*           Matti Hamalainen <msh@nmr.mgh.harvard.edu>;
* @version  1.0
* @date     September, 2013
*
* @section  LICENSE
*
* Copyright (C) 2013, Lorenz Esch, Christoph Dinh and Matti Hamalainen. All rights reserved.
*
* Redistribution and use in source and binary forms, with or without modification, are permitted provided that
* the following conditions are met:
*     * Redistributions of source code must retain the above copyright notice, this list of conditions and the
*       following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and
*       the following disclaimer in the documentation and/or other materials provided with the distribution.
*     * Neither the name of MNE-CPP authors nor the names of its contributors may be used
*       to endorse or promote products derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED
* WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
* PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
* INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
* PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
* HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
* NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
* POSSIBILITY OF SUCH DAMAGE.
*
*
* @brief    Contains the declaration of the TMSISetupWidget class.
*
*/

#ifndef TMSISETUPWIDGET_H
#define TMSISETUPWIDGET_H


//*************************************************************************************************************
//=============================================================================================================
// INCLUDES
//=============================================================================================================


//*************************************************************************************************************
//=============================================================================================================
// QT INCLUDES
//=============================================================================================================

#include <QtWidgets>
#include "../ui_tmsisetup.h"
#include "tmsiimpedanceview.h"


//*************************************************************************************************************
//=============================================================================================================
// DEFINE NAMESPACE TMSIPlugin
//=============================================================================================================

namespace TMSIPlugin
{


//*************************************************************************************************************
//=============================================================================================================
// FORWARD DECLARATIONS
//=============================================================================================================

class TMSI;


//=============================================================================================================
/**
* DECLARE CLASS TMSISetupWidget
*
* @brief The TMSISetupWidget class provides the TMSI configuration window.
*/
class TMSISetupWidget : public QWidget
{
    Q_OBJECT
public:

    //=========================================================================================================
    /**
    * Constructs a TMSISetupWidget which is a child of parent.
    *
    * @param [in] parent pointer to parent widget; If parent is 0, the new TMSISetupWidget becomes a window. If parent is another widget, TMSISetupWidget becomes a child window inside parent. TMSISetupWidget is deleted when its parent is deleted.
    * @param [in] pTMSI a pointer to the corresponding ECGSimulator.
    */
    TMSISetupWidget(TMSI* pTMSI, QWidget *parent = 0);

    //=========================================================================================================
    /**
    * Destroys the TMSISetupWidget.
    * All TMSISetupWidget's children are deleted first. The application exits if TMSISetupWidget is the main widget.
    */
    ~TMSISetupWidget();

    //=========================================================================================================
    /**
    * Initializes the Connector's GUI properties.
    *
    */
    void initGui();

private:

    //=========================================================================================================
    /**
    * Sets the device sampling properties.
    *
    */
    void setDeviceSamplingProperties();

    //=========================================================================================================
    /**
    * Sets the preprocessing properties.
    *
    */
    void setPreprocessing();

    //=========================================================================================================
    /**
    * Sets the postprocessing properties.
    *
    */
    void setPostprocessing();

    //=========================================================================================================
    /**
    * Sets flag for writing to a file.
    *
    */
    void setWriteToFile();

    //=========================================================================================================
    /**
    * Sets the triggering properties
    *
    */
    void setTriggerProperties();

    //=========================================================================================================
    /**
    * Sets whether the file is to be splitted or not
    *
    */
    void setSplitFile(bool state);

    //=========================================================================================================
    /**
    * Sets size for the splitted files
    *
    */
    void setSplitFileSize(qint32 value);

    //=========================================================================================================
    /**
    * Shows the About Dialog
    *
    */
    void showAboutDialog();

    TMSI*               m_pTMSI;                 /**< a pointer to corresponding TMSI.*/

    Ui::TMSISetupClass  ui;                      /**< the user interface for the TMSISetupWidget.*/
};

} // NAMESPACE

#endif // TMSISETUPWIDGET_H
