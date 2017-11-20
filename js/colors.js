
document.getElementById('profile').style.border = '5px solid ' + randomColor();
var time = (new Date()).getHours();
if (false) {
    document.getElementById('dark').disabled = true;
    document.getElementById('light').disabled = false;
} else {
    document.getElementById('dark').disabled = false;
    document.getElementById('light').disabled = true;
}