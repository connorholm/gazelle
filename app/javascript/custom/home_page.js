(function() {
    var elements;
    var windowHeight;
  
    function init() {
      elements = document.querySelectorAll('.hidden');
      windowHeight = window.innerHeight;
    }
  
    function checkPosition() {
      for (var i = 0; i < elements.length; i++) {
        var element = elements[i];
        var positionFromTop = elements[i].getBoundingClientRect().top;
  
        if (positionFromTop - windowHeight <= 0) {
          if (element.classList.contains('hidden-typer')) {
            element.classList.remove('hidden');
            // wait 2 seconds before typing
            element.classList.add('typed-out')
          } else {
            element.classList.remove('hidden');
            element.classList.add('fade-in-element');
            
          }
          
        }
      }
    }
  
    window.addEventListener('scroll', checkPosition);
    window.addEventListener('resize', init);
  
    init();
    checkPosition();
  })();