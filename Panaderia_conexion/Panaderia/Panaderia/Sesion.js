$(document).ready(function () {
    $('#loginForm').submit(function (event) {
        event.preventDefault();

        const username = $('#username').val().trim();
        const password = $('#password').val().trim();

        if (username === "" || password === "") {
            // Redirigir a Principal.html si los campos están vacíos
            window.location.href = 'Principal.html';
            return;
        }

        // Aquí puedes agregar la lógica para validar el inicio de sesión con el servidor
        // Esto es solo un ejemplo, deberías reemplazarlo con una llamada AJAX real
        const users = {
            admin: { username: 'Alex', password: '1234', role: 'admin' },
            vendedor: { username: 'Luis', password: '12345', role: 'vendedor' }
        };

        let user = null;

        if (username === users.admin.username && password === users.admin.password) {
            user = users.admin;
        } else if (username === users.vendedor.username && password === users.vendedor.password) {
            user = users.vendedor;
        }

        if (user) {
            // Almacenar el rol del usuario en el localStorage
            localStorage.setItem('userRole', user.role);

            // Redirigir a WebForm1.aspx
            window.location.href = 'WebForm1.aspx';
        } else {
            $('#loginError').show();
        }
    });
});
