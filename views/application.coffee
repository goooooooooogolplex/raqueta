# sendmail function definition
sendmail = (members) ->
  # default
  mail = "mailto:"
  length = members.length
  attend = ""

  # address
  mail += "goooooooooogolplex@gmail.com"
  mail += "&subject=[Raqueta] "
  mail += document.getElementsByName("today")[0].value

  # subject
  mail += " ("
  mail += document.getElementsByName("court")[0].value
  mail += document.getElementsByName("numcourt")[0].value
  mail += ")&"

  # body
  mail += "出席: "
  #for m, index in members
  #  if document.getElementsByName("data0_#{index}")[0].checked
  #    mail += "#{m} "
  alert(document.getElementsByName("data0_0")[0].attr("checked"))

  # exec
  #alert(mail)
  #location.assign(mail)
  #window.open(mail)

# to call from HTML
@sendmail = sendmail

initialize = (x) ->
  $('.button').attr checked: false

@initialize = initialize