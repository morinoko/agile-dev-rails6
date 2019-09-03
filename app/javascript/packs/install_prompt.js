var deferredPrompt;

window.addEventListener('beforeinstallprompt', (event) => {
  event.preventDefault();

  deferredPrompt = event;

  console.log("prompt");

  showAddToHomeScreen();
});

function showAddToHomeScreen() {
  var a2hsBtn = document.querySelector(".a2hs-prompt");

  a2hsBtn.style.display = "block";

  a2hsBtn.addEventListener("click", addToHomeScreen);
}

function addToHomeScreen() {
  this.style.display = 'none';
  deferredPrompt.prompt();

  deferredPrompt.userChoice
    .then((choiceResult) => {
      if (choiceResult.outcome === 'accepted') {
        console.log('A2HS prompt accepted');
      } else {
        console.log('A2HS prompt dismissed');
      }
      deferredPrompt = null;
    });
}