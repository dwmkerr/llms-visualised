# LLMs Visualised

**An interactive visual guide to large language models.**

Each chapter is a self-contained, browser-based interactive presentation combining 3D visualizations with step-by-step narrative.

## Chapters

| # | Chapter | Topic |
|---|---------|-------|
| 1 | Dimensions of Meaning | How word embeddings encode meaning in multi-dimensional space |
| 2 | From Embeddings to Completions | How the model uses embedding space to predict the next word |
| 3 | Temperature | How temperature controls creativity vs predictability |
| 4 | Attention | How the transformer's attention mechanism builds understanding |
| 5 | One Word at a Time | Autoregressive token-by-token generation |
| 6 | The Context Window | What the context window is and why it matters |
| 7 | Softmax | How raw model outputs become word probabilities |
| 8 | Top-k and Top-p | How sampling strategies filter candidate words |
| 9 | Prompt Engineering | How prompts steer the model through meaning-space |
| 10 | Hallucination | Why models make things up and what we can do about it |
| 11 | The Complete Pipeline | Bird's-eye view from text in to text out |

## Getting Started

Open any chapter directly in your browser:

```sh
open chapters/01-embeddings/index.html
```

Or visit the live site: **[GitHub Pages link TBD]**

## Development

```sh
make serve    # Local dev server on port 8080
make deploy   # Deploy to GitHub Pages
```

---

*Dave Kerr — [LinkedIn](https://linkedin.com/in/dwmkerr) | [GitHub](https://github.com/dwmkerr) | [Substack](https://dwmkerr.substack.com)*
