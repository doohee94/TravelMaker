$(function() {
	
		
		// 페이스북 공유 버튼
		$("#shareBtn").click(function(){
	        window.open('http://www.facebook.com/sharer/sharer.php?u=http://localhost:8080/ProjectUIPractice/TravelSpotReview/reviewDetail.jsp')
	     });
		
		// 하트버튼 on off
		$(".emptyheart").click(function() {
			$(this).hide();
			$(".fullheart").show();
		});
		
		$(".fullheart").click(function() {
			$(this).hide();
			$(".emptyheart").show();
		});
	});
	
// 	리뷰입력창 유효성( 글자수 제한300자 )
	$(function() {

	    $('#reviewinputtextarea').on('keydown', function() {
	        if($(this).val().length > 300) {
	            $(this).val($(this).val().substring(0, 300));
	        }

	    });

	});
	
// 	리뷰 별점 입력
// 	$(function() {
// 		$( ".reviewinputdiv .reviewinput .starrating a" ).click(function() {
// 		     $(this).parent().children("a").removeClass("on");
// 		     $(this).addClass("on").prevAll("a").addClass("on");
// 		     return false;
// 		});
// 	});

// 리뷰 입력 현재시간 표시
	var NT_date = new Date();
	var nt_year = NT_date.getYear()+1900;//단순히 year를 받아오면 2016 기준으로 116이 리턴됨
	var nt_month = NT_date.getMonth()+1;//month는 0부터 시작함. 1월=0 10월=9
	var nt_day = NT_date.getDate(); //day는 현재 일자의 요일을 나타냄. 0=일요일 1=월요일
	var nt_hour = NT_date.getHours();
	var nt_min = NT_date.getMinutes();
	var nt_sec = NT_date.getSeconds();
	var time_str = nt_year+"."+nt_month+"."+nt_day+"-"+nt_hour+":"+nt_min+":"+nt_sec;
	
	$(function(){
		
		$("#NOW_TIME").val(time_str);
	
	});
	
	
// 버튼 유효성
	function check_onclick(){
	var theForm = document.reviewfrm;
	if(theForm.rvtext.value==""){
		alert("리뷰 내용을 입력해주세요.");
	}
	// 리뷰 입력창으로 포커스 이동.
	return theForm.rvtext.focus();	
	
	}
	
	// 별
	
	var __slice = [].slice;

(function($, window) {
  var Starrr;

  Starrr = (function() {
    Starrr.prototype.defaults = {
      rating: void 0,
      numStars: 5,
      change: function(e, value) {}
    };

    function Starrr($el, options) {
      var i, _, _ref,
        _this = this;

      this.options = $.extend({}, this.defaults, options);
      this.$el = $el;
      _ref = this.defaults;
      for (i in _ref) {
        _ = _ref[i];
        if (this.$el.data(i) != null) {
          this.options[i] = this.$el.data(i);
        }
      }
      this.createStars();
      this.syncRating();
      this.$el.on('mouseover.starrr', 'span', function(e) {
        return _this.syncRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('mouseout.starrr', function() {
        return _this.syncRating();
      });
      this.$el.on('click.starrr', 'span', function(e) {
        return _this.setRating(_this.$el.find('span').index(e.currentTarget) + 1);
      });
      this.$el.on('starrr:change', this.options.change);
    }

    Starrr.prototype.createStars = function() {
      var _i, _ref, _results;

      _results = [];
      for (_i = 1, _ref = this.options.numStars; 1 <= _ref ? _i <= _ref : _i >= _ref; 1 <= _ref ? _i++ : _i--) {
        _results.push(this.$el.append("<span class='glyphicon .glyphicon-star-empty'></span>"));
      }
      return _results;
    };

    Starrr.prototype.setRating = function(rating) {
      if (this.options.rating === rating) {
        rating = void 0;
      }
      this.options.rating = rating;
      this.syncRating();
      return this.$el.trigger('starrr:change', rating);
    };

    Starrr.prototype.syncRating = function(rating) {
      var i, _i, _j, _ref;

      rating || (rating = this.options.rating);
      if (rating) {
        for (i = _i = 0, _ref = rating - 1; 0 <= _ref ? _i <= _ref : _i >= _ref; i = 0 <= _ref ? ++_i : --_i) {
          this.$el.find('span').eq(i).removeClass('glyphicon-star-empty').addClass('glyphicon-star');
        }
      }
      if (rating && rating < 5) {
        for (i = _j = rating; rating <= 4 ? _j <= 4 : _j >= 4; i = rating <= 4 ? ++_j : --_j) {
          this.$el.find('span').eq(i).removeClass('glyphicon-star').addClass('glyphicon-star-empty');
        }
      }
      if (!rating) {
        return this.$el.find('span').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
      }
    };

    return Starrr;

  })();
  return $.fn.extend({
    starrr: function() {
      var args, option;

      option = arguments[0], args = 2 <= arguments.length ? __slice.call(arguments, 1) : [];
      return this.each(function() {
        var data;

        data = $(this).data('star-rating');
        if (!data) {
          $(this).data('star-rating', (data = new Starrr($(this), option)));
        }
        if (typeof option === 'string') {
          return data[option].apply(data, args);
        }
      });
    }
  });
})(window.jQuery, window);

$(function() {
	
  	return $(".starrr").starrr();
  
});


$( document ).ready(function() {
	      
	  $('#hearts').on('starrr:change', function(e, value){
	    $('#count').html(value);
	  });
	  
	  $('#hearts-existing').on('starrr:change', function(e, value){
	    $('#count-existing').val(value);
	  });
  
});














