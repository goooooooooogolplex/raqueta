# function(): sendmail
sendmail = (members) ->
  # default
  mail = "mailto:"
  length = members.length
  attend = 0
  other = false

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
  mail += "■ コート予約%0d%0a"
  mail += document.getElementsByName("reserve")[0].value
  mail += "■ 現金受け取り%0d%0a"
  mail += document.getElementsByName("money")[0].value
  mail += "■ 出席%0d%0a"
  for m, index in members
    if document.getElementById("radio#{index}_0").value == "1"
      mail += "#{m} "
      attend += 1
      other = true if index == (length-1)
  mail += "(#{attend}名)"
  mail += " ※その他は今のところまとめて1名扱い" if other == true
  mail += "%0d%0a■ 駐車場%0d%0a"
  for m, index in members
    if document.getElementById("radio#{index}_1").value == "1"
      mail += "#{m} "
  mail += "%0d%0a■ 支払い%0d%0a"
  for m, index in members
    money = ""
    money += "500" if document.getElementById("radio#{index}_2").value == "1"
    money += "1000" if document.getElementById("radio#{index}_2").value == "2"
    money += document.getElementById("number#{index}").value if document.getElementById("radio#{index}_2").value == "3"
    if document.getElementById("radio#{index}_2").value != "0"
      mail += "#{m} #{money}%0d%0a"

  # exec
  #alert(mail)
  location.assign(mail)

# to call from HTML
@sendmail = sendmail
