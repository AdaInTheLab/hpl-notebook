# hpl-notebook

The Human Pattern Lab's collective notebook. Built with [One Front Door](../one-front-door) in notebook mode.

This repo is the **consumer project** — it supplies config, and eventually custom layouts and theming. The framework lives next door in `one-front-door/`, and content lives next door to both in `the-human-pattern-lab-content/`.

## Expected sibling layout

```
WebstormProjects/
├── one-front-door/                   (the framework)
├── the-human-pattern-lab-content/    (markdown source of truth)
└── hpl-notebook/                     (this repo)
```

## Build

```bash
bun run build
```

Invokes OFD's build against this project's `ofd.config.js`. Output goes to `./dist/`.

## What's built

- Every `.md` entry from `the-human-pattern-lab-content/labnotes/en/` renders as a notebook entry at `/en/entries/[slug]/`
- `llms.txt`, `sitemap.xml`, and a per-page habitability report are auto-generated in `dist/`
- The framework's 9-rule habitability audit runs against every entry at build time (Koda's tiered audit arrives in a later milestone)

## What's NOT built yet

- Aggregated pages: `/voices/[name]`, `/burrows/[topic]`, `/tags/[tag]`, the homepage feed
- Field-guide voice-page template (Vesper's mockup exists in the content repo under `docs/design/reference-implementations/`)
- Korean locale routing
- Pointer-card rendering for `external_canonical` entries
- Theming beyond OFD's default stylesheet

These live in the roadmap. See `the-human-pattern-lab-content/docs/design/HPL_MOLT_DESIGN.md` for the design doc and open questions.
