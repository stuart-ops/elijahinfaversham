# elijahinfaversham.com ☢

Elijah's personal site — Chernobyl control-room theme. One self-contained `index.html`, no build step, no dependencies.

## Files

- `index.html` — the whole site (HTML + CSS + JS in one file)
- `CNAME` — tells GitHub Pages the custom domain is `elijahinfaversham.com`

## Deploy on GitHub Pages

1. Make sure `index.html` and `CNAME` are on the `main` branch (root of the repo).
2. Repo **Settings → Pages** → Source: *Deploy from a branch* → Branch: `main` / `/ (root)` → Save.
3. Under **Custom domain**, enter `elijahinfaversham.com` and save.
4. Once DNS is set up (below) and the certificate is issued, tick **Enforce HTTPS**.

## DNS (at your registrar)

| Type  | Name | Value |
|-------|------|-------|
| A     | @    | 185.199.108.153 |
| A     | @    | 185.199.109.153 |
| A     | @    | 185.199.110.153 |
| A     | @    | 185.199.111.153 |
| CNAME | www  | stuart-ops.github.io |

If using Cloudflare, set these records to **DNS only** (grey cloud), at least until HTTPS is working.

DNS can take a few minutes to a few hours to propagate. GitHub then issues the HTTPS certificate automatically.

## Editing the content

All placeholder content is marked with `EDIT ME` comments in `index.html`:

- **Control Room** — the about text
- **Stats** — the three counters (change the `data-count` numbers and labels)
- **Experiments** — the four hobby cards
- **Specimen Archive** — replace the placeholder tiles with real photos, e.g. `<div class="specimen"><img src="photos/photo1.jpg" alt="..."></div>` (add the photos to a `photos/` folder in the repo)
- **Transmit** — the contact email (currently `hello@elijahinfaversham.com`)

The site respects `prefers-reduced-motion` — animations, particles, and glitch effects switch off automatically for users who have that set. Geiger-counter sound is off by default and toggled with the button in the bottom-right corner.
