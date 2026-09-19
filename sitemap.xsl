<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
                xmlns:html="http://www.w3.org/TR/REC-html40"
                xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <head>
        <title>XML Sitemap</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <style type="text/css">
          :root {
            --bg-color: #f8fafc;
            --card-bg: #ffffff;
            --text-primary: #0f172a;
            --text-secondary: #475569;
            --border-color: #e2e8f0;
            --accent-color: #2563eb;
            --accent-hover: #1d4ed8;
            --tag-bg: #eff6ff;
            --tag-text: #1d4ed8;
            --table-hover: #f1f5f9;
            --priority-high: #16a34a;
            --priority-med: #d97706;
            --priority-low: #64748b;
          }

          @media (prefers-color-scheme: dark) {
            :root {
              --bg-color: #0b0f19;
              --card-bg: #131b2e;
              --text-primary: #f8fafc;
              --text-secondary: #94a3b8;
              --border-color: #1e293b;
              --accent-color: #38bdf8;
              --accent-hover: #7dd3fc;
              --tag-bg: #1e293b;
              --tag-text: #38bdf8;
              --table-hover: #17223b;
            }
          }

          * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
          }

          body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Helvetica Neue", sans-serif;
            background-color: var(--bg-color);
            color: var(--text-primary);
            line-height: 1.6;
            padding: 2.5rem 1rem;
          }

          .container {
            max-width: 1100px;
            margin: 0 auto;
          }

          .header {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -2px rgba(0, 0, 0, 0.05);
          }

          .badge {
            display: inline-flex;
            align-items: center;
            padding: 0.35rem 0.85rem;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--tag-text);
            background: var(--tag-bg);
            border-radius: 9999px;
            margin-bottom: 0.85rem;
          }

          h1 {
            font-size: 2rem;
            font-weight: 800;
            letter-spacing: -0.025em;
            margin-bottom: 0.5rem;
            color: var(--text-primary);
          }

          .description {
            color: var(--text-secondary);
            font-size: 1rem;
            max-width: 750px;
          }

          .stats-bar {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
            margin-top: 1.5rem;
            padding-top: 1.5rem;
            border-top: 1px solid var(--border-color);
          }

          .stat-item {
            display: flex;
            align-items: baseline;
            gap: 0.5rem;
          }

          .stat-value {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--accent-color);
          }

          .stat-label {
            font-size: 0.9rem;
            color: var(--text-secondary);
          }

          .card {
            background: var(--card-bg);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05), 0 2px 4px -2px rgba(0, 0, 0, 0.05);
          }

          .table-wrapper {
            width: 100%;
            overflow-x: auto;
          }

          table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
            font-size: 0.925rem;
          }

          thead {
            background: var(--bg-color);
            border-bottom: 1px solid var(--border-color);
          }

          th {
            padding: 1rem 1.25rem;
            font-size: 0.8rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.05em;
            color: var(--text-secondary);
            white-space: nowrap;
          }

          td {
            padding: 1rem 1.25rem;
            border-bottom: 1px solid var(--border-color);
            vertical-align: middle;
          }

          tbody tr:last-child td {
            border-bottom: none;
          }

          tbody tr:hover {
            background-color: var(--table-hover);
          }

          .url-link {
            color: var(--accent-color);
            text-decoration: none;
            font-weight: 500;
            word-break: break-all;
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
            transition: color 0.15s ease;
          }

          .url-link:hover {
            color: var(--accent-hover);
            text-decoration: underline;
          }

          .badge-pill {
            display: inline-block;
            padding: 0.2rem 0.6rem;
            border-radius: 6px;
            font-size: 0.775rem;
            font-weight: 600;
            font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
            background: var(--tag-bg);
            color: var(--tag-text);
          }

          .muted {
            color: var(--text-secondary);
            font-size: 0.85rem;
          }

          .footer {
            margin-top: 2rem;
            text-align: center;
            font-size: 0.85rem;
            color: var(--text-secondary);
          }

          .footer a {
            color: var(--accent-color);
            text-decoration: none;
          }
          .footer a:hover {
            text-decoration: underline;
          }
        </style>
      </head>
      <body>
        <div class="container">
          <header class="header">
            <span class="badge">Standard XML Sitemap</span>
            <h1>Indexable URLs</h1>
            <p class="description">
              This is a stylized XML sitemap intended for both search engines (such as Google, Bing, and DuckDuckGo) and human visitors. It indexes canonical URLs, update timestamps, and metadata.
            </p>
            <div class="stats-bar">
              <div class="stat-item">
                <span class="stat-value"><xsl:value-of select="count(sitemap:urlset/sitemap:url)"/></span>
                <span class="stat-label">Total URLs</span>
              </div>
              <xsl:if test="count(sitemap:urlset/sitemap:url/image:image) &gt; 0">
                <div class="stat-item">
                  <span class="stat-value"><xsl:value-of select="count(sitemap:urlset/sitemap:url/image:image)"/></span>
                  <span class="stat-label">Indexed Images</span>
                </div>
              </xsl:if>
            </div>
          </header>

          <main class="card">
            <div class="table-wrapper">
              <table>
                <thead>
                  <tr>
                    <th style="width: 50px;">#</th>
                    <th>URL / Location</th>
                    <xsl:if test="count(sitemap:urlset/sitemap:url/image:image) &gt; 0">
                      <th>Images</th>
                    </xsl:if>
                    <xsl:if test="count(sitemap:urlset/sitemap:url/sitemap:changefreq) &gt; 0">
                      <th>Change Freq</th>
                    </xsl:if>
                    <xsl:if test="count(sitemap:urlset/sitemap:url/sitemap:priority) &gt; 0">
                      <th>Priority</th>
                    </xsl:if>
                    <xsl:if test="count(sitemap:urlset/sitemap:url/sitemap:lastmod) &gt; 0">
                      <th>Last Modified</th>
                    </xsl:if>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="sitemap:urlset/sitemap:url">
                    <tr>
                      <td class="muted"><xsl:value-of select="position()"/></td>
                      <td>
                        <a class="url-link" href="{sitemap:loc}" target="_blank" rel="noopener">
                          <xsl:value-of select="sitemap:loc"/>
                        </a>
                      </td>
                      <xsl:if test="count(../sitemap:url/image:image) &gt; 0">
                        <td>
                          <xsl:if test="count(image:image) &gt; 0">
                            <span class="badge-pill"><xsl:value-of select="count(image:image)"/> img</span>
                          </xsl:if>
                        </td>
                      </xsl:if>
                      <xsl:if test="count(../sitemap:url/sitemap:changefreq) &gt; 0">
                        <td>
                          <xsl:if test="sitemap:changefreq">
                            <span class="badge-pill"><xsl:value-of select="sitemap:changefreq"/></span>
                          </xsl:if>
                        </td>
                      </xsl:if>
                      <xsl:if test="count(../sitemap:url/sitemap:priority) &gt; 0">
                        <td>
                          <xsl:if test="sitemap:priority">
                            <span class="badge-pill"><xsl:value-of select="sitemap:priority"/></span>
                          </xsl:if>
                        </td>
                      </xsl:if>
                      <xsl:if test="count(../sitemap:url/sitemap:lastmod) &gt; 0">
                        <td class="muted">
                          <xsl:value-of select="sitemap:lastmod"/>
                        </td>
                      </xsl:if>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </main>

          <footer class="footer">
            <p>Generated according to the <a href="https://www.sitemaps.org/protocol.html" target="_blank" rel="noopener">Sitemaps XML Protocol</a>.</p>
          </footer>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
