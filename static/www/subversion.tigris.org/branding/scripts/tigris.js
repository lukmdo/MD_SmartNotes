// Focus on first form fields in login, password edit 
// and request pages. Checks for the correct form id first
// then matches the input name for focus.
function loginfocus() {
  if (document.getElementById('loginform')) {
    document.getElementById('loginform').loginID.focus();
  } 
  else if (document.getElementById('certloginform')) {
   document.getElementById('certloginform').password.focus();
  } 
  else if (document.getElementById('passwordeditform')) {
    document.getElementById('passwordeditform').passwd.focus();
  }
  else if (document.getElementById('passwordform')) {
    document.getElementById('passwordform').loginID.focus();
 }
}

// Hash to associate a child window with the element "interested"
// in it.  Used to allow popup windows to communicate a value back
// to a specific form element (Note that since js has no globals, 
// this hash belongs to the window opener, and can only be accessed
// by the child via the 'opener' property):

var windowAssociatedWithElement = new Object;

// Set the value of the element that opened this window, and close
// this window:

function setOpenerValue(newVal) {
  var retValue = true;
  if ( self.opener && !self.opener.closed ){
    opener.windowAssociatedWithElement[self].value = newVal;
    // return the focus to the parent window, and the element
    // which called it: 
    opener.focus();
    opener.windowAssociatedWithElement[self].focus();
    retValue = false;
  }
  window.close();
  return retValue;
}

// Check if a form field has changed from its initial value:
function fieldChanged(formField) {
    if( formField.defaultValue != formField.value ){
        return true;
    }
    else {
        return false;
    }
}

/* Open popup widows of (mostly) predetermined types.

   windowURL -- The URL to load in the new browser window.
   type -- The (predetermined) type of window to launch.
           acceptable values for type:
           1: a help window
           2: a 400x400 window
           3: Issuezilla assignable users popup window
           4: ViewCVS file contents display popup window
           ... and you can hard code others yourself inside the function.
   atts -- (optional) If the window you wish to create is unique and you do
           not want to set up a "type" for it, or if you want to pass
           additional attributes for a certain "type", you can pass its
           attributes directly to the function via this parameter.
   formElementRef -- (optional) reference to a form element which was
           responsible for opening this window, and interested in in its
           choices.
*/

var tigrisPopupCounter = 0;

function launch(windowURL, type, atts, formElementRef) {
  tigrisPopupCounter += 1;

  var windowName = 'CollabNet' + type;
  if (atts) {
    windowName += tigrisPopupCounter;
  }

  var windowAttributes;
  if (type == 1) {
    windowAttributes = 'resizable=yes,left=10,top=10,screenX=12,screenY=12,' +
                       'height=485,width=724,status=yes,scrollbars=yes,' +
                       'toolbar=yes,menubar=yes,location=yes'
  }
  else if (type == 2) {
    windowAttributes = 'resizable=yes,left=10,top=10,screenX=12,screenY=12,' +
                       'height=400,width=400';
  }
  else if (type == 3) {
   windowAttributes = 'resizable=yes,left=10,top=10,screenX=12,screenY=12,' + 
                      'height=440,width=600,scrollbars=yes'; 
  }
  else if (type == 4) {
    windowAttributes = 'resizable=yes,left=10,top=10,screenX=12,screenY=12,' +
                       'height=485,width=724,scrollbars=yes';
  }
  else if (type == 5) {
    windowAttributes = 'resizable=yes,left=10,top=10,screenX=12,screenY=12,' +
                       'height=600,width=800,status=yes,scrollbars=yes,' +
                       'toolbar=yes,menubar=yes,location=yes'
  }
  
  if (atts) {
    windowAttributes += ',' + atts;
  }

  var windowObj = window.open(windowURL, windowName, windowAttributes);

  if (windowObj) {
    if (formElementRef) {
      // Take note of the element that wanted this window opened:
      windowAssociatedWithElement[windowObj] = formElementRef; 
    }
    return false;
  }
  else {
    return true;
  }
}

//This function is used to set a  input checkbox element in 
//checked/unchecked state
function setSelected(formName, inputName, val)
{
    dml = document.forms[formName];
    len = dml.elements.length;
    var i = 0;
    for (i = 0; i < len; i++)
    {
        if (dml.elements[i].name == inputName)
        {
            dml.elements[i].checked = val;
        }
    }
}

//This function is part of multiselect checkbox implementation
function setTitleValue(formName, inputName, val)
{
    dml = document.forms[formName];
    len = dml.elements.length;
    var i = 0;
    for (i = 0; i < len; i++)
    {
        if (dml.elements[i].name == inputName)
        {
            dml.elements[i].title = val;
        }
    }
}

//This function is used in case of multiselect checkboxes
//This function can be called on "onclick" event of the 
//(select all) check box in order to select or deselect
//all the check boxs under a group
function selectAllCheckBoxes(formName, thisInput, inputToSet)
{
    dml = document.forms[formName];
    len = dml.elements.length;
    var i = 0;
    for (i = 0; i < len; i++)
    {
        if (dml.elements[i].name == thisInput)
        {
            if (dml.elements[i].checked)
            {
                setSelected(formName, inputToSet, 1);
                setTitleValue(formName, thisInput, 'Deselect all');
            }
            else
            {
                setSelected(formName, inputToSet, 0);
                setTitleValue(formName, thisInput, 'Select all');
            }
        }
    }
}

//This function is used in case of multiselect checkboxes
//This function can be called on (onclick) event of the 
//individual check boxes in a group in order to select or deselect
//its state irrespective of other checkboxes state.
function checkSelectAll(formName, thisInput, inputToSet)
{
    dml = document.forms[formName];
    len = dml.elements.length;
    var trueCount = 0;
    var inputCount = 0;
    var i = 0;
    for (i = 0; i < len; i++)
    {
        if ((dml.elements[i].name == thisInput) && (dml.elements[i].checked == false))
        {
            setSelected(formName, inputToSet, 0);
            setTitleValue(formName, inputToSet, 'Select all');
        }
        else
        {
            trueCount++;
        }
        inputCount++;
    }
    if (trueCount == inputCount)
    {
            setSelected(formName, inputToSet,1);
            setTitleValue(formName, inputToSet, 'Deselect all');
    }
}


/* BEGIN JavaScript for Add additional servers */
var DHTML = (document.getElementById || document.all || document.layers);

function getObj(name) {
    if (document.getElementById) {
        this.obj = document.getElementById(name);
        this.style = document.getElementById(name).style;
    } else if (document.all) {
        this.obj = document.all[name];
        this.style = document.all[name].style;
    } else if (document.layers) {
        this.obj = document.layers[name];
        this.style = document.layers[name];
    }
}

function invi(id, flag) {
    if (!DHTML) return;
    var x = new getObj(id);
    x.style.display = (flag) ? 'block' : 'none'
}

function addAdditionalServerTextBoxes(prefix, documentType, showUpload) {
     if (prefix == null) {
        prefix = '';
    }

    if (prefix != '') {
        prefix = prefix + '_';
    }

    document.writeln('<div id="' + prefix + 'doctable_footer_compact" class="doctable_footer">');
    document.writeln('<div class="doctable_links">');
    document.writeln('<div class="open_button" title="' + showUpload + '" onclick="invi(\'' + prefix + 'doctable_footer_expanded\',1);invi(\'' + prefix + 'doctable_footer_compact\',0);">');
    document.writeln('<a href="#"><span class="alt">+<\/span><\/a>');
    document.writeln('<\/div>');
    document.writeln('<a href="javascript:invi(\'' + prefix + 'doctable_footer_expanded\',1);invi(\'' + prefix + 'doctable_footer_compact\',0);" title="' + showUpload + '">' + documentType + '<\/a>');
    document.writeln('<\/div>');
    document.writeln('<\/div>');
    document.writeln('<div id="' + prefix + 'doctable_footer_expanded" class="hide">');
}

function hideAddAdditionalServerTextBoxes(prefix, documentType, hideUpload) {
     if (prefix == null) {
        prefix = '';
    }

    if (prefix != '') {
        prefix = prefix + '_';
    }

    document.writeln('<div class="close_button" title="' + hideUpload + '" onclick="invi(\'' + prefix + 'doctable_footer_expanded\',0);invi(\'' + prefix + 'doctable_footer_compact\',1);">');
    document.writeln('<a href="#"><span class="alt">-<\/span><\/a>');
    document.writeln('<\/div>');
    document.writeln('<a href="javascript:invi(\'' + prefix + 'doctable_footer_expanded\',0);invi(\'' + prefix + 'doctable_footer_compact\',1);" class="selfref">' + documentType + '<\/a>');
}

function uploadTextBoxBottom() {
    document.writeln('<\/div>');
}

function hidediv(id) {
        //safe function to hide an element with a specified id
        if (document.getElementById) { // DOM3 = IE5, NS6
                document.getElementById(id).style.display = 'none';
        }
        else {
                if (document.layers) { // Netscape 4
                        document.id.display = 'none';
                }
                else { // IE 4
                        document.all.id.style.display = 'none';
                }
        }
}

function showdiv(id) {
        //safe function to show an element with a specified id
                  
        if (document.getElementById) { // DOM3 = IE5, NS6
                document.getElementById(id).style.display = 'block';
        }
        else {
                if (document.layers) { // Netscape 4
                        document.id.display = 'block';
                }
                else { // IE 4
                        document.all.id.style.display = 'block';
                }
        }
}

function simpleVisibility(id, id2) 
{
	obj = document.getElementById(id);
	obj2 = document.getElementById(id2);
	
	if (obj.style.display == 'none')
	{
    showdiv(id); 
    obj2.className = 'collapsewidget';  
  }
  else 
  {
    hidediv(id);
   obj2.className = 'expandwidget';  

 	}
 }
/* END JavaScript for Add additional servers */

/* Script to control the page reload in UserAdd page on change of 
	Authentication realm */
	
function pageReloadOnCondition(formObj)
{
    var ceeRealmId = formObj.ceeRealmId.value;
    var realmId = formObj.authRealmId[formObj.authRealmId.selectedIndex].value;
    var prevSelectedRealmId = formObj.prevSelectedRealmId.value;

    if((prevSelectedRealmId=="" || prevSelectedRealmId==ceeRealmId) && realmId!= ceeRealmId)
    {
        formObj.prevSelectedRealmId.value = realmId;
        formObj.submit();
    }
    else if(prevSelectedRealmId!=ceeRealmId && realmId == ceeRealmId)
    {
        formObj.prevSelectedRealmId.value = realmId;
        formObj.submit();
    }
    formObj.prevSelectedRealmId.value = realmId;
}

/* END of page reload on condition script */

/* Script to control the page reload in LoginSetup page on change of 
	Authentication realm */
function loginSetupPageReloadOnCondition(formObj)
{
    var ceeRealmId = formObj.ceeRealmId.value;
    var realmId = formObj.authRealmId[formObj.authRealmId.selectedIndex].value;
    var prevSelectedRealmId = formObj.prevSelectedRealmId.value;

    if(prevSelectedRealmId=="" && realmId==ceeRealmId)
    {
        formObj.prevSelectedRealmId.value = realmId;
        formObj.submit();
    }
    else if(prevSelectedRealmId!=ceeRealmId && realmId == ceeRealmId)
    {
        formObj.prevSelectedRealmId.value = realmId;
        formObj.submit();
    }
    else if(prevSelectedRealmId==ceeRealmId && realmId != ceeRealmId)
    {
        formObj.prevSelectedRealmId.value = realmId;
        formObj.submit();
    }
    formObj.prevSelectedRealmId.value = realmId;
}
/* END of LoginSetup page reload on condition script */

/* BEGIN JavaScript for Add Secondary Emails */

var DHTML = (document.getElementById || document.all || document.layers);

function getObj(name) {
    if (document.getElementById) {
        this.obj = document.getElementById(name);
        this.style = document.getElementById(name).style;
    } else if (document.all) {
        this.obj = document.all[name];
        this.style = document.all[name].style;
    } else if (document.layers) {
        this.obj = document.layers[name];
        this.style = document.layers[name];
    }
}

function invi(id, flag) {
    if (!DHTML) return;
    var x = new getObj(id);
    x.style.display = (flag) ? 'block' : 'none'
}

function addAdditionalTextBoxes(prefix, documentType, showUpload) {
  if (prefix == null) {
     prefix = '';
  }

  if (prefix != '') {
     prefix = prefix + '_';
  }

  document.writeln('<div id="' + prefix + 'doctable_footer_compact" class="doctable_footer">');
  document.writeln('<div class="doctable_links">');
  document.writeln('<div class="open_button" title="' + showUpload + '" onclick="invi(\'' + prefix + 'doctable_footer_expanded\',1);invi(\'' + prefix + 'doctable_footer_compact\',0);">');
  document.writeln('<a href="#"><span class="alt">+<\/span><\/a>');
  document.writeln('<\/div>');
  document.writeln('<a href="javascript:invi(\'' + prefix + 'doctable_footer_expanded\',1);invi(\'' + prefix + 'doctable_footer_compact\',0);" title="' + showUpload + '">' + documentType + '<\/a>');
  document.writeln('<\/div>');
  document.writeln('<\/div>');
  document.writeln('<div id="' + prefix + 'doctable_footer_expanded" class="hide">');
}

function hideAddAdditionalTextBoxes(prefix, documentType, hideUpload) {
   if (prefix == null) {
      prefix = '';
   }

   if (prefix != '') {
      prefix = prefix + '_';
   }

   document.writeln('<div class="close_button" title="' + hideUpload + '" onclick="invi(\'' + prefix + 'doctable_footer_expanded\',0);invi(\'' + prefix + 'doctable_footer_compact\',1);">');
   document.writeln('<a href="#"><span class="alt">-<\/span><\/a>');
   document.writeln('<\/div>');
   document.writeln('<a href="javascript:invi(\'' + prefix + 'doctable_footer_expanded\',0);invi(\'' + prefix + 'doctable_footer_compact\',1);" class="selfref">' + documentType + '<\/a>');
}

function uploadTextBoxBottom() {
    document.writeln('<\/div>');
}

function hidediv(id) {
   //safe function to hide an element with a specified id
   if (document.getElementById) { // DOM3 = IE5, NS6
      document.getElementById(id).style.display = 'none';
   }else
   {
     if (document.layers) { // Netscape 4
        document.id.display = 'none';
     }
     else { // IE 4
        document.all.id.style.display = 'none';
     }
   }
}
function showdiv(id) {
    //safe function to show an element with a specified id
      if (document.getElementById) { // DOM3 = IE5, NS6
          document.getElementById(id).style.display = 'block';
      } else
      {
         if (document.layers) { // Netscape 4
             document.id.display = 'block';
         }
         else { // IE 4
             document.all.id.style.display = 'block';
         }
     }
}

function simpleVisibility(id, id2)
{
    obj = document.getElementById(id);
    obj2 = document.getElementById(id2);

    if (obj.style.display == 'none')
    {
       showdiv(id);
       obj2.className = 'collapsewidget';
    }
    else
    {
       hidediv(id);
       obj2.className = 'expandwidget';
    }
}
/* END JavaScript for Add Secondary Emails */


/*
 * Makes an HTTP request to the given URL and passes the response in text
 * form to the callbackFunction, which would have the signature
 *
 * myCallBackFunction(responseText, additionalArgument)
 *
 * The additional argument could be any object, but would normally be either
 * a DOM element id or the element itself which will be used to display
 * the results of operations on the response.
 */
function invokeAJAX(url, callbackFunction, additionalArgument)
{
    var http = window.XMLHttpRequest ? new XMLHttpRequest() : 
        new ActiveXObject("Microsoft.XMLHTTP");  
    http.open('get', url);
    http.onreadystatechange = function() {
      if (http.readyState == 4) {   
        callbackFunction(http.responseText, additionalArgument);    
      }
    };
    http.send(null);
    return false;
}

function replaceHTML(id, url, startText, endText)
{
    var http = window.XMLHttpRequest ? new XMLHttpRequest() : 
        new ActiveXObject("Microsoft.XMLHTTP");  
    http.open('get', url);
    http.onreadystatechange = function() {
      if (http.readyState == 4) {   
        var response = http.responseText;    
        var start = 0;    
        if(startText && startText.length > 0)
        {
          start = response.indexOf(startText);
        }
        if (endText && endText.length > 0) 
        {
          var end = response.indexOf(endText);
          document.getElementById(id).innerHTML = response.substring(start, end);
        }
        else
        {
          document.getElementById(id).innerHTML = response.substring(start);
        }
      }
    };
    http.send(null);
    return false;
}

/*
 * Support multiple page onload handlers.  Note this simple method works best where                                                               
 * the event is not actually used in the handling code as is the case with onload handlers.
 * For more discussion on this code see:
 * http://simon.incutio.com/archive/2004/05/26/addLoadEvent
 */
function addLoadEventHandler(func)
{
    var oldonload = window.onload;
    if (typeof window.onload != 'function')
    {
        window.onload = func;
    }
    else
    {
        window.onload = function()
        {
            if (oldonload)
            {
                oldonload();
            }
            func();
        }
    }
}

//START: Methods moved from projectdashboard.js

function calendarWindowDate (file, theField) {
// popup the calendar window for DATE.
// and take the returned value and do something with it.
// theField: input assumes input type=text

var fileName,w,h;
fileName = file;

var windowName = "calendar";
var width = 310;
var widthString = "width="+width;
var height = 420;
var heightString = "height="+height;

var hasToolbar = "toolbar=no";
var hasLocation = "location=no";
var hasDirectories = "directories=no";
var hasMenubar = "menubar=no";
var isResizable = "resizable=yes";
var propString = fileName +","+ windowName +","+ widthString +","+ heightString +","+ hasToolbar +","+ hasLocation +","+ hasDirectories +","+ hasMenubar +","+ isResizable;
var calendarPopup = window.open (fileName, windowName, propString);
calendarFieldHolder = theField;
today= new Date(dateParser(theField.value,FORMAT));
user_sel_val_holder = new Date(dateParser(theField.value,FORMAT));
cal_val_holder= today;
return false;
}

//global calendar

var FORMAT="YYYY-MM-DD";
var cal_val_holder;
var user_sel_val_holder;
var curr_date;

// Leap year Month days.
var semimonthly;

// Non-Leap year Month days..

var calPeriods=[31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

// Leap year Month days.

var calLeapPeriods=[31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
var css=["periodax","periodbx","currentperiod","othermonthday"];

//parser which converts the String to date based on the format

function dateParser(strDate, format){
if(!checkValidDate(strDate))
return new Date();

var slash1 = strDate.indexOf("/");
if (slash1 == -1) { slash1 = strDate.indexOf("-"); }
// if no slashes or dashes, invalid date
if (slash1 == -1) { return false; }
var dateYear = strDate.substring(0, slash1);
var dateYearAndMonth = strDate.substring(slash1+1, strDate.length);
var slash2 = dateYearAndMonth.indexOf("/");
if (slash2 == -1) { slash2 = dateYearAndMonth.indexOf("-"); }
// if not a second slash or dash, invalid date
if (slash2 == -1) { return false; }
var dateMonth = dateYearAndMonth.substring(0, slash2);
var dateDay = dateYearAndMonth.substring(slash2+1, dateYearAndMonth.length);
var retDate = new Date(dateYear,dateMonth-1,dateDay);
return retDate;
}

function checkValidDate(dateStr) {
    // dateStr must be of format month day year with either slashes
    // or dashes separating the parts. Some minor changes would have
    // to be made to use day month year or another format.
    // This function returns True if the date is valid.
    var slash1 = dateStr.indexOf("/");
    if (slash1 == -1) { slash1 = dateStr.indexOf("-"); }
    // if no slashes or dashes, invalid date
    if (slash1 == -1) { return false; }

    var dateYear = dateStr.substring(0, slash1);
    var dateYearAndMonth = dateStr.substring(slash1+1, dateStr.length);
    var slash2 = dateYearAndMonth.indexOf("/");
    if (slash2 == -1) { slash2 = dateYearAndMonth.indexOf("-"); }
    // if not a second slash or dash, invalid date
    if (slash2 == -1) { return false; }
    var dateMonth = dateYearAndMonth.substring(0, slash2);
    var dateDay = dateYearAndMonth.substring(slash2+1, dateYearAndMonth.length);
    if ( (dateMonth == "") || (dateDay == "") || (dateYear == "") ) { return false; }
     // if any non-digits in the month, invalid date
    for (var x=0; x < dateMonth.length; x++) {
        var digit = dateMonth.substring(x, x+1);
        if ((digit < "0") || (digit > "9")) { return false; }
    }
    // convert the text month to a number
    var numMonth = 0;
    for (var x=0; x < dateMonth.length; x++) {
        digit = dateMonth.substring(x, x+1);
        numMonth *= 10;
        numMonth += parseInt(digit);
    }
    if ((numMonth <= 0) || (numMonth > 12)) { return false; }
    // if any non-digits in the day, invalid date
    for (var x=0; x < dateDay.length; x++) {
        digit = dateDay.substring(x, x+1);
        if ((digit < "0") || (digit > "9")) { return false; }
    }
    // convert the text day to a number
    var numDay = 0;
    for (var x=0; x < dateDay.length; x++) {
        digit = dateDay.substring(x, x+1);
        numDay *= 10;
        numDay += parseInt(digit);
    }
    if ((numDay <= 0) || (numDay > 31)) { return false; }
    // February can't be greater than 29 (leap year calculation comes later)
    if ((numMonth == 2) && (numDay > 29)) { return false; }
    // check for months with only 30 days
    if ((numMonth == 4) || (numMonth == 6) || (numMonth == 9) || (numMonth == 11)) {
        if (numDay > 30) { return false; }
    }
    // if any non-digits in the year, invalid date
    for (var x=0; x < dateYear.length; x++) {
        digit = dateYear.substring(x, x+1);
        if ((digit < "0") || (digit > "9")) { return false; }
    }
    // convert the text year to a number
    var numYear = 0;
    for (var x=0; x < dateYear.length; x++) {
        digit = dateYear.substring(x, x+1);
        numYear *= 10;
        numYear += parseInt(digit);
    }
    // Year must be a 4-digit year
    if (dateYear.length != 4) { return false; }
    // if 2-digit year, use 50 as a pivot date
    if ( (numYear < 50) && (dateYear.length == 2) ) { numYear += 2000; }
    if ( (numYear < 100) && (dateYear.length == 2) ) { numYear += 1900; }
    if ((numYear <= 0) || (numYear > 9999)) { return false; }
    // check for leap year if the month and day is Feb 29
    if ((numMonth == 2) && (numDay == 29)) {
        var div4 = numYear % 4;
        var div100 = numYear % 100;
        var div400 = numYear % 400;
        // if not divisible by 4, then not a leap year so Feb 29 is invalid
        if (div4 != 0) { return false; }
        // at this point, year is divisible by 4. So if year is divisible by
        // 100 and not 400, then it's not a leap year so Feb 29 is invalid
        if ((div100 == 0) && (div400 != 0)) { return false; }
    }
    // date is valid
    return true;
}

// methods for simple calendar Date Picker calendar

function calDisplay()
{
week=7;
selDate= new Date(opener.user_sel_val_holder);
today = new Date(arguments[0]);
currentVal = new Date(opener.cal_val_holder);
// as of Danube, PT needs all the dates, including weekend dates, to be
// hyperlinked in the Calendar for its Date type attributes, whereas PD
// doesn't want weekend dates to be hyperlinked.
hyperLinkWeekEndDates = arguments[1] == null ? false : arguments[1];
curr_day= today.getDate();
sel_day= selDate.getDate();
end_date= getEndDate(currentVal);
currentVal.setDate(end_date);
end_day=currentVal.getDay();
currentVal.setDate(1);
start_day=currentVal.getDay();
row=0;
end_week=week-end_day;
document.writeln("<tr>");
for (var odday=0;odday<start_day;odday++,row++)
{
document.writeln("<td class=\""+css[3]+"\">&nbsp;</td>");
}

for (var day=1;day<=end_date;day++,row++)
{
if(row == week)
{
document.writeln("</tr> <tr> ");
row=0;
}
document.writeln("<td class=\"calendarday\"");
if(curr_day == day && currentVal.getMonth() == today.getMonth() && currentVal.getFullYear() == today.getFullYear())
document.writeln(" id=\"today\" > ");
else if(sel_day == day  && currentVal.getMonth() == selDate.getMonth() && currentVal.getFullYear() == selDate.getFullYear())
document.writeln(" id=\"selectedDate\" > ");
else
document.writeln(" > ");

if(isWeekend(day,currentVal) && !hyperLinkWeekEndDates)
document.writeln(day+"</td>");
else
 if(sel_day == day)
    document.writeln("<a href=\"javascript:selectPeriod("+day+","+currentVal.getMonth()+","+currentVal.getFullYear()+");\"; title=\""+ arguments[2]+" \" >"+day+"</a></td>");
 else
   document.writeln("<a href=\"javascript:selectPeriod("+day+","+currentVal.getMonth()+","+currentVal.getFullYear()+");\" >"+day+"</a></td>");
}

for (var end=0;end<(end_week-1);end++)
{
document.writeln("<td class=\""+css[3]+"\">&nbsp;</td>");
}
document.writeln("</tr>");


}

/* This will return the number of days available in the given month*/

function getEndDate(theDate)
{
var isLeap= leapYear(theDate.getFullYear());
if(isLeap)
return calLeapPeriods[theDate.getMonth()];
else
return calPeriods[theDate.getMonth()];
}

/*Function that will check the year is leap year or not*/

function leapYear(year) {
if ((year/4)   != Math.floor(year/4))   return false;
if ((year/100) != Math.floor(year/100)) return true;
if ((year/400) != Math.floor(year/400)) return false;
return true;
}

//Displays Today

function currentDate()
{
tday = new Date(arguments[0]);
tday_str=convertDateToString(tday);
return tday_str;
}

//converts given date to YYYY/MM/DD format need to make for all formats

function convertDateToString(tday,format)
{
g_date= tday.getDate();
g_month= tday.getMonth()+1;
g_year= tday.getFullYear();
g_date= (g_date >9)?g_date:"0"+g_date;
g_month= (g_month >9)?g_month:"0"+g_month;
return g_year+"-"+g_month+"-"+g_date;
}

/*This displays the previous month calender */

function calPrevious()
{
prevdate= getCalValue();
location.reload();
setSelectedMonth(-1,prevdate);
}

/*This displays the next month calender*/

function calNext()
{
nextdate= getCalValue();
location.reload();
setSelectedMonth(1,nextdate);
}

function getCalValue()
{
return opener.today;
}

/*Updates the new selected month in the calender*/

function setSelectedMonth()
{
ptr= arguments[0];
new_date= arguments[1];
ptr=new_date.getMonth()+ptr;
index=ptr
if(index == 12)
        index = 0;
else if(index == -1)
        index = 11;
isLeap=leapYear(new_date.getFullYear)
if(isLeap)
    new_date.setDate(calLeapPeriods[index]);
else
    new_date.setDate(calPeriods[index]);
new_date.setMonth(ptr);
}

//checks whether given date is a weekend

function isWeekend(day,date)
{
temp=new Date(date);
temp.setDate(day);
d=temp.getDay();
if(d==0 || d==6)
{
return true;
}
return false;
}

function selectPeriod()
{
date= opener.setSelDate(arguments[0],arguments[1],arguments[2]);
window.close();
return (date);
}

function setSelDate()
{
sel_Date=arguments[0];
sel_Month=arguments[1];
sel_Year=arguments[2];
var send_Date = new Date(sel_Year,sel_Month,sel_Date);
sel_string= convertDateToString(send_Date,FORMAT);
calendarFieldHolder.value=sel_string;
}

function selCurrentDate()
{
curr= new Date(arguments[0]);
date = opener.setSelDate(curr.getDate(),curr.getMonth(),curr.getFullYear());
window.close();
return (date);
}

// Format setter eg: November 6, 2003 
function formatDate(date)
{
  g_date=date.getDate();
  if(g_date <=9)
  {
    g_date="0"+g_date;
  }
  g_month=date.getMonth();
  g_year=date.getFullYear();
  if (g_year < 2000) g_year += 1900;
  return todaysMonthName(date)+" "+g_date+", "+g_year;
}

function todaysMonthName () {
isinit= (arguments[0] == null)?true:false;
var Today = (isinit)?initialize():arguments[0];
if(isinit) 
return Today.getMonth();	
var nowMonthNumber = Today.getMonth();
var nowMonthName;

if (nowMonthNumber == 0) { nowMonthName = "January"; }
else if (nowMonthNumber == 1) { nowMonthName = "February"; } 
else if (nowMonthNumber == 2) { nowMonthName = "March"; } 
else if (nowMonthNumber == 3) { nowMonthName = "April"; } 
else if (nowMonthNumber == 4) { nowMonthName = "May"; } 
else if (nowMonthNumber == 5) { nowMonthName = "June"; } 
else if (nowMonthNumber == 6) { nowMonthName = "July"; } 
else if (nowMonthNumber == 7) { nowMonthName = "August"; } 
else if (nowMonthNumber == 8) { nowMonthName = "September"; } 
else if (nowMonthNumber == 9) { nowMonthName = "October"; } 
else if (nowMonthNumber == 10) { nowMonthName = "November"; } 
else if (nowMonthNumber == 11) { nowMonthName = "December"; } 
else { 
//TodayMonth = TodayMonth; 
}
return nowMonthName;
}

function todaysMonthNumber () {
var Today = (arguments[0] == null)?new Date():arguments[0];
var nowMonthNumber = Today.getMonth();

if (nowMonthNumber == 0) { nowMonthNumber = "01"; }
else if (nowMonthNumber == 1) { nowMonthNumber = "02"; }
else if (nowMonthNumber == 2) { nowMonthNumber = "03"; }
else if (nowMonthNumber == 3) { nowMonthNumber = "04"; }
else if (nowMonthNumber == 4) { nowMonthNumber = "05"; }
else if (nowMonthNumber == 5) { nowMonthNumber = "06"; }
else if (nowMonthNumber == 6) { nowMonthNumber = "07"; }
else if (nowMonthNumber == 7) { nowMonthNumber = "08"; }
else if (nowMonthNumber == 8) { nowMonthNumber = "09"; }
else if (nowMonthNumber == 9) { nowMonthNumber = "10"; }
else if (nowMonthNumber == 10) { nowMonthNumber = "11"; }
else if (nowMonthNumber == 11) { nowMonthNumber = "12"; }
else {
//nowMonthNumber = nowMonthNumber;
}
return nowMonthNumber;
}

/*Intialize the calender globally*/
function initialize(){
curr_date=opener.selDate;
semimonthly=opener.isSemimonthly; 
curr_date=(curr_date == null)?new Date():curr_date;
return curr_date;
}

function todaysDate () {

var Today = curr_date;
var TodayYear = Today.getFullYear();
if (TodayYear < 2000) TodayYear += 1900;

var todayDate = TodayYear;
return todayDate;
}

/* Function which displays the calendar */
function dateDisplay()
{
duration= opener.repDuration;
rep_Period= opener.currRepEnd;
week=7;
date= new Date(curr_date);
sel_day=date.getDate();
end_date= getEndDate(date);
date.setDate(end_date);
end_day=date.getDay();
date.setDate(1);
start_day=date.getDay();
row=0;
end_week=week-end_day;
document.writeln("<tr>"); 
for (var odday=0;odday<start_day;odday++,row++)
{
document.writeln("<td class='"+css[3]+"'>&nbsp;</td>");
}

for (var day=1;day<=end_date;day++,row++)
{
if(row == week)
{
document.writeln("</tr> <tr align='right'> ");
row=0;
}
document.writeln("<td class='"+getCssClass(day,duration,date,rep_Period)+"'>");

if(isWeekend(day,date))
{
document.writeln(day+"</td>");
}
else{
document.writeln("<a href='javascript:clickDatePeriod("+day+","+date.getMonth()+","+date.getFullYear()+");' >"+day+"</a></td>");
}

}

for (var end=0;end<(end_week-1);end++)
{
document.writeln("<td class='"+css[3]+"'>&nbsp;</td>");
}
document.writeln("</tr>"); 
}


/* The current (or) selected date*/
function getSelectedDate()
{
return curr_date;
}

/*This displays the previous month calender */
function previous()
{
prevdate= getSelectedDate();
location.reload();
setSelectedMonth(-1,prevdate);	
}

/*This displays the next month calender*/
function next()
{
nextdate= getSelectedDate();
location.reload();
setSelectedMonth(1,nextdate);
}

//method that fetches the class by sending the date
function getCssClass(){
d= arguments[0];
dur= arguments[1];
currdate= arguments[2];
currdate.setDate(d);
rep= arguments[3];	
if(!semimonthly)
	val=getCssClassValue(dur,rep,currdate);	
	else
	val=getSemiValue(d,rep,currdate);	
return getClassValue(val);
}

//Returns the value for fetching the respective class 
function getCssClassValue(duration,rep,currdate)
{
diff=days_between(rep,currdate);
if(diff < -1)
diff = diff+1;

val= diff/duration;
return val;
}

function days_between(date1, date2) {

// The number of milliseconds in one day
var ONE_DAY = 1000 * 60 * 60 * 24;

// Convert both dates to milliseconds

var date1_ms = date1.getTime();
var date2_ms = date2.getTime();

// Calculate the difference in milliseconds
//var difference_ms = Math.abs(date1_ms - date2_ms);
var difference_ms = date1_ms - date2_ms;

// Convert back to days and return
return Math.floor(difference_ms/ONE_DAY);
}

//fetches the respective class for the date based on rep end
function getClassValue(v){
if(val<1 && val>=0)
{		
return css[2];
}
val=Math.floor(Math.abs(val))%2;
return css[val];	
}

function getSemiValue(day,rep,currdate)
{
   isstart=isStartForSemimonthly(rep);
   tmpDate= day;
   tmpYear= currdate.getYear();
   tmpMonth= currdate.getMonth();
   if(tmpDate>=1 && tmpDate<=14)
   { 
	  if(tmpYear == rep.getYear() && tmpMonth == rep.getMonth() && isstart)
      return 0;
	  else
	  return 3;
   }
    else
	{
       if(tmpYear == rep.getYear() && tmpMonth == rep.getMonth() && !isstart)
	   return 0;
	   else
	   return 4;
	}
}

function isStartForSemimonthly(repDate)
{
	tmpDate= rep.getDate();
	if(tmpDate>=1 && tmpDate<=14)
		return true;
	else
		return false;
}

//function called when user selects a date from calender
function clickDatePeriod () {
date= opener.setDate(arguments[0],arguments[1],arguments[2]);
window.close();
return (date);
}

//END: Methods moved from projectdashboard.js
