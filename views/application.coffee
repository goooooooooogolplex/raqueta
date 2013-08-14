# function(): enable_court
enable_court = () ->
  $("#reserve1_div").attr("style", "display:none")
  $("#reserve2_div").attr("style", "display:none")
  $("#reserve3_div").attr("style", "display:none")
  $("#reserve4_div").attr("style", "display:none")
  n = document.getElementById("numcourt").selectedIndex
  $("#reserve1_div").attr("style", "display") if n >= 1
  $("#reserve2_div").attr("style", "display") if n >= 2
  $("#reserve3_div").attr("style", "display") if n >= 3
  $("#reserve4_div").attr("style", "display") if n >= 4

# function(): calculate_price
calculate_price = () ->
  price = js_price[document.getElementsByName("court")[0].selectedIndex]
  $("#price0").val((document.getElementById("time0").selectedIndex + 1) * price)
  $("#price1").val((document.getElementById("time1").selectedIndex + 1) * price)
  $("#price2").val((document.getElementById("time2").selectedIndex + 1) * price)
  $("#price3").val((document.getElementById("time3").selectedIndex + 1) * price)
  $("#price4").val((document.getElementById("time4").selectedIndex + 1) * price)

# function(): sendmail
sendmail = (members) ->
  # default
  mail = "mai"
  mail += "lto:"
  length = members.length
  attend = 0
  other = false

  # address
  mail += "goooooooooogolplex+raqueta"
  mail += "@gmail.com"

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
  mail += (" " + document.getElementById("price0").value + "%0d%0a")
  mail += (      document.getElementById("reserve1").value) if c >= 1
  mail += (" " + document.getElementById("price1").value + "%0d%0a") if c >= 1
  mail += (      document.getElementById("reserve2").value) if c >= 2
  mail += (" " + document.getElementById("price2").value + "%0d%0a") if c >= 2
  mail += (      document.getElementById("reserve3").value) if c >= 3
  mail += (" " + document.getElementById("price3").value + "%0d%0a") if c >= 3
  mail += (      document.getElementById("reserve4").value) if c >= 4
  mail += (" " + document.getElementById("price4").value + "%0d%0a") if c >= 4
  mail += "■ 現金受け取り%0d%0a"
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
  for i in [0..4]
    $("#time#{i}").prop("selectedIndex", 2)
    $("#time#{i}").on('change', calculate_price)
  $("#court").on('change', calculate_price)
  calculate_price()
  for i in [0..(js_members.length-1)]
    $("#radio#{i}_0_0").on 'click', ->
      $("#radio#{this.value}_0").val("0")
      $("#radio#{this.value}_0_0").attr("class", "btn btn-info btn-large active")
      $("#radio#{this.value}_0_1").attr("class", "btn btn-large")
    $("#radio#{i}_0_1").on 'click', ->
      $("#radio#{this.value}_0").val("1")
      $("#radio#{this.value}_0_0").attr("class", "btn btn-large")
      $("#radio#{this.value}_0_1").attr("class", "btn btn-info btn-large active")
    $("#radio#{i}_1_0").on 'click', ->
      $("#radio#{this.value}_1").val("0")
      $("#radio#{this.value}_1_0").attr("class", "btn btn-warning btn-large active")
      $("#radio#{this.value}_1_1").attr("class", "btn btn-large")
    $("#radio#{i}_1_1").on 'click', ->
      $("#radio#{this.value}_1").val("1")
      $("#radio#{this.value}_1_0").attr("class", "btn btn-large")
      $("#radio#{this.value}_1_1").attr("class", "btn btn-warning btn-large active")
    $("#radio#{i}_2_0").on 'click', ->
      $("#radio#{this.value}_2").val("0")
      $("#radio#{this.value}_2_0").attr("class", "btn btn-success btn-large active")
      $("#radio#{this.value}_2_1").attr("class", "btn btn-large")
      $("#radio#{this.value}_2_2").attr("class", "btn btn-large")
      $("#radio#{this.value}_2_3").attr("class", "btn btn-large")
    $("#radio#{i}_2_1").on 'click', ->
      $("#radio#{this.value}_2").val("1")
      $("#radio#{this.value}_2_0").attr("class", "btn btn-large")
      $("#radio#{this.value}_2_1").attr("class", "btn btn-success btn-large active")
      $("#radio#{this.value}_2_2").attr("class", "btn btn-large")
      $("#radio#{this.value}_2_3").attr("class", "btn btn-large")
    $("#radio#{i}_2_2").on 'click', ->
      $("#radio#{this.value}_2").val("2")
      $("#radio#{this.value}_2_0").attr("class", "btn btn-large")
      $("#radio#{this.value}_2_1").attr("class", "btn btn-large")
      $("#radio#{this.value}_2_2").attr("class", "btn btn-success btn-large active")
      $("#radio#{this.value}_2_3").attr("class", "btn btn-large")
    $("#radio#{i}_2_3").on 'click', ->
      $("#radio#{this.value}_2").val("3")
      $("#radio#{this.value}_2_0").attr("class", "btn btn-large")
      $("#radio#{this.value}_2_1").attr("class", "btn btn-large")
      $("#radio#{this.value}_2_2").attr("class", "btn btn-large")
      $("#radio#{this.value}_2_3").attr("class", "btn btn-success btn-large active")
