$(document).on('turbolinks:load', function() {
  function formatExample(person) {
    var originalOption = $(person.element);
    return "   " + person.text;
  }
  $('select#template-example').select2({
    formatResult: formatExample,
    formatSelection: formatExample,
    escapeMarkup: function(m) { return m; }
  });

  $("#select_league, #select-box-season, #select-box-round").on("change", function() {
    var league = $("#select_league").val();
    var season = $("#select_season").val();
    var round = $("#select_round").val();
    $.ajax({
      url: "/matchs",
      data: {
        round: round,
        season: season,
        league: league
      }
    })
  });
});
