<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login/Signup Website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background: linear-gradient(to bottom, #007BFF, #6610f2);
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .container {
            padding: 20px;
            background: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
            width: 300px;
            border-radius: 15px;
            animation: slideDown 1s ease-in-out, fadeIn 1s ease-in-out;
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
        }
        .title {
            position: absolute;
            top: 10px; /* Adjust this to move it down */
            left: 50%;
            transform: translateX(-50%);
            font-size: 20px;
            font-weight: bold;
            color: white;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
        }
        input[type="text"],
        input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s, transform 0.3s;
        }
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #007BFF;
            transform: scale(1.05);
        }
        button {
            padding: 10px 20px;
            color: #fff;
            background: linear-gradient(to right, #007BFF, #6610f2);
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: transform 0.3s, box-shadow 0.3s, background-color 0.3s;
        }
        button:hover {
            transform: scale(1.1);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
        }
        .logout {
            margin-top: 20px;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        @keyframes slideDown {
            from {
                transform: translateY(-20px);
            }
            to {
                transform: translateY(0);
            }
        }
        .link {
            margin-top: 15px;
            color: #007BFF;
            cursor: pointer;
            text-decoration: underline;
        }
        .link:hover {
            color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="title">Jerald made this</div>

    <div class="container" id="loginContainer">
        <h1>Login</h1>
        <form id="loginForm">
            <input type="text" id="loginUsername" placeholder="Username" required>
            <input type="password" id="loginPassword" placeholder="Password" required>
            <button type="submit">Login</button>
        </form>
        <p class="link" onclick="showSignup()">Don't have an account? Sign up</p>
    </div>

    <div class="container" id="signupContainer" style="display: none;">
        <h1>Sign Up</h1>
        <form id="signupForm">
            <input type="text" id="signupUsername" placeholder="Username" required>
            <input type="password" id="signupPassword" placeholder="Password" required>
            <button type="submit">Sign Up</button>
        </form>
        <p class="link" onclick="showLogin()">Already have an account? Log in</p>
    </div>

    <div class="container" id="logoutContainer" style="display: none;">
        <h1>Welcome, <span id="user"></span>!</h1>
        <button class="logout" onclick="logout()">Logout</button>
    </div>

    <script>
        const loginForm = document.getElementById('loginForm');
        const signupForm = document.getElementById('signupForm');
        const loginContainer = document.getElementById('loginContainer');
        const signupContainer = document.getElementById('signupContainer');
        const logoutContainer = document.getElementById('logoutContainer');
        const loginUsername = document.getElementById('loginUsername');
        const loginPassword = document.getElementById('loginPassword');
        const signupUsername = document.getElementById('signupUsername');
        const signupPassword = document.getElementById('signupPassword');
        const userDisplay = document.getElementById('user');

        function showSignup() {
            loginContainer.style.display = 'none';
            signupContainer.style.display = 'block';
        }

        function showLogin() {
            signupContainer.style.display = 'none';
            loginContainer.style.display = 'block';
        }

        signupForm.addEventListener('submit', function (e) {
            e.preventDefault();
            const username = signupUsername.value;
            const password = signupPassword.value;

            if (username && password) {
                const users = JSON.parse(localStorage.getItem('users')) || [];
                if (users.find(user => user.username === username)) {
                    alert('Ohh... Your name is not original freind... Haw about you choose a better name.');
                } else {
                    users.push({ username, password });
                    localStorage.setItem('users', JSON.stringify(users));
                    alert('All right your part of us now! You can now log in.');
                    showLogin();
                }
            }
        });

        loginForm.addEventListener('submit', function (e) {
            e.preventDefault();
            const username = loginUsername.value;
            const password = loginPassword.value;

            const users = JSON.parse(localStorage.getItem('users')) || [];
            const user = users.find(user => user.username === username && user.password === password);

            // Check if the special user "francesca" logs in
            if (username === 'francesca' && password === 'november08') {
                // Open a new tab with the custom message
                window.open('', '_blank').document.write('<h1>Omg our first BIG forehead user. Welcome!!</h1>');
            } else if (user) {
                userDisplay.textContent = username;
                loginContainer.style.display = 'none';
                logoutContainer.style.display = 'block';
            } else {
                alert('You stupid this is not the password you put last time.');
            }
        });

        function logout() {
            logoutContainer.style.display = 'none';
            loginContainer.style.display = 'block';
            loginUsername.value = '';
            loginPassword.value = '';
        }
    </script>
</body>
</html>
