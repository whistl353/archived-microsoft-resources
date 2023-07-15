//Copyright (c) Microsoft Corporation.  All rights reserved.
var g_bSurveyOn = false; // turn OFF the survey
var FILE_VERSION = '0.9.6';

String.prototype.trim = function()
{
    return this.replace
    (
        /(^\s*)|(\s*$)/g,
        ''
    );
}


var COOKIE_DOMAIN = null;
var DIALOG_URL = 'webiq.htm';
var COOKIE_ERROR_MODIFIER =                             0x1000;
var ERROR_BASE =                                        0x80040000;
var ERROR_CAME_FROM_GOOGLE_ADWORDS_LINK =               ERROR_BASE + 1;
var ERROR_CANNOT_CREATE_COOKIE =                        ERROR_BASE + 2;
var ERROR_COOKIE_COULD_NOT_WRITE_COOKIE =               ERROR_BASE + COOKIE_ERROR_MODIFIER + 1;
var ERROR_COOKIE_NO_COOKIE_PRESENT =                    ERROR_BASE + COOKIE_ERROR_MODIFIER + 3;
var ERROR_COOKIE_SPECIFIED_COOKIE_DOES_NOT_EXIST =      ERROR_BASE + COOKIE_ERROR_MODIFIER + 2;
var ERROR_INACTIVE_PROJECT =                            ERROR_BASE + 3;
var ERROR_INVALID_BROWSER =                             ERROR_BASE + 4;
var ERROR_INVALID_DIRECTORY =                           ERROR_BASE + 5;
var ERROR_INVALID_PARAMETER =                           ERROR_BASE + 6;
var ERROR_INVALID_USER_RESPONSE =                       ERROR_BASE + 7;
var ERROR_INVALID_WEBIQ_DIALOG =                        ERROR_BASE + 8;
var ERROR_OK =                                          0;
var ERROR_USER_HAS_ALREADY_BEEN_INVITED =               ERROR_BASE + 9;
var ERROR_USER_NOT_SELECTED =                           ERROR_BASE + 10;
var ERROR_WEBIQ_SERVER_IS_INACCESSIBLE =                ERROR_BASE + 11;
var ERROR_SURVEY_TURNED_OFF            =				ERROR_BASE + 12;
var GOOGLE_ADWORDS_SEARCH_EXPRESSION = 'referrer(%3D|\=)Google';
var INVITATION_DISPLAY_SESSION_COOKIE_NAME = 'InvitationDisplayed';
var INVITATION_DISPLAY_SESSION_COOKIE_VALUE = 'true';
var PROJECT_STATE = 'In Progress';
var SIZE_MODIFIER = 10;
var TEST_COOKIE_NAME = 'TestCookieName';
var TEST_COOKIE_VALUE = 'TestCookieValue';
var USER_RESPONSE_COOKIE_LIFESPAN = 90;
var USER_RESPONSE_COOKIE_NAME = 'UserResponse';
var WEBIQ_DIALOG_BORDER_STYLE = '0px solid black';
var WEBIQ_DIALOG_VERTICAL_OFFSET = 10;
var WEBIQ_IFRAME_SOURCE = '<iframe border=\"0\" frameBorder=\"0\" id=\"oWebIQInvitationDialog\" scrolling=\"no\" style=\"position:absolute; width:0; height:0; visibility:hidden; z-index:1000;\" src=\"\"></iframe>';
var WEBIQ_LAUNCH_URL = 'http:\/\/www.webiqonline.com/webiq/webiqlaunch.dll?MfcISAPICommand=ShowInvitation&LDI={0}&SV=1';


function UserSettings(oWindow)
{
    this.BrowserLanguage = '';
    this.InternetExplorerVersion = '';
    this.IsAOL = false;
    this.ScreenHeight = 0;
    this.ScreenWidth = 0;
    this.SystemLanguage = '';
    this.WindowsVersion = '';
    var sUserAgent = null;
    var sWindowsVersion = null;
    var vMatches = null;
    try
    {
        if (isValidObject(oWindow))
        {
            if (!isNaN(oWindow.screen.width))
            {
                this.ScreenWidth = oWindow.screen.width;
            }
            if (!isNaN(oWindow.screen.height))
            {
                this.ScreenHeight = oWindow.screen.height;
            }
            sUserAgent = oWindow.navigator.userAgent;
            if (isValidString(sUserAgent))
            {
                vMatches = sUserAgent.match(/MSIE ([\.\w]+);?/i);
                if
                (
                    (vMatches != null)
                    &&
                    (vMatches.length > 0)
                )
                {
                    this.InternetExplorerVersion = vMatches[1];
                }
                vMatches = sUserAgent.match(/AOL/i);
                if
                (
                    (vMatches != null)
                    &&
                    (vMatches.length > 0)
                )
                {
                    this.IsAOL = true;
                }
                vMatches = sUserAgent.match(/(Windows|Win) ?([\.\w ]+);?/i);
                if
                (
                    (vMatches != null)
                    &&
                    (vMatches.length > 0)
                )
                {
                    sWindowsVersion = vMatches[2];
                    sWindowsVersion = sWindowsVersion.replace
                    (
                        /NT 5.0/i,
                        '2000'
                    );
                    sWindowsVersion = sWindowsVersion.replace
                    (
                        /NT 5.1/i,
                        'XP'
                    );
                    sWindowsVersion = sWindowsVersion.replace
                    (
                        /NT 5.2/i,
                        'Server 2003'
                    );
                    sWindowsVersion = sWindowsVersion.replace
                    (
                        /NT 6.0/i,
                        'Longhorn'
                    );
                    sWindowsVersion = sWindowsVersion.replace
                    (
                        /32/i,
                        '95'
                    );
                    if
                    (
                        (sWindowsVersion == 'XP')
                        &&
                        (sUserAgent.indexOf('SV1') > -1)
                    )
                    {
                        sWindowsVersion += 'SP2';
                    }
                    this.WindowsVersion = sWindowsVersion;
                }
            }
            if (isValidString(oWindow.navigator.browserLanguage))
            {
                this.BrowserLanguage = oWindow.navigator.browserLanguage;
            }
            if (isValidString(oWindow.navigator.systemLanguage))
            {
                this.SystemLanguage = oWindow.navigator.systemLanguage;
            }
        }
    }
    catch (oException)
    {
        alert(oException.message);
    }
    return;
}


function isValidObject(oVariable)
{
    var bIsValidObject = false;
    try
    {
        if
        (
            (oVariable != null)
            &&
            (typeof(oVariable) == 'object')
        )
        {
            bIsValidObject = true;
        }
    }
    catch (oException)
    {
    }
    return bIsValidObject;
}
function isValidString(sVariable)
{
    var bIsValidString = false;
    try
    {
        if
        (
            (sVariable != null)
            &&
            (typeof(sVariable) == 'string')
            &&
            (sVariable.trim().length > 0)
        )
        {
            bIsValidString = true;
        }
    }
    catch (oException)
    {
    }
    return bIsValidString;
}

var STORE_NAME = 'oXMLBranchWebHQ4v1';
var USER_DATA_ELEMENT_NAME = 'divWebIQUserData';

function userDataExists(sName)
{
    var bUserDataExists = false;
    try
    {
        if (!isValidString(sName))
        {
            throw new Error
            (
                ERROR_INVALID_PARAMETER,
                'The name input parameter is invalid.'
            );
        }
        if (getUserDataValue(sName) != null)
        {
            bUserDataExists = true;
        }
    }
    catch (oException)
    {
        bUserDataExists = false;
    }
    return bUserDataExists;
}
function canCreateAndAccessUserData()
{
    var bCanCreateAndAccessUserData = false;
    var bResult = false;
    try
    {
        bResult = writeUserData
        (
            TEST_COOKIE_NAME,
            TEST_COOKIE_VALUE,
            1
        );
        if (bResult)
        {
            if (getUserDataValue(TEST_COOKIE_NAME) == TEST_COOKIE_VALUE)
            {
                bCanCreateAndAccessUserData = true;
            }
        }
    }
    catch (oException)
    {
        bCanCreateAndAccessUserData = false;
    }
    return bCanCreateAndAccessUserData;
}
function deleteUserData(sName)
{
    var bSuccessful = false;
    var dExpirationDate = new Date();
    var oUserDataField = null;
    try
    {
        if (!isValidString(sName))
        {
            throw new Error
            (
                ERROR_INVALID_PARAMETER,
                'The name input parameter is invalid.'
            );
        }
        if (!userDataExists(sName))
        {
            throw new Error
            (
                ERROR_COOKIE_SPECIFIED_COOKIE_DOES_NOT_EXIST,
                'A userData with the given name could not be found.'
            );
        }
        oUserDataField = document.getElementById(USER_DATA_ELEMENT_NAME);
        if (!isValidObject(oUserDataField))
        {
            throw new Error
            (
                ERROR_INVALID_REFERENCE,
                'The oUserDataField object is invalid.'
            );
        }
        oUserDataField.load(STORE_NAME);
        oUserDataField.removeAttribute(sName);
        oUserDataField.save(STORE_NAME);
        bSuccessful = true;
    }
    catch (oException)
    {
        bSuccessful = false;
    }
    return bSuccessful;
}
function getUserDataValue(sName)
{
    var sUserDataValue = null;
    var oRegularExpression = null;
    var sPattern = '';
    var vMatches = null;
    try
    {
        if (!isValidString(sName))
        {
            throw new Error
            (
                ERROR_INVALID_PARAMETER,
                'The name input parameter is invalid.'
            );
        }
        oUserDataField = document.getElementById(USER_DATA_ELEMENT_NAME);
        if (!isValidObject(oUserDataField))
        {
            throw new Error
            (
                ERROR_INVALID_REFERENCE,
                'The oUserDataField object is invalid.'
            );
        }
        oUserDataField.load(STORE_NAME);
        sUserDataValue = oUserDataField.getAttribute(sName);
        if (!isValidString(sUserDataValue))
        {
            throw new Error
            (
                ERROR_BASE,
                'Error'
            );
        }
    }
    catch (oException)
    {
        sUserDataValue = null;
    }
    return sUserDataValue;
}
function writeUserData
(
    sName,
    sValue,
    nLifeSpan
)
{
    var bSuccessful = false;
    var dExpirationDate = new Date();
    try
    {
        if (!isValidString(sName))
        {
            throw new Error
            (
                ERROR_INVALID_PARAMETER,
                'The name input parameter is invalid.'
            );
        }
        oUserDataField = document.getElementById(USER_DATA_ELEMENT_NAME);
        if (!isValidObject(oUserDataField))
        {
            throw new Error
            (
                ERROR_INVALID_REFERENCE,
                'The oUserDataField object is invalid.'
            );
        }
        oUserDataField.load(STORE_NAME);
        oUserDataField.setAttribute(sName, sValue);
        if (nLifeSpan > 0)
        {
            dExpirationDate.setHours(dExpirationDate.getHours() + nLifeSpan);
            oUserDataField.expires = dExpirationDate.toGMTString();
        }
        oUserDataField.save(STORE_NAME);

        if (getUserDataValue(sName) != sValue)
        {
            throw new Error
            (
                ERROR_BASE,
                'Error'
            );
        }
        bSuccessful = true;
    }
    catch (oException)
    {
        bSuccessful = false;
    }
    return bSuccessful;
}


function cookieExists(sName)
{
    var bCookieExists = false;
    try
    {
        if (!isValidString(sName))
        {
            throw new Error
            (
                ERROR_INVALID_PARAMETER,
                'The name input parameter is invalid.'
            );
        }
        if (getCookieValue(sName) != null)
        {
            bCookieExists = true;
        }
    }
    catch (oException)
    {
        bCookieExists = false;
    }
    return bCookieExists;
}
function deleteCookie(sName)
{
    var bSuccessful = false;
    var dExpirationDate = new Date();
    try
    {
        if (!isValidString(sName))
        {
            throw new Error
            (
                ERROR_INVALID_PARAMETER,
                'The name input parameter is invalid.'
            );
        }
        if (!cookieExists(sName))
        {
            throw new Error
            (
                ERROR_COOKIE_SPECIFIED_COOKIE_DOES_NOT_EXIST,
                'A cookie with the given name could not be found.'
            );
        }
        dExpirationDate.setTime(dExpirationDate.getTime() - 1);
        document.cookie = sName +
            '=; expires=' +
            dExpirationDate.toGMTString();
        bSuccessful = true;
    }
    catch (oException)
    {
        bSuccessful = false;
    }
    return bSuccessful;
}
function getCookieValue(sName)
{
    var sCookie = '';
    var sCookieValue = null;
    var oRegularExpression = null;
    var sPattern = '';
    var vMatches = null;
    try
    {
        if (!isValidString(sName))
        {
            throw new Error
            (
                ERROR_INVALID_PARAMETER,
                'The name input parameter is invalid.'
            );
        }
        sPattern = '(' +
            sName.trim() +
            '=)([^;]*);?';
        oRegularExpression = new RegExp
        (
            sPattern,
            'ig'
        );
        sCookie = document.cookie;
        if (!isValidString(sCookie))
        {
            throw new Error
            (
                ERROR_COOKIE_NO_COOKIE_PRESENT,
                'The document.cookie property does not contain any data.'
            );
        }
        vMatches = sCookie.match(oRegularExpression);
        if (vMatches != null)
        {
            sCookieValue = unescape(RegExp.$2);
        }
        else
        {
            throw new Error
            (
                ERROR_COOKIE_SPECIFIED_COOKIE_DOES_NOT_EXIST,
                'A cookie with the given name could not be found.'
            );
        }
    }
    catch (oException)
    {
        sCookieValue = null;
    }
    return sCookieValue;
}
function writeCookie
(
    sName,
    sValue,
    nLifeSpan,
    sPath,
    sDomain,
    bSecure
)
{
    var bSuccessful = false;
    var dExpirationDate = new Date();
    var sCookieData = '';
    var sDomainSection = '';
    var sExpirationSection = '';
    var sPathSection = '';
    var sSecureSection = '';
    try
    {
        if (!isValidString(sName))
        {
            throw new Error
            (
                ERROR_INVALID_PARAMETER,
                'The name input parameter is invalid.'
            );
        }
        if (nLifeSpan > 0)
        {
            dExpirationDate.setHours(dExpirationDate.getHours() + nLifeSpan);
            sExpirationSection = '; expires=' + dExpirationDate.toGMTString();
        }
        if (isValidString(sDomain))
        {
            sDomainSection = '; domain=' + sDomain.trim();
        }
        if (isValidString(sPath))
        {
            sPathSection = '; path=' + sPath.trim();
        }
        if (bSecure)
        {
            sSecureSection = '; secure';
        }
        sCookieData += sName.trim() +
            '=' +
            escape(sValue.trim()) +
            sExpirationSection +
            sPathSection +
            sDomainSection +
            sSecureSection;
        document.cookie = sCookieData;
        if (getCookieValue(sName) != sValue)
        {
            throw new Error
            (
                ERROR_COOKIE_COULD_NOT_WRITE_COOKIE,
                'An error occurred while trying to write the given cookie.'
            );
        }
        bSuccessful = true;
    }
    catch (oException)
    {
        bSuccessful = false;
    }
    return bSuccessful;
}


var g_bIsWebIQServerAvailable = true;


function cameFromGoogleAdWords(sSearchExpression)
{
    var bCameFromGoogleAdWord = false;
    var oRegularExpression = null;
    var sQueryString = '';
    try
    {
        if (!isValidString(sSearchExpression))
        {
            throw new Error
            (
                ERROR_INVALID_PARAMETER,
                'The search expression input parameter is invalid.'
            );
        }
        sQueryString = window.document.location.search;
        if (isValidString(sQueryString))
        {
            oRegularExpression = new RegExp
            (
                sSearchExpression,
                'i'
            );
            if (sQueryString.match(oRegularExpression) != null)
            {
                bCameFromGoogleAdWord = true;
            }
        }
    }
    catch (oException)
    {
        bCameFromGoogleAdWord = false;
    }
    return bCameFromGoogleAdWord;
}
function canCreateAndAccessCookies()
{
    var bCanCreateAndAccessCookies = false;
    var bResult = false;
    try
    {
        bResult = writeCookie
        (
            TEST_COOKIE_NAME,
            TEST_COOKIE_VALUE,
            0,
            '/',
            COOKIE_DOMAIN
        );
        if (bResult)
        {
            if (getCookieValue(TEST_COOKIE_NAME) == TEST_COOKIE_VALUE)
            {
                bCanCreateAndAccessCookies = true;
            }
        }
    }
    catch (oException)
    {
        bCanCreateAndAccessCookies = false;
    }
    return bCanCreateAndAccessCookies;
}
function closeWebIQInvitationDialog()
{
    //var oWebIQInvitationDialog = getWebIQInvitationDialog();
    var oWebIQInvitationDialog = window.parent.document.getElementById('oWebIQInvitationDialog');
    if (isValidObject(oWebIQInvitationDialog))
    {
        oWebIQInvitationDialog.style.display = 'none';
    }
    return;
}
function createWebIQInvitationDialog
(
    nLaunchDefinitionIndex,
    nWidth,
    nHeight
)
{
    var bUseIFrame = false;
    var oDynamicContentDiv = null;
    var oWebIQInvitationDialog = null;
    try
    {
        if
        (
            (getWebIQInvitationDialog() == null)
            ||
            (getWebIQInvitationDialog().tagName.toLowerCase() != 'div')
        )
        {
            oDynamicContentDiv = document.getElementById('WebIQDynamicContent');
            if (!isValidObject(oDynamicContentDiv))
            {
                throw new Error
                (
                    ERROR_INVALID_REFERENCE,
                    'The reference to the WebIQ dynamic content div element is invalid.'
                );
            }
            oDynamicContentDiv.innerHTML = WEBIQ_IFRAME_SOURCE;
            bUseIFrame = true;
        }
        oWebIQInvitationDialog = getWebIQInvitationDialog();
        if (!isValidObject(oWebIQInvitationDialog))
        {
            throw new Error
            (
                ERROR_INVALID_WEBIQ_DIALOG,
                'The reference to the WebIQ Invitation Dialog is invalid.'
            );
        }
        nHeight += SIZE_MODIFIER;
        oWebIQInvitationDialog.style.border = WEBIQ_DIALOG_BORDER_STYLE;
        oWebIQInvitationDialog.style.width = window.document.body.clientWidth;
        oWebIQInvitationDialog.style.height = window.document.body.clientHeight;
        oWebIQInvitationDialog.style.left = 0;
        oWebIQInvitationDialog.style.top = 0;
        oWebIQInvitationDialog.style.margin = '0px';
        oWebIQInvitationDialog.style.padding = '0px';
        oWebIQInvitationDialog.style.overflow = 'hidden';
        oWebIQInvitationDialog.style.overflowX = 'hidden';
        oWebIQInvitationDialog.style.overflowY = 'hidden';
        if (bUseIFrame)
        {
            oWebIQInvitationDialog.src = DIALOG_URL + '?ldi=' + nLaunchDefinitionIndex.toString();
        }
        else
        {
            populateWebIQInvitationDialogContents
            (
                oWebIQInvitationDialog,
                nLaunchDefinitionIndex
            );
        }
        oWebIQInvitationDialog.style.visibility = 'visible';
    }
    catch (oException)
    {
        oWebIQInvitationDialog = null;
    }
    return oWebIQInvitationDialog;
}
function findElement(sElementID)
{
    var oElement = null;
    try
    {
        if (!isValidString(sElementID))
        {
            throw new Error
            (
                ERROR_INVALID_PARAMETER,
                'The element ID input parameter is invalid.'
            );
        }
        oElement = document.getElementById(sElementID);
        if (!isValidObject(oElement))
        {
            for (var nFrameCounter = 0; nFrameCounter < window.frames.length; nFrameCounter++)
            {
                oElement = window.frames[nFrameCounter].document.getElementById(sElementID);
                if (isValidObject(oElement))
                {
                    break;
                }
            }
        }
    }
    catch (oException)
    {
        oElement = null;
    }
    return oElement;
}

function getWebIQInvitationDialog()
{
    var oWebIQInvitationDialog = null;
    try
    {
        oWebIQInvitationDialog = findElement('oWebIQInvitationDialog');
        if
        (
            (oWebIQInvitationDialog.tagName.toLowerCase() != 'iframe')
            &&
            (oWebIQInvitationDialog.tagName.toLowerCase() != 'div')
        )
        {
            throw new Error
            (
                ERROR_INVALID_WEBIQ_DIALOG,
                'The reference to the WebIQ Invitation Dialog is invalid.'
            );
        }
    }
    catch (oException)
    {
        oWebIQInvitationDialog = null;
    }
    return oWebIQInvitationDialog;
}
function inviteUserToBeginWebIQ
(
    nSelectionProbability,
    nLaunchDefinitionIndex,
    nDialogWidth,
    nDialogHeight
)
{

    var bSuccess = false;
    try
    {
		if (!g_bSurveyOn)
		{
			 throw new Error
            (
                ERROR_SURVEY_TURNED_OFF,
                'The survey has been turned off right now.'
            );
        }  
        if (!canCreateAndAccessUserData())
        {
            throw new Error
            (
                ERROR_BASE,
                'An error occurred creating an entry in the persistent user data.'
            );
        }
        if (getUserDataValue(INVITATION_DISPLAY_SESSION_COOKIE_NAME + nLaunchDefinitionIndex.toString()) != null)
        {
            throw new Error
            (
                ERROR_USER_HAS_ALREADY_BEEN_INVITED,
                'The user has already been invited to participate in the WebIQ study.'
            );
        }
        bResult = writeUserData
        (
            INVITATION_DISPLAY_SESSION_COOKIE_NAME + nLaunchDefinitionIndex.toString(),
            INVITATION_DISPLAY_SESSION_COOKIE_VALUE,
            1
        );
        if (cameFromGoogleAdWords(GOOGLE_ADWORDS_SEARCH_EXPRESSION))
        {
            throw new Error
            (
                ERROR_CAME_FROM_GOOGLE_ADWORDS_LINK,
                'The user appears to have reached the site via a Google AdWords link.'
            );
        }
        if (!isActiveProject())
        {
            throw new Error
            (
                ERROR_INACTIVE_PROJECT,
                'The WebIQ study is no longer accepting new sessions.'
            );
        }
        if (!isSelected(nSelectionProbability))
        {
            throw new Error
            (
                ERROR_USER_NOT_SELECTED,
                'The user was not randomly selected to participate in the WebIQ study.'
            );
        }
        if (!meetsWebIQSystemRequirements())
        {
            throw new Error
            (
                ERROR_INVALID_BROWSER,
                'The user\'s browser does not support the WebIQ client.'
            );
        }
        if (getUserDataValue(USER_RESPONSE_COOKIE_NAME) != null)
        {
            throw new Error
            (
                ERROR_USER_HAS_ALREADY_BEEN_INVITED,
                'The user has already been invited to participate in the WebIQ study.'
            );
        }
        createWebIQInvitationDialog
        (
            nLaunchDefinitionIndex,
            nDialogWidth,
            nDialogHeight
        );
    }
    catch (oException)
    {
        bSuccess = false;
    }
    return bSuccess;
}
function isActiveProject()
{
    var bIsActive = false;
    try
    {
        if (PROJECT_STATE.toLowerCase() == 'in progress')
        {
            bIsActive = true;
        }
    }
    catch (oException)
    {
        bIsActive = false;
    }
    return bIsActive;
}
function isSelected(nSelectionProbability)
{
    var bIsSelected = false;
    try
    {
        if
        (
            (
                Math.floor
                (
                    Math.random() * nSelectionProbability
                )
            ) == 0
        )
        {
            bIsSelected = true;
        }
    }
    catch (oException)
    {
        bIsSelected = false;
    }
    return bIsSelected;
}
function meetsWebIQSystemRequirements()
{
    var bMeetsWebIQSystemRequirements = false;
    var oUserSettings = null;
    try
    {
        oUserSettings = new UserSettings(window);
        if
        (
            (
                (oUserSettings.WindowsVersion == '95')
                ||
                (oUserSettings.WindowsVersion == '98')
                ||
                (oUserSettings.WindowsVersion.toLowerCase() == 'me')
                ||
                (oUserSettings.WindowsVersion == '2000')
                ||
                (oUserSettings.WindowsVersion.toLowerCase() == 'xp')
                ||
                (oUserSettings.WindowsVersion.toLowerCase() == 'xpsp2')
            )
            &&
            (parseFloat(oUserSettings.InternetExplorerVersion) > 5.1)
        )
        {
            bMeetsWebIQSystemRequirements = true;
        }
    }
    catch (oException)
    {
        bMeetsWebIQSystemRequirements = false;
    }
    return bMeetsWebIQSystemRequirements;
}
function processUserResponse
(
    nLaunchDefinitionIndex,
    sUserResponse
)
{
    var bResult = false;
    var sLaunchURL = null;
    try
    {
        if (!isValidString(sUserResponse))
        {
            throw new Error
            (
                ERROR_INVALID_USER_RESPONSE,
                'The user\'s response is invalid.'
            );
        }
        if (!g_bIsWebIQServerAvailable)
        {
            throw new Error
            (
                ERROR_WEBIQ_SERVER_IS_INACCESSIBLE,
                'The WebIQ server is inaccessible.'
            );
        }
        bResult = writeUserData
        (
            USER_RESPONSE_COOKIE_NAME,
            sUserResponse,
            (USER_RESPONSE_COOKIE_LIFESPAN * 24)
        );
        deleteUserData(INVITATION_DISPLAY_SESSION_COOKIE_NAME + nLaunchDefinitionIndex.toString());
		closeWebIQInvitationDialog();

        if (sUserResponse.toLowerCase() == 'accept')
        {
            sLaunchURL = WEBIQ_LAUNCH_URL.replace
            (
                /\{0\}/,
                nLaunchDefinitionIndex.toString()
            );
            //window.top.location = sLaunchURL;
            var oTempWin = window.open("https://www.webiqonline.com/webhq/hq10/index.asp", null, "height=480px,width=539px,scrollbars=yes,top=100,left=100,resizable=no");
            
            //window.top.location = window.top.location;
            
            
        }
        //window.top.location = window.top.location;
    }
    catch (oException)
    {
        closeWebIQInvitationDialog();
        //window.top.location = window.top.location;
    }
    return;
}
function updateServerAvailabilityFlag()
{
    g_bIsWebIQServerAvailable = false;
    return;
}
