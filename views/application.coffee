# function(): sendmail
sendmail = (members) ->
  # default
  mail = "mailto:"
  length = members.length
  attend = ""

  # address
  mail += "goooooooooogolplex@gmail.com"

  # subject
  mail += "?subject=[Raqueta] "
  mail += document.getElementsByName("today")[0].value
  mail += " ("
  mail += document.getElementsByName("court")[0].value
  mail += document.getElementsByName("numcourt")[0].value
  mail += ")&"

  # body
  mail += "body="
  mail += "出席: hoge%0d%0ahoge%0d%0ahogehoge"
  #for m, index in members
  #  if document.getElementsByName("data0_#{index}")[0].checked
  #    mail += "#{m} "
  alert(document.getElementById("dummy0_0").value)

  # exec
  #alert(mail)
  #location.assign(mail)
  #window.open(mail)

# to call from HTML
@sendmail = sendmail
