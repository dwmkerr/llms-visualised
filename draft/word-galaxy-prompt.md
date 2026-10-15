# Word Galaxy: one-shot prompt

The prompt below should recreate `word-galaxy.html` in one shot. It is the distilled result of six feedback rounds (33 prototypes) on the original concept. Give it to a capable model along with the request "build this as a single self-contained HTML file".

---

Build a single self-contained HTML page: an animated explainer called "How context picks a meaning". It teaches a non-technical reader how a language model uses context to resolve an ambiguous word. No build step, no external assets except three.js r128 UMD from cdnjs via a classic script tag (must work from file://). Degrade gracefully to a static layout if WebGL is unavailable.

## The concept

A sentence with an ambiguous word is processed one word at a time. The word "free" could mean liberty or no cost; attention to earlier words settles it. Behind everything floats a galaxy of words: the model's word space. As each word is processed, the model's weights fire and light up the region of word space related to that word, and that region swings overhead so you can read it.

## Layout, top to bottom, centred column

1. Title: "How context picks a meaning". Subtitle: 'The word "free" could mean liberty or no cost. Attention to earlier words settles it.'
2. The input sentence as bordered word chips, read left to right: `The prisoner was finally set free`.
3. THE MODEL: a fixed-width rounded card, opaque paper background, two-line heading (title "THE MODEL", subtitle "a large language model"). Inside: a matrix of small blue dots (the weights), then a "CONTEXT" subtitle with accumulated word chips that wrap over multiple lines. The card never widens.
4. The generated continuation, word by word, below the card: `after ten years inside.`
5. A transport bar: solid dark icon buttons (back to start, step back, play/pause toggle, step forward) around one small clickable dot per step (filled = current). No word-labelled buttons. Aria-labels on all buttons.
6. A one-line caption legend (see accuracy).

## The galaxy

- three.js point cloud plus a few hundred readable word sprites (canvas texture atlas), roughly 5000-6000 dots.
- A 3D sphere of words whose CENTRE sits directly behind the model card: densest in the middle, thinning radially in all three axes. No masked hole over the diagram; legibility comes from core dots being individually tiny and faint (density carries the read), and the model card being opaque. Readable word sprites avoid sitting directly over text.
- Slow continuous tumble plus gentle pointer parallax.
- Every input word AND generated word owns a small semantic cluster in the galaxy (e.g. prisoner: jail, cell, guard...; finally: at last, eventually...; free: a liberty cluster AND a separate price cluster: gratis, discount, no-cost...).

## Each step (one word consumed or generated)

Staggered causal chain, phases ~200-400ms apart, readable in order:

1. The word's chip highlights (green tint and border).
2. Green attention arrows curve BACKWARDS ONLY to earlier sentence words. Never forward.
3. A seeded random subset of the blue weights dots lights and sparkles (per-dot twinkle, alpha and slight size pulse). NO travelling wave across the matrix; the weights are completely dormant between steps (no idle shimmer).
4. The galaxy spins so the word's cluster swings ABOVE the sentence, lighting green; faint blue lines reach from the lit weight cells up into that cluster (the weights trigger the region of word space).
5. A few faint lines interconnect the lit cluster words, and faint green lines tie them back to the origin word.
6. The word joins the CONTEXT row as a chip, flashing blue on arrival.

The money shot: on "free", attention arrows point back to "prisoner" and "set", the LIBERTY cluster swings overhead and lights strongly, and the price cluster stays off to the side, dim. Generation then continues below the card word by word ("after", "ten", "years", "inside."), each generated word firing the same chain and joining the context.

## Interaction

- Play/pause runs the timeline (~1.5-2s per step); step forward/back move one step; back-to-start resets; dots jump to any step. Every control rebuilds full state (sentence highlights, context chips, generated words, galaxy, weights) for the target step.
- Hovering ANY sentence word, processed or not, replays that word's full step choreography as a preview; a future word's arrows render ghosted/dashed. Mouse out restores the real current state. Pointer devices only.
- `prefers-reduced-motion`: render a static final-state frame per step, no animation.

## Style

- Paper palette: `--bg:#faf9f6; --ink:#24292f; --muted:#6e7681; --faint:#d8d5cd`. Green `#1a7f37` for attention and lit clusters. Blue `#0969da` for weights and context flashes. Mono font (ui-monospace/SF Mono/Menlo) for words and chips, system sans for copy.
- All buttons solid dark fill with light glyphs; subtle press states.

## Accuracy rules (hard constraints)

- Attention is backwards only; never draw a forward arrow.
- No claims about speed or timing of inference.
- Any strengths/scores shown are labelled illustrative.
- Words stand in for tokens; caption may say so.
- Caption text: green arrows show attention to earlier words only; blue is the model's weights firing, the parameters that touch each word light a region of word space; the field behind is a slice of the space of words the model knows; hover any word to see its step.
- No em dashes anywhere in the copy.

---

## Provenance

Final file is round-6 iteration `za02-transport-bold`, built on a lineage of winners: v06 (parallax depth) -> w10 (three.js maximal) -> x01 (core galaxy) -> y01 (causal chain + scrubber) -> z02 (solid box, dense centre, no idle shimmer) -> za02 (transport bar, hover all words, sparkle-only weights). Source briefs live in `dwmkerr.com/scratch/jev-explainer/galaxy/`.
