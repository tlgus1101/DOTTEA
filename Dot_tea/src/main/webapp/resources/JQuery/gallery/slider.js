$('.slide_wrap').each(function(){
  $wrap = $(this).find('.slide_area'), 	// overflow box
  $ul = $(this).find('.slide_box'),	 	// slide ul
  $li = $(this).find('.slide_box li'), 	// slide li
  $liWidth = $li.width(), 		     	// li 하나의 Width
  $liLength = $li.length, 			 	// li 총 갯수
  $btnPrev = $(this).find('.btn_prev'),	// 이전 버튼
  $btnNext = $(this).find('.btn_next'),	// 다음 버튼
  $control = $(this).find('.indigator'),	// 인디게이터
  $page = $control.find('a'),				// 인디게이터 button
  $index = 0;
  $index1 =0 ;
  
  $control2 = $(this).find('.indigator2'),	// 인디게이터
  $page2 = $control2.find('a'),				// 인디게이터 button


  /* overflow box width값 지정 */
  $wrap.width($liWidth); 

  /* ul width값 지정 */
  $ul.width($liWidth*$liLength); 

  /* 자동재생 */
  $autoPlay = setInterval(function(){ auto() }, 2000);

  function auto() {
    if( $index < $liLength-1 ){
      $index++;      
    }else{
      $index=0;
    }

   // slideEvent();
  }

  /* 이벤트 초기화 */
  function stopPlay() {
    clearInterval( $autoPlay );
  }
  


  

  /* 슬라이드 이벤트 함수 */
  function slideEvent() {
	  
	  
    stopPlay(); // 애니메이션 시간 초기화
    $autoPlay = setInterval(function(){ auto() }, 3000); // 애니메이션 다시 시작

    $ul.stop().animate({left:-($liWidth*$index)}, 900, 'easeInOutExpo'); // ul 위치값 이동

    $control.children('li').removeClass('active'); 
    $control.children('li').eq($index).addClass('active');

   // var index1 = $index+1;
    ImageIndex($index+1);
    // alert($index+1);     
  }

  
  
  
  
  /* 인디게이터 클릭 이벤트 */
  $page.click(function() {
    $index = $(this).parent('li').index();

    slideEvent();    
    
  
    
   // ImageIndex();
    return false;
  });
 

  

  /*이미지클릭 이벤트 */
  $page2.click(function() {
	  
	
    $index = $(this).parent('li').index();

  /*  alert( $index );    */ 
    slideEvent();    
    
  //  alert('이미지 클릭 이벤트 ');
    
      
   // document.getElementById("imageIndex").value = $index;

    return false;
  });

  
  

  /* 이전 버튼 클릭 이벤트 */
  $btnPrev.click(function() {
    if( $index > 0 ){
      $index--;
    }else{
      $index=$liLength-1;
    }

    slideEvent();
 //   alert('이전 버튼 클릭 이벤트 ');   
  });

  /* 다음 버튼 클릭 이벤트 */
  $btnNext.click(function() {
    if( $index < $liLength-1 ){
      $index++;
    }else{
      $index=0;
    }

    slideEvent();
 //   alert('이전 버튼 클릭 이벤트 ');   
  });
});