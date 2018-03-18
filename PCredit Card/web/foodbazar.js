
function check(f) {
    if (f.firstname.value.length == 0) {
        alert("Enter the Firstname");
        f.firstname.focus();
        return false;
    }
    else if (f.lastname.value.length == 0) {
        alert("Enter the Lastname");
        f.lastname.focus();
        return false;
    }
    else if (f.add.value.length == 0) {
        alert("Enter the Address");
        f.add.focus();
        return false;
    }
    else if (f.email.value.length == 0) {
        alert("Enter the Email Id");
        f.email.focus();
        return false;
    }
    else if (f.mob.value.length == 0 || f.mob.value.length < 10) {
        alert("Enter the Mobile No");
        f.mob.focus();
        return false;
    }
    else if (f.age.value.length == 0) {
        alert("Enter the Age");
        f.age.focus();
        return false;
    }
    else if (f.d.value == 0 && f.m.value == 0) {
        alert("Enter the Date of Birth");
        f.d.focus();
        return false;
    }
    else if (f.gender.value == "0") {
        alert("Select the Gender");
        f.gender.focus();
        return false;
    }
    else if(f.rice.checked==false && f.dal.checked==false && f.wheat.checked==false && f.sugar.checked==false && f.salt.checked==false) {
        alert("Please Click on Some item");
        return false;
    }
    var email = document.getElementById('email');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!filter.test(email.value)) {
        alert('Please provide a valid email address');
        email.focus;
        return false;
    }
    return true;
}

function checkEmail() {

    var email = document.getElementById('email');
    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!filter.test(email.value)) {
        alert('Please provide a valid email address');
        email.focus;
        return false;
    }
    return true;
}

function start() {
    var f = document.foods;
    f.qrice.disabled = true;
    f.qdal.disabled = true;
    f.qwheat.disabled = true;
    f.qsugar.disabled = true;
    f.qsalt.disabled = true;
    f.rprice.value = "";
    f.dprice.value = "";
    f.wprice.value = "";
    f.sprice.value = "";
    f.saprice.value = "";
}

function funrice(fi) {
    var f = document.foods;
    if (fi.checked === true)
    {
        f.qrice.disabled = false;
        f.rprice.value = "1";
    }
    else
    {
        f.qrice.disabled = true;
        f.rprice.value = "";
    }

}

function funqrice() {
    var f = document.getElementById('qrice');
    qrice = f.options[f.selectedIndex];
    price = document.foods;
    if (qrice.index === 0)
        price.rprice.value = 1;
    else if (qrice.index === 1)
        price.rprice.value = 2;
    else if (qrice.index === 2)
        price.rprice.value = 3;
}

function fundal(fi) {
    var f = document.foods;
    if (fi.checked === true)
    {
        f.qdal.disabled = false;
        f.dprice.value = "1.5";
    }
    else
    {
        f.qdal.disabled = true;
        f.dprice.value = "";
    }
}

function funqdal() {
    var f = document.getElementById('qdal');
    qrice = f.options[f.selectedIndex];
    price = document.foods;
    if (qrice.index === 0)
        price.dprice.value = 1.5;
    else if (qrice.index === 1)
        price.dprice.value = 3;
    else if (qrice.index === 2)
        price.dprice.value = 4.5;
}

function funwheat(fi) {
    var f = document.foods;
    if (fi.checked === true)
    {
        f.qwheat.disabled = false;
        f.wprice.value = "1.5";
    }
    else
    {
        f.qwheat.disabled = true;
        f.wprice.value = "";
    }
}

function funqwheat() {
    var f = document.getElementById('qwheat');
    qrice = f.options[f.selectedIndex];
    price = document.foods;
    if (qrice.index === 0)
        price.wprice.value = 1.5;
    else if (qrice.index === 1)
        price.wprice.value = 3;
    else if (qrice.index === 2)
        price.wprice.value = 4.5;
}

function funsugar(fi) {
    var f = document.foods;
    if (fi.checked === true)
    {
        f.qsugar.disabled = false;
        f.sprice.value = "2";
    }
    else
    {
        f.qsugar.disabled = true;
        f.sprice.value = "";
    }
}

function funqsugar() {
    var f = document.getElementById('qsugar');
    qrice = f.options[f.selectedIndex];
    price = document.foods;
    if (qrice.index === 0)
        price.sprice.value = 2;
    else if (qrice.index === 1)
        price.sprice.value = 4;
    else if (qrice.index === 2)
        price.sprice.value = 6;
}

function funsalt(fi) {
    var f = document.foods;
    if (fi.checked === true)
    {
        f.qsalt.disabled = false;
        f.saprice.value = "0.5";
    }
    else
    {
        f.qsalt.disabled = true;
        f.saprice.value = "";
    }
}

function funqsalt() {
    var f = document.getElementById('qsalt');
    qrice = f.options[f.selectedIndex];
    price = document.foods;
    if (qrice.index === 0)
        price.saprice.value = 0.5;
    else if (qrice.index === 1)
        price.saprice.value = 1;
    else if (qrice.index === 2)
        price.saprice.value = 1.5;
}

/*	Author's Blog: bdhacker.wordpress.com	*/
