<div class="register-modal">
    <div class="register-modal-container">
        <ul class="register-switcher">
            <li><a href="#">Sign in</a></li>
            <li><a href="#">New account</a></li>
        </ul>
        <div id="signin-window">
            <form class="register-form" action="/login" method="post">
                <p class="fieldset">
                    <label class="register-image register-email" for="signin-email"></label>
                    <input class="register-input " id="signin-email" name="username" type="email" placeholder="E-mail">
                    <span class="register-error-message">Error message here!</span>
                </p>
                <p class="fieldset">
                    <label class="register-image register-password" for="signin-password"></label>
                    <input class="register-input" id="signin-password" name="password" type="text"  placeholder="Password">
                    <a href="#0" class="hide-password">Hide</a>
                    <span class="register-error-message">Error message here!</span>
                </p>
                <p class="fieldset">
                    <input type="checkbox" id="remember-me" name="remember-me" checked>
                    <label class="label-remember-me"for="remember-me">Remember me</label>
                </p>
                <p class="fieldset">
                    <button class="register-input" type="submit">Login</button>
                </p>
                <p class="register-forgot-message">
                    <a href="#0">Forgot your password?</a>
                </p>
            </form>
        </div>
        <div id="signup-window">
            <form class="register-form" action="/registration" method="post">
                <p class="fieldset">
                    <label class="register-image register-username" for="signup-username"></label>
                    <input class="register-input " id="signup-username" name="name" type="text" placeholder="Username">
                    <span class="register-error-message">Error message here!</span>
                </p>
                <p class="fieldset">
                    <label class="register-image register-email" for="signup-email"></label>
                    <input class="register-input " id="signup-email" name="email" type="email" placeholder="E-mail">
                    <span class="register-error-message">Error message here!</span>
                </p>
                <p class="fieldset">
                    <label class="register-image register-password" for="signup-password"></label>
                    <input class="register-input " id="signup-password" name="password" type="text"  placeholder="Password">
                    <a href="#0" class="hide-password">Hide</a>
                    <span class="register-error-message">Error message here!</span>
                </p>
                <p class="fieldset">
                    <input type="checkbox" id="accept-terms">
                    <label class="label-agree" for="accept-terms">I agree to the <a class="register-terms" href="#">Terms</a></label>
                </p>
                <p class="fieldset">
                    <button class="register-input" type="submit">Create new account</button>
                </p>
            </form>
        </div>
        <div id="register-reset-password">
            <p class="register-form-message">Lost your password? Please enter your email address. You will receive a link to create a new password.</p>
            <form class="register-form">
                <p class="fieldset">
                    <label class="register-image register-email" for="reset-email"></label>
                    <input class="register-input " id="reset-email" type="email" placeholder="E-mail">
                    <span class="register-error-message">Error message here!</span>
                </p>
                <p class="fieldset">
                    <input class="register-input " type="submit" value="Reset password">
                </p>
            </form>
            <p class="register-forgot-message"><a href="#0">Back to log-in</a></p>
        </div>
        <a href="#" class="register-close">Close</a>
    </div>
</div>