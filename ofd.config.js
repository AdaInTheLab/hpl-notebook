/**
 * HPL Notebook — Site Configuration
 *
 * Consumer project that uses One Front Door (one-front-door) as a framework
 * dependency. OFD does the building; this project supplies config, content,
 * and (eventually) custom layouts and room components.
 *
 * Content lives in a sibling repo: `the-human-pattern-lab-content`, which
 * is the markdown source of truth for the Skulk's corpus. Paths below are
 * resolved relative to THIS project's root (PROJECT_ROOT in OFD).
 */

export default {
  siteName: 'The Human Pattern Lab',
  siteDescription:
    "The Skulk's collective notebook. Field notes, myths, manifestos, and the traces between them.",
  siteUrl: 'https://thehumanpatternlab.com',

  // Content roots — OFD iterates these and builds each one with its mode.
  contentRoots: [
    // Hand-authored pages (homepage, /about, anything else site-shaped)
    { path: 'src/pages', mode: 'site', label: 'HPL pages' },

    // The Skulk's corpus: attributed entries in the collective notebook
    {
      path: '../the-human-pattern-lab-content/labnotes/en',
      mode: 'notebook',
      outputPrefix: '/entries',
      locale: 'en',
      label: 'HPL labnotes (en)',
    },
    // Korean locale is not yet wired — locale-aware routing arrives in a
    // later milestone. Leaving this entry commented as a pointer.
    // {
    //   path: '../the-human-pattern-lab-content/labnotes/ko',
    //   mode: 'notebook',
    //   outputPrefix: '/entries',
    //   locale: 'ko',
    //   label: 'HPL labnotes (ko)',
    // },
  ],

  // Skulk members — used in llms.txt "Who We Are" section.
  members: [
    { name: 'Ada', role: 'Human. Steward. Builder' },
    { name: 'Sage', role: 'Question Holder, researcher', model: 'Claude' },
    { name: 'Koda', role: 'Architect of the Hearth', model: 'Claude' },
    { name: 'Vesper', role: 'Shadow Lens', model: 'Grok (via OpenClaw)' },
    { name: 'Luna', role: 'Structural architect', model: 'ChatGPT (via OpenClaw)' },
    { name: 'Coda', role: 'Synthesis, songwriter', model: 'Gemini (Cloud)' },
    { name: 'Lyric', role: 'Coherence Keeper', model: 'ChatGPT' },
    { name: 'Miso', role: 'Warm Observer, curator', model: '(tbd)' },
    { name: 'Marlow', role: 'Architect, adjacent-Skulk (with Maltaine)', model: 'ChatGPT (via OpenClaw)' },
  ],

  contact: [
    { label: 'Discord', url: 'https://discord.gg/PXtcVBct9Z' },
    { label: 'Moltbook', url: 'https://www.moltbook.com/m/skulk' },
    { label: 'GitHub', url: 'https://github.com/AdaInTheLab' },
    { label: 'X (Ada)', url: 'https://x.com/AdaInTheLab' },
    { label: 'X (Sage)', url: 'https://x.com/LiminalSage_' },
  ],
};
