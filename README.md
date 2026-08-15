# elijahinfaversham.com ☢

Elijah's personal site — Chernobyl control-room theme. No build step, no dependencies.

## Files

- `index.html` — the site. Layout and styling only; it reads its words from `content.json`.
- `content.json` — everything editable: text, numbers, hobby cards, photo captions, contact details.
- `admin.html` — the editor. Open it at `/admin.html`, sign in, change things, press Publish.
- `CNAME` — tells GitHub Pages the custom domain is `elijahinfaversham.com`
- `photos/` — created automatically the first time a picture is uploaded.

## Editing the site

Go to **elijahinfaversham.com/admin.html**.

First visit asks for an access key from GitHub. To make one:

1. github.com → Settings → Developer settings → Personal access tokens → **Fine-grained tokens** → Generate new token
2. Name it something like `elijah site editor`
3. Set an expiry date (a new one is needed after it lapses)
4. Repository access: **Only select repositories** → `elijahinfaversham`
5. Permissions → Repository permissions → **Contents** → **Read and write**
6. Generate, copy, paste into the editor

The key is stored in that browser only. "Sign out" removes it. If it leaks, the worst anyone can do is edit this one website — delete the token on GitHub and make a new one.

Publishing commits straight to `main`. GitHub Pages rebuilds in roughly a minute.

### Photos

Drop pictures into the archive section. They're resized to 1400px on the longest side and saved as JPEG, so phone photos don't bloat the repository. Each one takes a name and a comment that appears underneath it on the site.

## Deploy on GitHub Pages

1. `index.html`, `content.json`, `admin.html` and `CNAME` on the `main` branch, repo root.
2. Repo **Settings → Pages** → Source: *Deploy from a branch* → Branch: `main` / `/ (root)` → Save.
3. Under **Custom domain**, enter `elijahinfaversham.com` and save.
4. Once DNS resolves and the certificate is issued, tick **Enforce HTTPS**.

## DNS (at Namecheap)

| Type  | Host | Value |
|-------|------|-------|
| A     | @    | 185.199.108.153 |
| A     | @    | 185.199.109.153 |
| A     | @    | 185.199.110.153 |
| A     | @    | 185.199.111.153 |
| CNAME | www  | stuart-ops.github.io. |

Delete any URL Redirect Record on `@` — Namecheap adds one by default and it conflicts with the A records.

## Notes

- The site respects `prefers-reduced-motion`: animations, particles and glitch effects switch off for anyone who has that set.
- Geiger-counter sound is off by default, toggled bottom-right.
- `admin.html` is publicly reachable but useless without a valid key. It carries `noindex` so search engines skip it.
- Content is fetched at page load, so the words are not in the initial HTML. Fine for a personal site; worth revisiting if search ranking ever matters.
