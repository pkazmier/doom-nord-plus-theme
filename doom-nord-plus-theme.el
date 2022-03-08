;;; doom-nord-plus-theme.el --- inspired by Nord -*- lexical-binding: t; no-byte-compile: t; -*-
(require 'doom-themes)

;;
(defgroup doom-nord-plus-theme nil
  "Options for the `doom-nord-plus' theme."
  :group 'doom-themes)

(defcustom doom-nord-plus-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-nord-plus-theme
  :type 'boolean)

(defcustom doom-nord-plus-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-nord-plus-theme
  :type 'boolean)

(defcustom doom-nord-plus-comment-bg doom-nord-plus-brighter-comments
  "If non-nil, comments will have a subtle, darker background. Enhancing their
legibility."
  :group 'doom-nord-plus-theme
  :type 'boolean)

(defcustom doom-nord-plus-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-nord-plus-theme
  :type '(choice integer boolean))

(defcustom doom-nord-plus-variable-font-weight 'light
  "If non-nil, weight used to style variable pitch headings."
  :group 'doom-nord-plus-theme
  :type 'symbol)

(defcustom doom-nord-plus-variable-font-height-multiplier 1.1
  "If non-nil, height multiplier used to style variable pitch headings."
  :group 'doom-nord-plus-theme
  :type 'float)

(eval-and-compile
  (defcustom doom-nord-plus-region-highlight t
    "Determines the selection highlight style. Can be 'frost, 'snowstorm or t
(default)."
    :group 'doom-nord-plus-theme
    :type 'symbol))

;;
(def-doom-theme doom-nord-plus
  "A dark theme inspired by Nord."

  ;; name        default   256       16
  ((bg         '("#2E3440" nil       nil            )) ;; Nord0
   (bg-alt     '("#272C36" nil       nil            ))
   (base0      '("#191C25" "black"   "black"        ))
   (base1      '("#242832" "#1e1e1e" "brightblack"  ))
   (base2      '("#2C333F" "#2e2e2e" "brightblack"  ))
   ;; (base3      '("#373E4C" "#262626" "brightblack"  ))
   (base3      '("#3B4252" "#262626" "brightblack"  )) ;; Nord1
   (base4      '("#434C5E" "#3f3f3f" "brightblack"  )) ;; Nord2
   (base5      '("#4C566A" "#525252" "brightblack"  )) ;; Nord3
   (base6      '("#9099AB" "#6b6b6b" "brightblack"  ))
   (base7      '("#D8DEE9" "#979797" "brightblack"  ))
   (base8      '("#F0F4FC" "#dfdfdf" "white"        ))
   (fg         '("#ECEFF4" "#ECECEC" "white"        ))
   (fg-alt     '("#E5E9F0" "#bfbfbf" "brightwhite"  ))

   (grey       base4)
   (red        '("#BF616A" "#ff6655" "red"          )) ;; Nord11
   (orange     '("#D08770" "#dd8844" "brightred"    )) ;; Nord12
   (green      '("#A3BE8C" "#99bb66" "green"        )) ;; Nord14
   (teal       '("#8FBCBB" "#44b9b1" "brightgreen"  )) ;; Nord7
   (yellow     '("#EBCB8B" "#ECBE7B" "yellow"       )) ;; Nord13
   (blue       '("#81A1C1" "#51afef" "brightblue"   )) ;; Nord9
   (dark-blue  '("#5E81AC" "#2257A0" "blue"         )) ;; Nord10
   (magenta    '("#B48EAD" "#c678dd" "magenta"      )) ;; Nord15
   (violet     '("#5D80AE" "#a9a1e1" "brightmagenta")) ;; ??
   (cyan       '("#88C0D0" "#46D9FF" "brightcyan"   )) ;; Nord8
   (dark-cyan  '("#507681" "#5699AF" "cyan"         )) ;; ??

   ;; face categories -- required for all themes
   (highlight      blue)
   (vertical-bar   base5)
   (selection      dark-blue)
   (builtin        blue)
   (comments       (if doom-nord-plus-brighter-comments dark-cyan (doom-lighten base5 0.2)))
   (doc-comments   (doom-lighten (if doom-nord-plus-brighter-comments dark-cyan base5) 0.25))
   (constants      teal)
   (functions      cyan)
   (keywords       blue)
   (methods        cyan)
   (operators      blue)
   (type           teal)
   (strings        green)
   (variables      base7)
   (numbers        magenta)
   (region         (pcase doom-nord-plus-region-highlight
                     (`frost teal)
                     (`snowstorm base7)
                     (_ base4)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)

   ;; custom categories
   (hidden     `(,(car bg) "black" "black"))
   (-modeline-bright doom-nord-plus-brighter-modeline)
   (-modeline-pad
    (when doom-nord-plus-padded-modeline
      (if (integerp doom-nord-plus-padded-modeline) doom-nord-plus-padded-modeline 4)))

   (region-fg
    (when (memq doom-nord-plus-region-highlight '(frost snowstorm))
      base0))

   (modeline-fg     nil)
   (modeline-fg-alt base6)

   ;; Active modeline background should be consistent regardless of solaire mode
   ;; or not, so it is easily identified as the active modeline.
   (modeline-bg  (if doom-nord-plus-brighter-modeline base4 base3))
   (modeline-bg-l (if doom-nord-plus-brighter-modeline base4 base3))

   ;; Inactive modeline background should match the background of window so
   ;; there is no noticeable modeline.
   (modeline-bg-inactive   (cons (car bg-alt) (cdr base2)))
   (modeline-bg-inactive-l (cons (car bg) (cdr base2))))

  ;;;; Base theme face overrides
  ((fringe :foreground teal)
   ((line-number &override) :foreground (doom-lighten 'base5 0.2))
   ((line-number-current-line &override) :foreground base7)
   ((font-lock-comment-face &override)
    :background (if doom-nord-plus-comment-bg (doom-lighten bg 0.05)))
   ((tab-line &override) :background modeline-bg :foreground blue)
   ((tab-line-tab-inactive &override) :foreground dark-blue)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if -modeline-bright base8 highlight))
   ((region &override) :foreground region-fg)

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if -modeline-bright modeline-bg highlight))
   (doom-modeline-project-root-dir :foreground base6)
   ;;;; ediff <built-in>
   (ediff-fine-diff-A    :background (doom-darken violet 0.4) :weight 'bold)
   (ediff-current-diff-A :background (doom-darken base0 0.25))
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; highlight-symbol
   (highlight-symbol-face :background (doom-lighten base4 0.1) :distant-foreground fg-alt)
   ;;;; highlight-thing
   (highlight-thing :background (doom-lighten base4 0.1) :distant-foreground fg-alt)
   ;;;; ivy
   ((ivy-current-match &override) :foreground region-fg :weight 'semi-bold)

   ;; helpful
   (helpful-heading :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.20) :weight doom-nord-plus-variable-font-weight :foreground cyan)

   ;; links & info
   (link-visited :foreground comments)
   (info-menu-star :foreground magenta)
   (info-menu-header :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.20) :weight doom-nord-plus-variable-font-weight :foreground cyan)
   (info-title-1 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.33) :weight doom-nord-plus-variable-font-weight :foreground dark-blue)
   (info-title-2 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.27) :weight doom-nord-plus-variable-font-weight :foreground blue)
   (info-title-3 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.21) :weight doom-nord-plus-variable-font-weight :foreground cyan)
   (info-title-4 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.15) :weight doom-nord-plus-variable-font-weight :foreground teal)

   ;;;; markdown-mode
   (markdown-list-face :foreground blue)
   (markdown-markup-face :foreground base5)
   (markdown-header-delimiter-face :inherit 'variable-pitch :foreground comments)
   (markdown-header-face-1 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.5) :weight doom-nord-plus-variable-font-weight :foreground dark-blue)
   (markdown-header-face-2 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.33) :weight doom-nord-plus-variable-font-weight :foreground blue)
   (markdown-header-face-3 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.27) :weight doom-nord-plus-variable-font-weight :foreground cyan)
   (markdown-header-face-4 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.21) :weight doom-nord-plus-variable-font-weight :foreground teal)
   (markdown-header-face-5 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.15) :weight doom-nord-plus-variable-font-weight :foreground magenta)
   (markdown-header-face-6 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.1)  :weight doom-nord-plus-variable-font-weight :foreground green)
   (markdown-header-face-7 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.0)  :weight doom-nord-plus-variable-font-weight :foreground yellow)
   (markdown-header-face-8 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.0)  :weight doom-nord-plus-variable-font-weight :foreground orange)
   ((markdown-code-face &override) :background base3)

   ;; mu4e
   (mu4e-highlight-face :foreground cyan :weight 'bold)
   (mu4e-unread-face :foreground blue :weight 'normal)
   (mu4e-replied-face :foreground teal :weight 'normal)
   (mu4e-header-face :foreground base7 :weight 'normal)
   (mu4e-header-highlight-face :background base4 :foreground cyan :weight 'normal)

   ;; org-mode
   (org-block                    :background base3 :extend t)
   (org-block-background         :background base3 :extend t)
   (org-meta-line                :inherit 'shadow)
   (org-block-begin-line         :foreground comments :background base3 :extend t)

   (org-document-info :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.0) :weight doom-nord-plus-variable-font-weight :foreground blue)
   (org-document-title :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.5) :weight doom-nord-plus-variable-font-weight :foreground blue)
   (org-level-1 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.33) :weight doom-nord-plus-variable-font-weight :foreground dark-blue)
   (org-level-2 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.27) :weight doom-nord-plus-variable-font-weight :foreground blue)
   (org-level-3 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.21) :weight doom-nord-plus-variable-font-weight :foreground cyan)
   (org-level-4 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.15) :weight doom-nord-plus-variable-font-weight :foreground teal)
   (org-level-5 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.1)  :weight doom-nord-plus-variable-font-weight :foreground magenta)
   (org-level-6 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.0)  :weight doom-nord-plus-variable-font-weight :foreground green)
   (org-level-7 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.0)  :weight doom-nord-plus-variable-font-weight :foreground yellow)
   (org-level-8 :inherit 'variable-pitch :height (* doom-nord-plus-variable-font-height-multiplier 1.0)  :weight doom-nord-plus-variable-font-weight :foreground orange)

   (+org-todo-project :inherit '(bold org-todo) :foreground teal)
   ;; (org-hide :foreground hidden)
   ;; (solaire-org-hide-face :foreground hidden-alt)

   ;; org-agenda
   (org-date :foreground base6)
   (org-agenda-structure :foreground highlight)
   (org-super-agenda-header :inherit 'variable-pitch :weight doom-nord-plus-variable-font-weight :height (* doom-nord-plus-variable-font-height-multiplier 1.2) :foreground teal)
   (org-agenda-date :foreground violet)
   (org-agenda-date-weekend :foreground magenta)
   (org-agenda-date-today :foreground base8 :underline t :weight 'bold)
   (org-scheduled :foreground comments)
   (org-scheduled-today :foreground fg)
   (org-warning :foreground cyan)
   (org-scheduled-previously :foreground cyan)
   (org-upcoming-deadline :foreground cyan)

   ;;;; mic-paren
   ((paren-face-match &override) :foreground bg :background teal :weight 'ultra-bold)
   ((paren-face-mismatch &override) :foreground base7 :background red :weight 'ultra-bold)
   ;;;; org <built-in>
   (org-hide :foreground hidden)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-l)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-l
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-l)))
   ;;;; vimish-fold
   ((vimish-fold-overlay &override) :inherit 'font-lock-comment-face :background base3 :weight 'light)
   ((vimish-fold-fringe &override)  :foreground teal))

  ;;;; Base theme variable overrides-
  ())

;;; doom-nord-plus-theme.el ends here
