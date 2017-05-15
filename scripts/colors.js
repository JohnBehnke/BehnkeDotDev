const colors = ['#d32f2f', '#c2185b', '#7b1fa2', '#512da8', '#303f9f', '#1976d2', '#0288d1', '#0097a7', '#00796b', '#388e3c', '#689f38', '#afb42b', '#fbc02d', '#ffa000',
    '#f57c00', '#e64a19', '#5d4037', '#616161', '#455a64'
];
var randomColor = Math.floor((Math.random() * colors.length));
document.getElementById('profile').style.border = '5px solid ' + colors[randomColor];
var time = (new Date()).getHours();
if (time > 6 && time < 20) {
    document.getElementById('dark').disabled = true;
    document.getElementById('light').disabled = false;
} else {
    document.getElementById('dark').disabled = false;
    document.getElementById('light').disabled = true;
}