# Start Page

A minimal, configurable browser start page. Serve the directory with any static file server and open in your browser.

## Quick Start

```sh
# Python
python3 -m http.server 8080

# Node
npx serve .

# Caddy
caddy file-server --listen :8080
```

Then open `http://localhost:8080`.

## Configs

Switch configs via the `?config=` query parameter. Available configs: `default`, `media`, `office`.

| URL | Description |
|-----|-------------|
| `http://localhost:8080` | Default config |
| `http://localhost:8080?config=media` | Media/streaming services |
| `http://localhost:8080?config=office` | Work bookmarks |

## Weather

Add `lat` and `lon` parameters to enable weather and forecast sections.

```
http://localhost:8080?config=default&lat=52.52&lon=13.41
http://localhost:8080?config=media&lat=48.85&lon=2.35
http://localhost:8080?config=office&lat=51.51&lon=-0.13
```

Weather data is fetched from [Open-Meteo](https://open-meteo.com/) (free, no API key required).

To find your coordinates: right-click any location on [Google Maps](https://maps.google.com) and copy the lat/lon from the popup.

## Config Format

Each config is a YAML file in `configs/`.

```yaml
background_image: "photo.jpg"   # local file or URL
timezone: "Europe/Berlin"        # IANA timezone, used for clock and forecast

sections:
  - clock
  - media
  - weather
  - forecast
  - bookmarks

bookmarks:
  - name: "Group Name"
    links:
      - title: "GitHub"
        url: "https://github.com"
```

### Sections

| Section | Description |
|---------|-------------|
| `clock` | Live clock and date |
| `media` | Streaming service shortcuts (YouTube, Netflix, Spotify, etc.) |
| `weather` | Current conditions — requires `lat`/`lon` URL params |
| `forecast` | 3-day forecast — requires `lat`/`lon` URL params |
| `bookmarks` | Bookmark groups defined in the config |

### Background Image

Can be a local file (placed in the project root) or a remote URL:

```yaml
background_image: "mybg.jpg"
background_image: "https://images.unsplash.com/photo-...?w=1920&q=80"
```
