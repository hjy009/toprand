function selected(cal, date) {
  cal.sel.value = date; 
  if (cal.dateClicked )
    cal.callCloseHandler();
}

function closeHandler(cal) {
  cal.hide(); 
  _dynarch_popupCalendar = null;
}

function showCalendar(id) {
  var el = document.getElementById(id);
  if (_dynarch_popupCalendar != null) {

    _dynarch_popupCalendar.hide();          
  } else {

    var cal = new Calendar(0, null, selected, closeHandler);
	cal.weekNumbers = false;
    if (typeof showsTime == "string") {
      cal.showsTime = true;
      cal.time24 = (showsTime == "24");
    }    
    cal.showsOtherMonths = true;    
    _dynarch_popupCalendar = cal;      
    cal.setRange(1900, 2070);        
    cal.create();
  }
  _dynarch_popupCalendar.setDateFormat('%Y-%m-%d');    
  _dynarch_popupCalendar.parseDate(el.value);      
  _dynarch_popupCalendar.sel = el;   
  _dynarch_popupCalendar.showAtElement(el, "br"); 
  return false;
}
