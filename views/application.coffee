sendmail = (x) ->
  radio = document.getElementsByName("sex")
  str = ""
  str += "0" if radio[0].checked
  str += "1" if radio[1].checked
  alert(str)

@sendmail = sendmail 
