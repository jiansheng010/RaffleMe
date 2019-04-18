// Logic for showing and hiding the create/join forms on the user dashboard
function userRoom() {
    // Hide both forms by default
    $('#join-create-form').hide()
    $('#user-create-room').hide()
    $('#user-join-room').hide()

    // Button listeners
    document.getElementById('user-create-show').addEventListener('click', showCreate);
    document.getElementById('user-join-show').addEventListener('click', showJoin);

    // Show the create form, hide the join form
    function showCreate() {
        $('#user-join-room').hide()
        $('#join-create-form').show()
        $('#user-create-room').show()
    }

    // Show the join form, hide the create form
    function showJoin() {
        $('#user-create-room').hide()
        $('#join-create-form').show()
        $('#user-join-room').show()
    }
}