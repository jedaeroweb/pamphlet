(() => {
    'use strict'

    const getStoredTheme = () => localStorage.getItem('theme')
    const setStoredTheme = (theme) => localStorage.setItem('theme', theme)

    const getPreferredTheme = () => {
        const storedTheme = getStoredTheme()
        if (storedTheme) {
            return storedTheme
        }
        return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
    }

    const updateThemeIcon = (theme) => {
        const iconElement = document.querySelector('.current-theme-icon')
        if (!iconElement) return

        iconElement.innerHTML = document.querySelector('#theme-selector .dropdown-item[data-bs-theme-value="'+theme+'"] .icon')?.textContent.trim();
    }

    const setTheme = (theme) => {
        if (theme === 'auto') {
            const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches
            document.documentElement.setAttribute('data-bs-theme', prefersDark ? 'dark' : 'light')
        } else {
            document.documentElement.setAttribute('data-bs-theme', theme)
        }

        updateThemeIcon(theme)

        // Update active state in dropdown
        document.querySelectorAll('[data-bs-theme-value]').forEach(button => {
            button.classList.remove('active')
            if (button.getAttribute('data-bs-theme-value') === theme) {
                button.classList.add('active')
            }
        })
    }

    const initializeTheme = () => {
        // Set initial theme
        const theme = getPreferredTheme()
        setTheme(theme)

        // Add event listeners to buttons
        document.querySelectorAll('[data-bs-theme-value]').forEach(button => {
            button.addEventListener('click', () => {
                const theme = button.getAttribute('data-bs-theme-value')
                setStoredTheme(theme)
                setTheme(theme)
            })
        })
    }


    const setLanguage = (locale) => {
        // 언어 드롭다운의 active 처리
        document.querySelectorAll('#language-selector [data-bs-language-value]').forEach(button => {
            const value = button.getAttribute('data-bs-language-value')
            if (value === locale) {
                button.classList.add('active')
                button.setAttribute('aria-current', 'true')
            } else {
                button.classList.remove('active')
                button.removeAttribute('aria-current')
            }
        })
    }

    const initializeLanguageSelector = () => {
        const selector = document.querySelector('#language-selector')
        if (!selector) return

        // 초기 active 설정: <html lang="..."> 값을 우선 사용하고, 없으면 ko
        const initialLocale =
            (document.documentElement && document.documentElement.getAttribute('lang')) || 'ko'
        setLanguage(initialLocale)

        selector.querySelectorAll('[data-bs-language-value]').forEach(button => {
            button.addEventListener('click', (e) => {
                e.preventDefault()

                const locale = button.getAttribute('data-bs-language-value')
                if (!locale) return

                // 클릭 즉시 active 반영(이후 페이지 이동)
                setLanguage(locale)

                // root_path('/') 로 locale 파라미터를 붙여 이동
                const url = new URL('/', window.location.origin)
                url.searchParams.set('locale', locale)
                window.location.href = url.toString()
            })
        })
    }


    // Listen for system theme changes
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
        const storedTheme = getStoredTheme()
        if (storedTheme === 'auto') {
            setTheme('auto')
        }
    })

    // Initialize on first load
    initializeTheme();
    initializeLanguageSelector();

    // Initialize on Turbo Drive load
    document.addEventListener('turbo:load', initializeTheme);
    document.addEventListener('turbo:load', initializeLanguageSelector);
})()