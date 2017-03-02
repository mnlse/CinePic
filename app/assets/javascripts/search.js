var search = function() {
  var apiUrl = "/json/autocomplete_search";

  var el = {
    search: '#search-bar',
    allResultsCont: '.search-results',
    slideshowCtl: '.left, .right'
  };

  var cls = {
    resultCont: 'search-result',
    infoCont: 'sr-info',
    thumbnail: 'sr-cover',
    infoTitle: 'sr-title',
    infoYear: 'sr-year',
    infoCreator: 'sr-creator'
  };

  var results = [];

  var clear = function(what) {
    if(what === "results") {
      $(el.allResultsCont).empty();
    } else if(what === "input") {
      $(el.search).val("");
    } else {
      $(el.search).val("");
      $(el.allResultsCont).empty();
    }
  };

  var updateDom = function() {
    for (var i in results) {
      var elem = results[i];
      console.log(elem.thumbnail_url);
      var link = $('<a>');
      link.attr("href", elem.url);
      var finalElem = $('<div>').addClass(cls.resultCont);

      var thumbnail = $('<img>').addClass(cls.thumbnail);
      thumbnail.attr("src", elem.thumbnail_url);

      var infoCont = $('<div>').addClass(cls.infoCont);
      var infoTitle = $('<span>' + elem.title + '</span>').addClass(cls.infoTitle);
      var infoYear = $('<span>' + elem.year + '</span>').addClass(cls.infoYear);
      var infoCreator1 = $('<span>').addClass(cls.infoCreator);
      var infoCreator2 = $('<span>').addClass(cls.infoCreator);

      infoCont.append(infoTitle).append(infoYear).append(infoCreator1).append(infoCreator2);
      finalElem.append(thumbnail).append(infoCont);
      link.append(finalElem);

      $(el.allResultsCont).append(link);
    }
  };

  var queryApi = function(query) {
    console.log(query);
    var obj = {query: query};

    $.ajax({
      url: apiUrl,
      method: 'GET',
      data: obj,
      dataType: 'json',
      success: function(data) {
        console.log(data);
        results = data;
        clear("results");
        updateDom();
      }
    });
  };
  
  var listenToAction = function() {
    $(el.search).on("change paste keyup", function(e) {
      e.stopPropagation();
      if(e.target.value.trim() != "") {
        queryApi(e.target.value);
      } else {
        clear("results");
      }
      // console.log(e.target.value);
    });
    $(el.search).focusout(function(e) {
      results = [];
      clear();
    });
    /* 
    $(el.search).click(function(e) {
      e.stopPropagation();
    });
    */
    /* $('body').click(function() {
      clear();
    });
    $(el.slideshowCtl).click(function(e) {
      e.stopPropagation();
      clear();
    }); */
  };

  listenToAction();

};

$(document).ready(search);
$(document).on("page:load", search);
