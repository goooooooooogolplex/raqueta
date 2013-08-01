# function(): enable_court
enable_court = () ->
  $("#reserve1_div").attr("style", "display:none")
  $("#reserve2_div").attr("style", "display:none")
  $("#reserve3_div").attr("style", "display:none")
  $("#reserve4_div").attr("style", "display:none")
  n = document.getElementById("numcourt").selectedIndex
  switch n
    when 4
      $("#reserve4_div").attr("style", "display")
      $("#reserve3_div").attr("style", "display")
      $("#reserve2_div").attr("style", "display")
      $("#reserve1_div").attr("style", "display")
    when 3
      $("#reserve3_div").attr("style", "display")
      $("#reserve2_div").attr("style", "display")
      $("#reserve1_div").attr("style", "display")
    when 2
      $("#reserve2_div").attr("style", "display")
      $("#reserve1_div").attr("style", "display")
    when 1
      $("#reserve1_div").attr("style", "display")

# function(): sendmail
sendmail = (members) ->
  # default
  mail = "mailto:"
  length = members.length
  attend = 0
  other = false

  # address
  mail += "goooooooooogolplex+raqueta@gmail.com"

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
  c = document.getElementsByName("numcourt")[0].selectedIndex
  mail += document.getElementById("reserve0").value
  mail += (" " + document.getElementById("reserve1").value) if c >= 1
  mail += (" " + document.getElementById("reserve2").value) if c >= 2
  mail += (" " + document.getElementById("reserve3").value) if c >= 3
  mail += (" " + document.getElementById("reserve4").value) if c >= 4
  mail += "%0d%0a■ 現金受け取り%0d%0a"
  mail += document.getElementsByName("money")[0].value
  mail += "%0d%0a■ 出席%0d%0a"
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

# jQuery ready
$(document).ready ->
  enable_court()
  $("#numcourt").on('change', enable_court)
  $("#radio0_0").val("0")
  $("#radio0_0").val("1")
  for i in [0..(js_members.length-1)]
    $("#radio#{i}_0_0").on 'click', ->
      $("#radio#{i}_0").val("0")
    $("#radio#{i}_0_1").on 'click', ->
      $("#radio#{i}_0").val("1")
    $("#radio#{i}_1_0").on 'click', ->
      $("#radio#{i}_1").val("0")
    $("#radio#{i}_1_1").on 'click', ->
      $("#radio#{i}_1").val("1")
    $("#radio#{i}_2_0").on 'click', ->
      $("#radio#{i}_2").val("0")
    $("#radio#{i}_2_1").on 'click', ->
      $("#radio#{i}_2").val("1")
    $("#radio#{i}_2_2").on 'click', ->
      $("#radio#{i}_2").val("2")
    $("#radio#{i}_2_3").on 'click', ->
      $("#radio#{i}_2").val("3")
