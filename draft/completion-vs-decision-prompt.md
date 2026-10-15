# Completion vs decision: one-shot prompt

The prompt below should recreate `completion-vs-decision.html` in one shot. It is the distilled result of three feedback rounds (brief 7, 7b, 7c) on the original concept. Give it to a capable model along with the request "build this as a single self-contained HTML file". Companion to `word-galaxy.html`; shares its visual language.

---

Build a single self-contained HTML page: an animated explainer called "One answer at a time, or all at once". It shows a non-technical reader the difference between coaxing a completion LLM into a decision and asking a purpose-built decision model. No build step, no external dependencies at all, must work from file://.

## The concept

Same data, two packagings, two output behaviours. The left side is a completion model given a prose prompt; it types its JSON answer character by character, and every character is another full pass through the weights. The right side is a decision model given a typed request; its weights fire once and the whole answer stamps in at once, all questions scored together (fan-out). The typewriter versus the stamp is the architecture, not theatre. Both sides reach the same verdicts: the contrast is delivery, not quality.

## Layout, top to bottom, centred column

1. Title: "One answer at a time, or all at once". Subtitle: "Two ways to get a judgement from a model. Same input, same question; what differs is how the answer comes out."
2. Two columns in one grid so every row lines up across both sides: input card, model box, output card, counter row. Columns stack on narrow screens, left story first.
3. Input cards, mono, both show the FULL input. Left label "INPUT · PROSE PROMPT", right label "INPUT · TYPED REQUEST" (blue). Same facts, roughly aligned:
   - Left (prose with JSON-ish bits): today's scam patterns (safe account calls; private car sales...); flagged payees QuickCoin Ltd, J. Marku; "Rank each transaction as safe, low or high risk."; "Reply ONLY with JSON: {"txn_1": {"choice": ...}, ...}"; three numbered transactions: £14,900 to "Quick Coin Limited", new payee, 23:40...; £42 to "Tesco", regular payee, "weekly shop"; £880 refund from "GymFlex", known payee.
   - Right (JSON): state with scam_patterns and flagged_payees; questions txn_1..3 each with type choice, criteria safe/low/high, and an instructions string carrying the same transaction text. Use `...` ellipses wherever detail would add noise.
4. Model boxes in the word-galaxy style: rounded paper card, two-line heading, blue weights-dot matrix inside. Left: "COMPLETION MODEL / a large language model". Right: "DECISION MODEL / e.g. Jev, a System 1 model". Weights dormant until running; sparkle only, no travelling wave.
5. Output cards, mono JSON.
   - Left: types character by character at a brisk clip (roughly 25-40 chars/s, slight per-character jitter), three blocks sequentially, one per call: txn_1 "high", txn_2 "safe", txn_3 "safe". Caret visible while typing. Weights sparkle for the entire duration of typing and track typing activity; brief pause between blocks (new call). After the third block the model keeps going with a red coda line in prose ("Not all of these are safe - and not for the reason you might expect. Would you like me to explain more?"): the completion model does not know when to stop.
   - Right: after one sparkle burst (~400-600ms), the full answers object appears in ONE frame, all three answers, each with a probability (e.g. txn_1 high 0.80, txn_2 safe 0.93, txn_3 safe 0.88) drawn as a small proportion box behind the digits. One subtle stamp animation (scale 1.03 to 1, one-frame flash), no per-character reveal.
6. Counter row under each side, mono, counting up live. Left: `passes: ~N · output tokens: ~N` (one per output character). Right: `passes: 1 · output tokens: 0 (scores, not text)`. Counts labelled approximate. NO milliseconds, NO cost figures.
7. Verdict caption under the columns, fades in at the end: "Both catch Quick Coin Limited: a fuzzy match to yesterday's flagged QuickCoin Ltd. The difference is not the judgement, it is how it is delivered." (second sentence green).
8. Transport bar in the word-galaxy style: solid dark icon buttons, back to start, play/pause toggle, one small clickable dot per step (filled = current), step forward. Aria-labels on all buttons.
9. Footer legend: blue dots are the model's weights firing; on the left every output character is another full pass through the weights, one call per question; on the right one pass scores every question at once (fan-out) and the verdicts are read straight from typed outputs, no text generated; counts are approximate; words stand in for tokens.

## Same data, two packagings (the input cards)

Make it unmistakable that the two inputs are the SAME DATA, differently structured:

1. Ink vs scaffold. Shared data substrings are rendered verbatim identical on both sides in full ink. Everything else is faint: on the left the prose glue ("Today's scam patterns:", "Flagged payees:", list numbers), on the right the JSON scaffolding (braces, quotes, keys, commas).
2. Strict row pairing. Both cards are the same logical rows at the same y positions: state / flagged payees / question-criteria / txn 1 / txn 2 / txn 3. Fixed row heights so twins share a vertical band.
3. Row-top alignment. The left card starts with one blank line so the right's faint opening scaffold line pairs with whitespace, and every later row lines up exactly.
4. Hover twin-highlight (pointer-fine only). Hovering a row on either side tints both twins softly (paper-blue) and dims the other rows; mouse out restores. No layout shift.
5. The unpaired row. The left's "Reply ONLY with JSON: {...}" line has no counterpart; its right-hand slot holds a faint italic ghost note `(not needed: output is typed)`. Hovering the left row highlights the ghost note. That one row with no twin IS the difference.

The QuickCoin Ltd / Quick Coin Limited near-miss is green on both sides, in both inputs and in the caption.

## Playback

Play runs both sides together from the same moment: the right side finishes almost immediately, then holds while the left keeps typing. That contrast is the money shot. Step dots jump to phase boundaries (idle, running, right stamped, left done). Back to start resets everything. `prefers-reduced-motion`: render both final states instantly.

## Style

Exactly the word-galaxy language: paper palette (`--bg:#faf9f6; --ink:#24292f; --muted:#6e7681; --faint:#d8d5cd`), green `#1a7f37` for near-miss and verdict accents, blue `#0969da` for weights and typed-request accents, red `#cf222e` for the coda only. Mono (ui-monospace/SF Mono/Menlo) for chips and JSON, system sans for copy. All buttons solid dark fill with light glyphs. No galaxy on this page.

## Accuracy rules (hard constraints)

- No millisecond or price claims anywhere on the page.
- Pass/token counts labelled approximate ("~", "one per output token").
- Both sides reach the same verdicts.
- The left side is not mocked: a capable model doing an unnatural job. Neutral tone.
- Words stand in for tokens where relevant. No em dashes anywhere in the copy.

---

## Provenance

Final file is round-7c iteration `sb02` (bolder choreography: per-character jitter, sparkle tracks typing, theatrical stamp, bars grow in), chosen over `sb01` (restrained). Source briefs live in `dwmkerr.com/scratch/jev-explainer/typewriter/`. Article context: `dwmkerr.com/content/post/2026/decision-models-understanding-jev/`.
