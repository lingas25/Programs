
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

/*	Author's Blog: bdhacker.wordpress.com	*/
