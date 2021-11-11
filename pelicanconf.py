#!/usr/bin/env python
# -*- coding: utf-8 -*- #

AUTHOR = "P. Marchand"
SITENAME = "Science en jeux"
SITESUBTITLE = "Apprendre en jouant"
SITEURL = ""

PATH = "content"
#STATIC_PATHS = ["images", "extra","pdfs"]
#EXTRA_PATH_METADATA = {"extra/icone.ico": {"path": "icone.ico"}}
DIRECT_TEMPLATES = ["search", "index", "archives", "authors", "categories", "tags", "404"]
PAGINATED_TEMPLATES = {"archives": None, "tag": None, "category": None, "author": None}


STATIC_PATHS = ["images","pdfs","extra",'extra/CNAME']

EXTRA_PATH_METADATA = {'extra/CNAME': {'path': 'CNAME'}, "extra/icone.ico": {"path": "icone.ico"}}

TIMEZONE = "Europe/Paris"

DEFAULT_LANG = "fr"


#
# Plugins
#

PLUGIN_PATHS = ["plugins"]
PLUGINS = ["render_math", "tipue_search", "share_post"]

#
# Theme
#

THEME = "theme"

# Sidebar menu links
#   Entries can be one of:
#     direct-link: (<display text>, <link relative to root>)
#     submenu: (<display text>, (<direct-link>), [<direct-link>]...))

MENUITEMS = (
    ("Accueil", ""),
    ("Avis d'experts", "pages/avis"),
    ("2nde", "tag/2nde"),
    ("1ère","tag/1ere"),
    ("Tle","tag/tle"),
    ("Enseignement scientifique","tag/es"),
    ("Sites","pages/sites"),
    ("Conseils pratiques","pages/conseils"),
    # ("Modele de page", "modele"),
    # (
    #     "Pelican pages",
    #     (("Archive", "archives"), ("Authors", "authors"), ("Categories", "categories"), ("Tags", "tag/dolore")),
    # ),
    # ("You can add entries in your config file", "#"),
)


# Blogroll
LINKS = (
    ("Pelican", "https://getpelican.com/"),
    ("Python.org", "https://www.python.org/"),
    ("Jinja2", "https://palletsprojects.com/p/jinja/"),
    ("You can modify those links in your config file", "#"),
)

# Social widget
SOCIAL = (
    ("You can add links in your config file", "#"),
    ("Another social link", "#"),
)

DEFAULT_PAGINATION = 5

# Uncomment following line if you want document-relative URLs when developing
# RELATIVE_URLS = True
