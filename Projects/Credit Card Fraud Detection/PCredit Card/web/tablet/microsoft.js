
var country_arr = new Array("Surface", "Surface Pro");

var s_a = new Array();
s_a[0] = "";
s_a[1] = "16 GB|32 GB|64 GB";
s_a[2] = "16 GB|32 GB|64 GB|128 GB";

function print_model(country_id) {
    // given the id of the <select> tag as function argument, it inserts <option> tags
    var option_str = document.getElementById(country_id);
    var x, i = 0;
    for (x in country_arr) {
        option_str.options[i++] = new Option(country_arr[x], country_arr[x]);
    }
}

function print_storage(state_id, state_index) {
    var option_str = document.getElementById(state_id);
    option_str.length = 0;	// Fixed by Julian Woods
    var x, i = 0;
    state_index++;
    var state_arr = s_a[state_index].split("|");
    for (x in state_arr) {
        option_str.options[i++] = new Option(state_arr[x], state_arr[x]);
    }
}

function prices() {
    var x, from, to, time, f;
    f = document.getElementById('model');
    from = f.options[f.selectedIndex];
    f = document.getElementById('storage');
    to = f.options[f.selectedIndex];
    if (from.index == 0 && to.index == 0)
        x = 739.99;
    else if (from.index == 0 && to.index == 1)
        x = 759.99;
    else if (from.index == 0 && to.index == 2)
        x = 779.99;
    else if (from.index == 1 && to.index == 0)
        x = 749.99;
    else if (from.index == 1 && to.index == 1)
        x = 769.99;
    else if (from.index == 1 && to.index == 2)
        x = 789.99;
    else if (from.index == 1 && to.index == 3)
        x = 799.99;
    f = document.microsoft;
    f.price.value = x;
}

/*	Author's Blog: bdhacker.wordpress.com	*/
