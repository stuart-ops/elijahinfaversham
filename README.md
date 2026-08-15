# elijahinfaversham.com ☢

Elijah's personal site — Chernobyl control-room theme. No build step, no dependencies.

## Files

- `index.html` — the site. Layout only; it reads its words from `content.json`.
- `content.json` — everything editable: text, numbers, hobby cards, photo captions, contact details.
- `admin.html` — the editor, at `/admin.html`.
- `auth.json` — created automatically during setup. Holds the GitHub key, encrypted.
- `CNAME` — the custom domain.
- `photos/` — created automatically on first upload.

## Editing the site

Go to **elijahinfaversham.com/admin.html**, type the passphrase, edit, press Publish.

Works from any computer. Nothing to carry, nothing to install.

### First-time setup (once, by an adult)

The editor will show the setup screen because `auth.json` doesn't exist yet.

1. Have the fine-grained GitHub token ready — `elijahinfaversham` selected under repository access, and Contents set to Read and write (via **Add permissions** → search `Contents`).
2. Paste the token into the setup screen.
3. Press **Generate a passphrase** — six random words, far stronger than anything memorable you'd invent.
4. **Write it down somewhere safe.** It is stored nowhere and cannot be recovered.
5. Press **Seal the reactor**.

That commits `auth.json` to the repo, holding the token encrypted with the passphrase. After this the token is never needed again — only the phrase.

### If the passphrase is lost

Open `/admin.html`, click **Set up a new passphrase**, and redo setup with the GitHub token. The old `auth.json` is overwritten.

## How the lock works

The token is encrypted with AES-256-GCM. The key comes from the passphrase via PBKDF2-SHA256 at 600,000 iterations, which makes each guess deliberately slow.

`auth.json` is public — anyone can download it. Without the passphrase it is a block of noise, and at six generated words a brute-force attempt runs to tens of thousands of years. That safety depends entirely on using the generator rather than a chosen word: the editor refuses anything under 45 bits for that reason.

Worst case if the passphrase ever leaked: someone edits this one website. The token cannot touch any other repository or account, and every change is reversible from git history.

## Deploy on GitHub Pages

1. `index.html`, `content.json`, `admin.html`, `CNAME` on `main`, repo root.
2. **Settings → Pages** → Deploy from a branch → `main` / `/ (root)`.
3. Custom domain: `elijahinfaversham.com`.
4. Tick **Enforce HTTPS** once the certificate is issued.

The repository must stay **public** — GitHub Pages does not serve private repos on the free plan.

## DNS (Namecheap)

| Type  | Host | Value |
|-------|------|-------|
| A     | @    | 185.199.108.153 |
| A     | @    | 185.199.109.153 |
| A     | @    | 185.199.110.153 |
| A     | @    | 185.199.111.153 |
| CNAME | www  | stuart-ops.github.io. |

Delete any URL Redirect Record on `@` — Namecheap adds one by default and it conflicts.

## Notes

- Photos are resized to 1400px and re-encoded as JPEG before upload, so phone pictures don't bloat the repo.
- The site respects `prefers-reduced-motion`; the boot sequence and animations switch off.
- `admin.html` carries `noindex` so search engines skip it.
