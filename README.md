# doom-nord-plus-theme
My custom version of the doom-nord theme.

## Installation
Copy the `doom-nord-plus-theme.el` and `nord-winter.png` file into your
`$HOME/.doom.d/themes` directory.  Add the following lines to your
`~/.doom.d/config.el`:

```elisp
;; If you like the font in the screenshots, add these settings
(setq doom-font (font-spec :family "M PLUS Code Latin" :size 16)
      doom-big-font (font-spec :family "M PLUS Code Latin" :size 18)
      doom-variable-pitch-font (font-spec :family "M PLUS 2" :size 14)
      doom-font-increment 1)

;; Theme settings
(setq doom-theme 'doom-nord-plus
      fancy-splash-image (concat doom-private-dir "themes/nord-winter.png"))

```

## Screenshots
Below are a handful of screenshots with the modes I use most. The font used in
the screenshots is [M PLUS Code](https://fonts.google.com/specimen/M+PLUS+Code+Latin?query=Coji+Morishita)--my
new favorite font.

### Agenda
![Agenda](https://github.com/pkazmier/doom-nord-plus-theme/blob/main/screenshots/agenda.png?raw=true)

### Elisp
![Elisp](https://github.com/pkazmier/doom-nord-plus-theme/blob/main/screenshots/elisp.png?raw=true)

### OrgMode
![OrgMode](https://github.com/pkazmier/doom-nord-plus-theme/blob/main/screenshots/orgmode.png?raw=true)

### Python
![Python](https://github.com/pkazmier/doom-nord-plus-theme/blob/main/screenshots/python.png?raw=true)

### Rust
![Rust](https://github.com/pkazmier/doom-nord-plus-theme/blob/main/screenshots/rust.png?raw=true)

### GoLang
![GoLang](https://github.com/pkazmier/doom-nord-plus-theme/blob/main/screenshots/golang.png?raw=true)


