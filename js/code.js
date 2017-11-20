const code = [38, 38, 40, 40, 37, 39, 37, 39, 66, 65, 13];
var currentPosition = 0;
var audio = new Audio('assets/files/source.m4a');
var profileTimer;
function testForCode(e) {
    const keyPressed = e.keyCode
    if (code[currentPosition] == keyPressed) {
        if (currentPosition == code.length - 1) {
            document.getElementById('profile').src='assets/images/hey.gif';
            audio.play();
            currentPosition = 0;
            profileTimer = setTimeout("resetImage()",11000)
        }
        currentPosition += 1;
    }
    else if (keyPressed == 27) {
        audio.pause()
        audio.currentTime = 0;
        resetImage();
        currentPosition = 0
    } 
    else{
        currentPosition = 0;
    }
}
function resetImage(){
    clearInterval(profileTimer)
    document.getElementById('profile').src='assets/images/profile.png';
}
window.addEventListener('keydown', testForCode);

