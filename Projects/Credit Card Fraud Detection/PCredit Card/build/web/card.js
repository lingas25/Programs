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
    if (f.cardno.value === "5359380519012100" || f.cardno.value === "5359380519012104")
        document["cimage"].src = img1.src;
    else if (f.cardno.value === "5359380519012101" || f.cardno.value === "5359380519012105")
        document["cimage"].src = img2.src;
    else if (f.cardno.value === "5359380519012102" || f.cardno.value === "5359380519012106")
        document["cimage"].src = img3.src;
    else if (f.cardno.value === "5359380519012103" || f.cardno.value === "5359380519012107")
        document["cimage"].src = img4.src;
    else if (f.cardno.value >= "5359380519012000" && f.cardno.value <= "5359380519012025")
        document["cimage"].src = img1.src;
    else if (f.cardno.value >= "5359380519012026" && f.cardno.value <= "5359380519012050")
        document["cimage"].src = img2.src;
    else if (f.cardno.value >= "5359380519012051" && f.cardno.value <= "5359380519012075")
        document["cimage"].src = img3.src;
    else if (f.cardno.value >= "5359380519012076" && f.cardno.value <= "5359380519012200")
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
}