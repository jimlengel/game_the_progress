// Creates a thing that is listening to this channel:
App.results = App.cable.subscriptions.create('ResultsChannel', {
  received: function(data) {
    console.log('received');
    $("#results").removeClass('hidden')
    console.log(data)
    return $('#results').append(this.renderResult(data));
    // return $('.notice').append(this.renderNotice(data)); // muted
  },

  renderResult: function(data) {
    console.log('result rendered');
    return "<span> <b>" + data.user + " answered: </b>" + data.answer + " for Question " + data.question + "</span><br/>";
  },

  // TODO: ajax this
  renderNotice: function(data) {
    console.log('notice rendered');
    return "<span>" + data.notice + "</span>";
  },

  renderStudentResults: function(data) {

  }
});
