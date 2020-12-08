<#import "security.ftl" as s>

<header>
    <div class="header-container">
        <nav id="navigation">
            <a href="/" class="logotype">Culinarum</a>
            <form class="search-form" action="/" method="get">
                <input class="search-input" type="search" name="search">
                <button class="search-button" type="submit">
                    <i class="fa fa-search"></i>
                </button>
            </form>
            <a aria-label="mobile menu" class="nav-toggle">
                <span></span>
                <span></span>
                <span></span>
            </a>
            <ul class="menu-left">
                <#if s.known>
                        <li><a href="/favorites">Избранное</a></li>
                        <li><a href="/logout">Выйти</a></li>
                    <#else>
                        <li><a class="sign-in" href="#">Войти</a></li>
                        <li><a class="sign-up" href="#">Регистрация</a></li>
                </#if>
                <li><a href="/moderation">Модерация</a></li>
            </ul>
        </nav>
    </div>
</header>