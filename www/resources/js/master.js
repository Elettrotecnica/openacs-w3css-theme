/* Display dropdown menus in the navbars when the menu buttons are clicked */
window.addEventListener('load', () => {
    for (const el of document.querySelectorAll('.oacs-navbar a.w3-button')) {
        const subMenu = el.nextElementSibling;
        if (!subMenu || !subMenu.matches('.w3-dropdown-content')) { continue; }
        el.addEventListener('click', function (evt) {
            evt.preventDefault();
            subMenu.classList.toggle('w3-show');
            for (const el of document.querySelectorAll('.w3-show')) {
                if (el === subMenu) { continue; }
                el.classList.remove('w3-show');
            }
        });
    }
});
/* Dismiss alerts upon clicking on the button */
window.addEventListener('load', () => {
    for (const el of document.querySelectorAll('#w3css-alert-message [data-bs-dismiss]')) {
        el.addEventListener('click', function (evt) {
            el.parentElement.remove();
        });
    }
});
/* Unclick every menu when we click somewhere else */
window.addEventListener('click', (e) => {
    if (e.target.closest('.w3-dropdown-click')) {
        return;
    }
    for (const el of document.querySelectorAll('.w3-show')) {
        el.classList.remove('w3-show');
    }
});

/* Ensure content is always kept top and right of the two sidebar,
 * regardless of current screen size */
function keepRightOfSideBar() {
    const nav = document.getElementById('oacs-navbar-large');
    if (!nav) { return; }
    document.getElementById('oacs-main').style.marginLeft = `${nav.offsetWidth}px`;
};
keepRightOfSideBar();
window.addEventListener('resize', keepRightOfSideBar);

function keepBelowTopBar() {
    const nav = document.getElementById('oacs-navbar-small');
    document.getElementById('oacs-main').style.marginTop = `${nav.offsetHeight}px`;
};
keepBelowTopBar();
window.addEventListener('resize', keepBelowTopBar);

if (window.YAHOO) {
    /*
     * Undo some global styling by YUI that would interfere with the
     * theme.
     */
    document.body.style.font = 'inherit !important';
    document.body.style.margin = 'inherit !important';
}
