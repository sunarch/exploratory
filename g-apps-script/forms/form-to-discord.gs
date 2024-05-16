function sendFormDataToDiscord(e) {

  var items = e.response.getItemResponses();

  var data = {
    'embeds': [
      {
        'title': 'MESSAGE TITLE',
        'type': 'rich',
        'timestamp': new Date(),
        'color': 65280,
        'fields': []
      }
    ]
  };

  for (i in items) {
    data['embeds'][0]['fields'].push({
      'name': `[${i}] ${items[i].getItem().getTitle()}`,
      'value': `${items[i].getResponse()}`,
      'inline': false
    })
  };

  // Send request

  var options = {
    'method' : 'post',
    // 'multipart/form-data' or 'application/x-www-form-urlencoded' default for JS objects
    'contentType': 'application/json; charset=utf-8',
    'payload' : JSON.stringify(data)
  };

  var response = UrlFetchApp.fetch('https://discord.com/api/webhooks/WEBHOOK_URL_END', options);

}
