scratch-off-poster
==================

### Inspired by the "100 Movies Bucket List" - a responsive grid of movie poster panels with sound effects.
Demo: https://www.weblabsperth.com.au/100-movies/

Requirements:
------------

* [Foundation 6](https://foundation.zurb.com/sites/docs/installation.html)
* PHP 5.6+ (tested on 7.x only), cURL extension
* [TMDB4PHP](https://github.com/kdallas/TMDB4PHP)
* [soundbox](https://github.com/sbrl/soundbox)

---

Recommended:
-----------
* [TMDB API](https://www.themoviedb.org/documentation/api) Key - used with **TMDB4PHP**
 
---

Foundation:
----------
Suggested install via **npm**.  The main **sass** file expects to find Foundation in:  
`../../node_modules/foundation-sites/`.

User/custom site styles go in: `css/_site.scss`, which is imported by: `css/foundation-main.scss`.  
The core `scss/foundation/*` files are also imported by: `css/foundation-main.scss`.

`foundation-main.scss` needs to be compiled into `css/site.min.css` -- and my apologies if that is confusing.


TMDB4PHP:
--------
Import the project from GitHub (using composer or clone/checkout) and ensure it resides under `./vendor/TMDB4PHP`.
Enter your API key into `MovieListSettings.php`, or configure your own `.env` if incorporating into a framework.

Note that at this stage of development, the TMDB API isn't required if you import the provided database (`data/sample_data_import.sql`), and only want to display the existing records.
The key is required if you want to query for new movie details or develop this out further with different movie (or TV show) lists.  I hacked together `update_details.php` for querying movie title & year, which will give you an idea of how to proceed.

soundbox:
--------
Follow the directions from GitHub to install under:  
`../../node_modules/sound-box/`.  
Copy `soundbox.min.js` to `js/`.

---

#### Thank you to the creators of included projects.  Credit is given at the top-right of the site.  I would appreciate it if forks kept this intact.
