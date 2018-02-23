(setq personal-files
      '("~/Dropbox/org/personal.org" "~/Dropbox/org/church.org" "~/Dropbox/org/therapy.org"
        "~/Dropbox/org/school.org" "~/Dropbox/org/music.org" "~/Dropbox/org/outdoors.org"
        "~/Dropbox/org/cl.org" "~/Dropbox/org/garage.org" "~/Dropbox/org/hf.org"
        "~/Dropbox/org/art_room.org" "~/Dropbox/org/bathroom.org"
        "~/Dropbox/org/bottlelicious.org" "~/Dropbox/org/roster.org" "~/Dropbox/org/pomonafest.org"
        "~/Dropbox/org/f350.org" "~/Dropbox/org/pilot.org" "~/Dropbox/org/mazda3.org"
        "~/Dropbox/org/pontiac.org" "~/Dropbox/org/taxes.org" "~/Dropbox/org/xmas.org"
        "~/Dropbox/org/home_office.org"))

(setq work-files
      '("~/Dropbox/org/career.org" "~/Dropbox/org/home_office.org"))

(setq
 org-agenda-custom-commands
 (append
  org-agenda-custom-commands
  '(("w" "agenda view for work"
     ((agenda "")
      (alltodo ""))
     ((org-agenda-files work-files)))
    ("h" "agenda view for home"
     ((agenda "")
      (alltodo ""))
     ((org-agenda-files personal-files))))))
