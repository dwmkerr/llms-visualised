# Specification

## Overview

**LLMs Visualised** — An interactive visual guide to large language models.

A chapter-based guide explaining how LLMs work, targeted at a general audience who want intuitive understanding without academic jargon.

Each chapter is a self-contained HTML file with:
- A split-panel layout: narrative text (left) + 3D visualization (right)
- Step-by-step slides navigable via buttons or keyboard
- Three.js-powered interactive 3D scenes
- No build step required — works by opening in a browser

## Goals

1. Make LLM concepts tangible through interactive 3D visualizations
2. Build understanding progressively — each chapter builds on the last
3. Keep it accessible — no ML background required
4. Ship as a static site on GitHub Pages

## Architecture

```
chapters/
  01-embeddings/index.html      # Word embeddings & dimensions
  02-completions/index.html     # From embeddings to next-word prediction
  03-temperature/index.html     # Temperature parameter
  04-attention/index.html       # Attention mechanism
  05-autoregressive/index.html  # Token-by-token generation
  06-context-window/index.html  # Context window limits
  07-softmax/index.html         # Logits to probabilities
  08-top-k-top-p/index.html     # Sampling strategies
  09-prompts/index.html         # Prompt engineering
  10-hallucination/index.html   # Hallucination & mitigations
  11-pipeline/index.html        # Full pipeline overview
index.html                      # Landing page with chapter navigation
```

## Tech Stack

- **Rendering**: Three.js r160 (CDN, no bundler)
- **Styling**: Vanilla CSS, Inter font
- **Interactivity**: Vanilla JavaScript
- **Hosting**: GitHub Pages
- **CI**: GitHub Actions (copy to gh-pages branch)

## Design System

All chapters share a consistent visual language:

- **Layout**: 40% narrative panel (light) / 60% 3D panel (dark)
- **Typography**: Inter font, stage labels in small-caps, bold titles
- **Navigation**: Previous/Next buttons + progress dots + keyboard (arrows, space)
- **3D Style**: Dark background (#0a0a0f), glow spheres, fog, OrbitControls
- **Colors**: Warm amber, coral red, sky blue, violet, green for data points
- **Responsive**: Stacks vertically below 800px

## Status

- [x] Chapter prototypes (wip/)
- [ ] Finalize chapter content
- [ ] Create landing page
- [ ] Create shared CSS/JS (optional — may keep self-contained)
- [ ] GitHub Pages deployment pipeline
- [x] Choose project name: LLMs Visualised
