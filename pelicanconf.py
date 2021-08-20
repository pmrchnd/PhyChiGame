#!/usr/bin/env python
# -*- coding: utf-8 -*- #

AUTHOR = "P. Marchand"
SITENAME = "PhysicGames"
SITESUBTITLE = "A physics game website for teachers."
SITEURL = ""

PATH = "content"
STATIC_PATHS = ["images", "extra"]
EXTRA_PATH_METADATA = {"extra/favicon.ico": {"path": "favicon.ico"}}
DIRECT_TEMPLATES = ["search", "index", "archives", "authors", "categories", "tags", "404"]
PAGINATED_TEMPLATES = {"archives": None, "tag": None, "category": None, "author": None}


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
    ("Generic", "pages/generic"),
    ("2nde", "tag/super"),
    ("Theme elements", "elements"),
    (
        "Pelican pages",
        (("Archive", "archives"), ("Authors", "authors"), ("Categories", "categories"), ("Tags", "tag/dolore")),
    ),
    ("You can add entries in your config file", "#"),
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
