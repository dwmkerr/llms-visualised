# LLMs Visualised

## Live Site
https://dwmkerr.github.io/llms-visualised/

## Writing Style

Follow the `dwmkerr-toolkit:writing-style` skill for all narrative text. Additional rules for this project:

- **Direct, not performative.** Don't end sections with grand rhetorical flourishes ("And machines can work with geometry." / "Similarity becomes distance."). State things plainly.
- **Questions over invitations.** Prefer "Where do we go from here?" over "Let's see how." -- the first is direct, the second is salesy.
- **No unnecessary numbers.** When describing scored words on a dimension, don't include the literal score in parentheses (e.g. "Dog scores highest" not "Dog scores highest (9)"). The visualization makes it obvious.
- **No em dashes.** Use a single hyphen `-` not `&mdash;` or `--` in HTML content. The writing style guide bans special characters not typeable on a standard keyboard.

## Branding

- "dwmkerr" links to https://dwmkerr.com
- "LLMs Visualised" title links to the GitHub repo
- GitHub icon links to the repo (not profile)
- Social links: LinkedIn, GitHub (repo), Substack
- Branding uses `.branding-row` wrapper + `.branding-title` below
- Colors: name `#666`, icons `#888`

## Publishing

- Only Chapter 1 is published (root `index.html`)
- Unpublished chapters live in `wip/`
- Last stage shows "Coming Soon" button (disabled) + Substack CTA
- When publishing a new chapter: move from `wip/` to root slug dir, update nav links, remove "Coming Soon" from previous chapter
