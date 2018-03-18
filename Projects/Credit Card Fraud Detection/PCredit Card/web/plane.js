
var country_arr = new Array("London", "Manchester", "Birmingham", "Norwich", "Liverpool", "Edinburgh");

var s_a = new Array();
s_a[0] = "";
s_a[1] = "2:00-4:00|10:00-14:30|18:30-20:30";
s_a[2] = "3:00-5:30|11:00-13:30|17:30-21:00";
s_a[3] = "1:30-3:30|9:45-13:15|19:30-21:30";
s_a[4] = "3:15-5:45|11:45-14:15|17:15-20:45";
s_a[5] = "14:45-17:45|19:30-21:30|23:00-1:00";
s_a[6] = "12:45-15:45|18:30-20:30|23:15-1:30";

function print_to(country_id) {
    // given the id of the <select> tag as function argument, it inserts <option> tags
    var option_str = document.getElementById(country_id);
    var x, i = 0;
    for (x in country_arr) {
        option_str.options[i++] = new Option(country_arr[x], country_arr[x]);
    }
}

function print_time(state_id, state_index) {
    var option_str = document.getElementById(state_id);
    option_str.length = 0;	// Fixed by Julian Woods
    var x, i = 0;
    state_index++;
    var state_arr = s_a[state_index].split("|");
    for (x in state_arr) {
        option_str.options[i++] = new Option(state_arr[x], state_arr[x]);
    }
}

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

function prices(fi) {
    var x, from, to, time, f;
    f = document.getElementById('from');
    from = f.options[f.selectedIndex];
    f = document.getElementById('to');
    to = f.options[f.selectedIndex];
    f = document.getElementById('time');
    time = f.options[f.selectedIndex];
    if (from.index == 0 && to.index == 1)
        x = 150;
    else if (from.index == 0 && to.index == 2)
        x = 140;
    else if (from.index == 0 && to.index == 3)
        x = 130;
    else if (from.index == 0 && to.index == 4)
        x = 133;
    else if (from.index == 0 && to.index == 5)
        x = 135;
    else if (from.index == 1 && to.index == 0)
        x = 125;
    else if (from.index == 1 && to.index == 2)
        x = 122;
    else if (from.index == 1 && to.index == 3)
        x = 121;
    else if (from.index == 1 && to.index == 4)
        x = 127;
    else if (from.index == 1 && to.index == 5)
        x = 128;
    else if (from.index == 2 && to.index == 0)
        x = 129;
    else if (from.index == 2 && to.index == 1)
        x = 136;
    else if (from.index == 2 && to.index == 3)
        x = 134;
    else if (from.index == 2 && to.index == 4)
        x = 133;
    else if (from.index == 2 && to.index == 5)
        x = 134;
    else if (from.index == 3 && to.index == 0)
        x = 136.5;
    else if (from.index == 3 && to.index == 1)
        x = 146;
    else if (from.index == 3 && to.index == 2)
        x = 142;
    else if (from.index == 3 && to.index == 4)
        x = 139.5;
    else if (from.index == 3 && to.index == 5)
        x = 135.6;
    else if (from.index == 4 && to.index == 0)
        x = 129;
    else if (from.index == 4 && to.index == 1)
        x = 128;
    else if (from.index == 4 && to.index == 2)
        x = 127.5;
    else if (from.index == 4 && to.index == 3)
        x = 134;
    else if (from.index == 4 && to.index == 5)
        x = 132;
    else if (from.index == 5 && to.index == 0)
        x = 136;
    else if (from.index == 5 && to.index == 1)
        x = 152;
    else if (from.index == 5 && to.index == 2)
        x = 146;
    else if (from.index == 5 && to.index == 3)
        x = 148;
    else if (from.index == 5 && to.index == 4)
        x = 151;
    else
        alert("Both Source and Destination are Same");
    if (time.index == 0)
        x = x + 2.5;
    else if (time.index == 1)
        x = x + 5;
    else if (time.index == 2)
        x = x + 7.5;
    f = document.planes;
    f.price.value = x;
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
