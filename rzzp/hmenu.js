function highOnclick(elemId,classCur) {
    if (!document.getElementsByTagName) return false;
    if (!document.getElementById) return false;
    if (!document.getElementById(elemId)) return false;
    var elemId = document.getElementById(elemId);
    var links = elemId.getElementsByTagName("a");
    for (i = 0; i < links.length; i++) {
            links[i].onclick = function() {
                for (n = 0; n < links.length; n++) {
                    links[n].className = "";
                this.className = classCur;
                this.blur();
            }
        }
    }
}
window.onload=function highThis(){highOnclick("menulist","curmenu");}