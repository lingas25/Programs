function changeimage(f) {
    var f = document.creditcard;
    var img1 = new Image();
    img1.src = "images/visa.jpg";
    var img2 = new Image();
    img2.src = "images/mastercard.jpg";
    var img3 = new Image();
    img3.src = "images/american.jpg";
    var img4 = new Image();
    img4.src = "images/discover.jpg";
    if (f.cardno.value >= "5359380519012000" && f.cardno.value <= "5359380519012025")
        document["cimage"].src = img1.src;
    else if (f.cardno.value >= "5359380519012026" && f.cardno.value <= "5359380519012050")
        document["cimage"].src = img2.src;
    else if (f.cardno.value >= "5359380519012051" && f.cardno.value <= "5359380519012075")
        document["cimage"].src = img3.src;
    else if (f.cardno.value >= "5359380519012076" && f.cardno.value <= "5359380519012100")
        document["cimage"].src = img4.src;
}

function check(f) {
    if (f.cardno.value.length == 0) {
        alert("Enter the Card No");
        f.cardno.focus();
        return false;
    }
    else if (f.y.value == 0 && f.m.value == 0) {
        alert("Enter the Date of Birth");
        f.d.focus();
        return false;
    }
    else if (f.cname.value.length == 0) {
        alert("Enter the Name on Card");
        f.cname.focus();
        return false;
    }
    else if (f.cvvno.value.length == 0) {
        alert("Enter the CVV No");
        f.cvvno.focus();
        return false;
    }
else if (f.code.value.length == 0) {
        alert("Enter the Code");
        f.code.focus();
        return false;
    }
return true;
}