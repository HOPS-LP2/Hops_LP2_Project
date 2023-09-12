<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" href="../styles/general.css">
  <link rel="stylesheet" href="../styles/signup.css">

  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>

<body>
  <header>
    <div>
      <h1 style="margin-left: 3vw; font-size: 25px;">HOPS</h1>
    </div>
    <div class="quick-access">
      <img src="../public/icons/home-img.png" style="margin-left: 8vw;" class="representation-img" />
      <p style="margin-left: 1vw;">Home</p>
      <div class="line"></div>
      <img src="../public/icons/car-img.png" style="margin-left: 2vw; width: 90%;" class="representation-img">
      <p style="margin-left: 1vw;">Cars</p>
      <div class="line"></div>
      <img src="../public/icons/agencies-img.png" style="margin-left: 2vw;" class="representation-img">
      <p style="margin-left: 1vw;">Agencies</p>
    </div>
    <a href="login.html">
      <div class="login-access">
        <img src="../public/icons/user-img.png" style="margin-left: 48vw;" class="representation-img" />
        <p style="margin-left: 1vw;">Login</p>
      </div>
    </a>
  </header>

  <main>
    <div class="signup">
      <h2>Sign Up</h2>

      <form action="../signup" method="post" id="signup-form">
        <div class="input-field small">
          <label for="first-name">First name:</label>
          <input type="text" name="first-name" id="first-name">
        </div>

        <div class="input-field small">
          <label for="last-name">Last name:</label>
          <input type="text" name="last-name" id="last-name">
        </div>

        <div class="input-field large">
          <label for="email">Email:</label>
          <input type="text" name="email" id="email">
        </div>

        <div class="input-field large">
          <label for="ssn">Social Security Number (SSN):</label>
          <input type="text" name="ssn" id="ssn">
        </div>

        <div class="input-field large">
          <label for="phone-number">Phone Number:</label>
          <input type="tel" name="phone-number" id="phone-number" />
        </div>

        <div class="input-field small">
          <label for="password">Create password:</label>
          <input type="password" name="password" id="password">

          <div class="password-req">
            <p>Password must contain:<br>
              at least 8 characters; <br>
              at least one number; <br>
              at least one lowercase letter; <br>
              at least one uppercase letter;
            </p>
          </div>

          <div class="input-field small">
            <label for="confirm-password">Confirm password:</label>
            <input type="password" name="confirm-password" id="confirm-password">
          </div>

      </form>

      <p id="warning"></p>
      <button type="submit" class="large" form="signup-form">Confirm</button>

    </div>

  </main>


  <script src="../scripts/signup.js"></script>
</body>

</html>