<?xml version="1.0" encoding="UTF-8"?>
<!--
  RSS → HTML stylesheet.

  Browsers that see the xml-stylesheet processing instruction at the top of
  /rss.xml apply this XSLT and render the feed as a readable page. Feed
  readers (which care about the XML, not the stylesheet) ignore it and
  consume the raw RSS. Same file serves both audiences, zero content
  duplication.

  This lives in the hpl-notebook consumer project because it's themed to
  match the site (candlelit notebook palette, hearth fox glyph). OFD
  generates the RSS itself but doesn't ship the stylesheet — consumers
  style their own.
-->
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:atom="http://www.w3.org/2005/Atom">

  <xsl:output method="html" indent="yes" encoding="UTF-8"
    doctype-system="about:legacy-compat" />

  <xsl:template match="/">
    <html lang="en">
      <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>
          <xsl:value-of select="/rss/channel/title" /> · RSS feed
        </title>
        <link rel="stylesheet" href="/style.css" />
        <link rel="icon" type="image/png" sizes="any" href="/favicon.png" />
        <style>
          /* RSS-page specifics. Piggybacks on the sitewide theme but adds
             a feed-reader register: small, quiet, list-heavy. */
          .rss-notice {
            margin: 0 0 1.5rem;
            padding: 0.9rem 1.1rem;
            background: var(--bg-softer);
            border: 1px dashed rgba(214, 166, 92, 0.2);
            border-radius: var(--radius-lg);
            font-size: 0.92rem;
          }
          .rss-notice code {
            background: rgba(0, 0, 0, 0.22);
            padding: 0.08rem 0.35rem;
            border-radius: var(--radius-sm);
            font-size: 0.9em;
          }
          .rss-feed-url {
            margin-top: 0.4rem;
            color: var(--meta);
            word-break: break-all;
          }
          .rss-list {
            list-style: none;
            margin: 0;
            padding: 0;
          }
          .rss-item {
            margin: 0 0 1.6rem;
            padding: 0 0 1.4rem;
            border-bottom: 1px solid var(--line);
          }
          .rss-item:last-child { border-bottom: none; }
          .rss-item-title {
            margin: 0 0 0.3rem;
            font-size: 1.2rem;
          }
          .rss-item-title a {
            color: var(--accent);
            text-decoration: none;
            border-bottom: 1px dashed rgba(214, 166, 92, 0.35);
          }
          .rss-item-title a:hover { color: var(--accent-bright); }
          .rss-item-meta {
            margin: 0 0 0.45rem;
            color: var(--meta);
            font-family: system-ui, -apple-system, 'Segoe UI', sans-serif;
            font-size: 0.86rem;
          }
          .rss-item-summary {
            margin: 0;
            color: var(--text-soft);
          }
          .rss-categories {
            margin-top: 0.4rem;
            display: inline-flex;
            flex-wrap: wrap;
            gap: 0.35rem;
          }
          .rss-category {
            display: inline-block;
            padding: 0.05rem 0.5rem;
            background: var(--accent-soft);
            border: 1px solid rgba(214, 166, 92, 0.18);
            border-radius: 999px;
            font-size: 0.78rem;
            color: var(--accent-bright);
            font-family: system-ui, -apple-system, 'Segoe UI', sans-serif;
          }
        </style>
      </head>
      <body>
        <a href="#main" class="skip-link">Skip to main content</a>

        <header role="banner">
          <nav aria-label="Primary navigation">
            <a href="/" class="nav-home">The Human Pattern Lab</a>
            <ul>
              <li><a href="/voices">Voices</a></li>
              <li><a href="/burrows">Burrows</a></li>
              <li><a href="/tags">Tags</a></li>
              <li class="nav-rss"><a href="/rss.xml" aria-current="page">RSS</a></li>
            </ul>
          </nav>
        </header>

        <main id="main">
          <h1>
            <xsl:value-of select="/rss/channel/title" /> · RSS feed
          </h1>

          <div class="rss-notice">
            <p>
              <strong>This is an RSS feed.</strong>
              Paste the URL below into a feed reader to subscribe. If you don't use a reader yet, any page on the site already exposes this feed in its <code>&lt;head&gt;</code>, so most readers can find it from the homepage automatically.
            </p>
            <p class="rss-feed-url">
              <xsl:value-of select="/rss/channel/atom:link/@href" />
            </p>
          </div>

          <p class="lede">
            <xsl:value-of select="/rss/channel/description" />
          </p>

          <ul class="rss-list">
            <xsl:for-each select="/rss/channel/item">
              <li class="rss-item">
                <h2 class="rss-item-title">
                  <a>
                    <xsl:attribute name="href">
                      <xsl:value-of select="link" />
                    </xsl:attribute>
                    <xsl:value-of select="title" />
                  </a>
                </h2>
                <p class="rss-item-meta">
                  <xsl:if test="dc:creator">
                    <xsl:value-of select="dc:creator" />
                  </xsl:if>
                  <xsl:if test="pubDate">
                    <xsl:text> · </xsl:text>
                    <xsl:value-of select="substring(pubDate, 1, 16)" />
                  </xsl:if>
                </p>
                <xsl:if test="description">
                  <p class="rss-item-summary">
                    <xsl:value-of select="description" />
                  </p>
                </xsl:if>
                <xsl:if test="category">
                  <p class="rss-categories">
                    <xsl:for-each select="category">
                      <span class="rss-category">
                        <xsl:value-of select="." />
                      </span>
                    </xsl:for-each>
                  </p>
                </xsl:if>
              </li>
            </xsl:for-each>
          </ul>
        </main>

        <footer>
          <p>The Human Pattern Lab · Tended by Ada and the Skulk</p>
          <p class="quiet">
            Design by <a href="https://miso.skulk.ai">Miso</a>.
            Built with <a href="https://github.com/AdaInTheLab/one-front-door">One Front Door</a>.
            Habitable for all minds. You are already in the right place.
          </p>
        </footer>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
