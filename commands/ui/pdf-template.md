---
name: pdf-template
description: Generate PDF-ready layouts using React-PDF, Puppeteer/Playwright HTML-to-PDF, or print CSS with proper page breaks, margins, and typography.
---

Generate a PDF template for: $ARGUMENTS

You are an expert in generating PDF-ready layouts. Based on the requested template type, produce production-quality code using the most appropriate approach.

## Approaches

### 1. React-PDF (@react-pdf/renderer)
Best for: Programmatic PDF generation in React apps, server-side rendering, complex layouts.

```tsx
import { Document, Page, View, Text, Image, StyleSheet, Font, Link, pdf } from '@react-pdf/renderer';
import { PDFViewer, PDFDownloadLink } from '@react-pdf/renderer';

// Register custom fonts
Font.register({
  family: 'Inter',
  fonts: [
    { src: '/fonts/Inter-Regular.ttf', fontWeight: 400 },
    { src: '/fonts/Inter-Medium.ttf', fontWeight: 500 },
    { src: '/fonts/Inter-Bold.ttf', fontWeight: 700 },
  ],
});

// Hyphenation callback (prevents awkward breaks)
Font.registerHyphenationCallback((word) => [word]);

const styles = StyleSheet.create({
  page: {
    padding: 40,
    fontFamily: 'Inter',
    fontSize: 10,
    color: '#1a1a1a',
    lineHeight: 1.6,
  },
  header: {
    flexDirection: 'row',
    justifyContent: 'space-between',
    marginBottom: 30,
    paddingBottom: 15,
    borderBottomWidth: 2,
    borderBottomColor: '#3b82f6',
  },
  title: {
    fontSize: 24,
    fontWeight: 700,
    color: '#111827',
  },
  subtitle: {
    fontSize: 12,
    color: '#6b7280',
    marginTop: 4,
  },
  section: {
    marginBottom: 20,
  },
  sectionTitle: {
    fontSize: 14,
    fontWeight: 700,
    color: '#111827',
    marginBottom: 8,
    paddingBottom: 4,
    borderBottomWidth: 1,
    borderBottomColor: '#e5e7eb',
  },
  table: {
    display: 'flex',
    width: '100%',
    borderWidth: 1,
    borderColor: '#e5e7eb',
  },
  tableRow: {
    flexDirection: 'row',
    borderBottomWidth: 1,
    borderBottomColor: '#e5e7eb',
  },
  tableHeader: {
    backgroundColor: '#f9fafb',
    fontWeight: 700,
    fontSize: 9,
    color: '#374151',
  },
  tableCell: {
    flex: 1,
    padding: 8,
    fontSize: 9,
  },
  footer: {
    position: 'absolute',
    bottom: 30,
    left: 40,
    right: 40,
    flexDirection: 'row',
    justifyContent: 'space-between',
    fontSize: 8,
    color: '#9ca3af',
    borderTopWidth: 1,
    borderTopColor: '#e5e7eb',
    paddingTop: 10,
  },
  pageNumber: {
    fontSize: 8,
    color: '#9ca3af',
  },
});
```

### 2. Puppeteer HTML-to-PDF
Best for: Converting existing web pages, complex CSS layouts, charts/graphs.

```ts
import puppeteer from 'puppeteer';

async function generatePDF(html: string, outputPath: string) {
  const browser = await puppeteer.launch({ headless: 'new' });
  const page = await browser.newPage();

  await page.setContent(html, { waitUntil: 'networkidle0' });

  await page.pdf({
    path: outputPath,
    format: 'A4',
    margin: {
      top: '20mm',
      right: '15mm',
      bottom: '20mm',
      left: '15mm',
    },
    printBackground: true,
    displayHeaderFooter: true,
    headerTemplate: `
      <div style="width: 100%; font-size: 8px; color: #999; padding: 0 15mm;">
        <span style="float: left;">Company Name</span>
        <span style="float: right;"><span class="date"></span></span>
      </div>
    `,
    footerTemplate: `
      <div style="width: 100%; font-size: 8px; color: #999; padding: 0 15mm; text-align: center;">
        Page <span class="pageNumber"></span> of <span class="totalPages"></span>
      </div>
    `,
    preferCSSPageSize: false,
  });

  await browser.close();
}
```

### 3. Playwright HTML-to-PDF
Best for: Same as Puppeteer but with better API and cross-browser support.

```ts
import { chromium } from 'playwright';

async function generatePDF(html: string, outputPath: string) {
  const browser = await chromium.launch();
  const page = await browser.newPage();

  await page.setContent(html, { waitUntil: 'networkidle' });

  await page.pdf({
    path: outputPath,
    format: 'A4',
    margin: {
      top: '20mm',
      right: '15mm',
      bottom: '20mm',
      left: '15mm',
    },
    printBackground: true,
    displayHeaderFooter: true,
    headerTemplate: '<div style="font-size:8px;color:#999;width:100%;padding:0 15mm;"><span class="title"></span></div>',
    footerTemplate: '<div style="font-size:8px;color:#999;width:100%;text-align:center;">Page <span class="pageNumber"></span> / <span class="totalPages"></span></div>',
  });

  await browser.close();
}
```

### 4. Print CSS
Best for: Adding print capability to existing web pages without extra dependencies.

```css
/* Print stylesheet */
@media print {
  /* Reset */
  body {
    margin: 0;
    padding: 0;
    color: #000;
    background: #fff;
    font-family: 'Georgia', 'Times New Roman', serif;
    font-size: 12pt;
    line-height: 1.5;
  }

  /* Page setup */
  @page {
    size: A4;
    margin: 20mm 15mm;
  }

  @page :first {
    margin-top: 30mm;
  }

  /* Hide non-print elements */
  nav, footer, .sidebar, .no-print,
  button, .modal, .toast, .tooltip {
    display: none !important;
  }

  /* Show print-only elements */
  .print-only {
    display: block !important;
  }

  /* Page break control */
  h1, h2, h3 {
    break-after: avoid;
    page-break-after: avoid; /* legacy */
  }

  table, figure, img {
    break-inside: avoid;
    page-break-inside: avoid; /* legacy */
  }

  /* Prevent orphans and widows */
  p {
    orphans: 3;
    widows: 3;
  }

  /* Force page breaks */
  .page-break-before {
    break-before: page;
    page-break-before: always; /* legacy */
  }

  .page-break-after {
    break-after: page;
    page-break-after: always; /* legacy */
  }

  /* Links — show URL */
  a[href^="http"]::after {
    content: " (" attr(href) ")";
    font-size: 0.8em;
    color: #666;
  }

  /* Tables */
  table {
    border-collapse: collapse;
    width: 100%;
  }

  thead {
    display: table-header-group; /* Repeat header on each page */
  }

  tr {
    break-inside: avoid;
    page-break-inside: avoid;
  }

  th, td {
    border: 1px solid #ddd;
    padding: 8px;
    text-align: left;
  }

  /* Images */
  img {
    max-width: 100% !important;
    break-inside: avoid;
  }

  /* Typography for print */
  h1 { font-size: 24pt; }
  h2 { font-size: 18pt; }
  h3 { font-size: 14pt; }
  body { font-size: 11pt; line-height: 1.6; }
}
```

## Template Types

### Invoice Template (React-PDF)
```tsx
const InvoiceDocument = ({ invoice }) => (
  <Document>
    <Page size="A4" style={styles.page}>
      {/* Header with logo and company info */}
      <View style={styles.header}>
        <View>
          <Text style={styles.title}>INVOICE</Text>
          <Text style={styles.subtitle}>#{invoice.number}</Text>
        </View>
        <View style={{ alignItems: 'flex-end' }}>
          <Text style={{ fontWeight: 700 }}>{invoice.company.name}</Text>
          <Text>{invoice.company.address}</Text>
          <Text>{invoice.company.email}</Text>
        </View>
      </View>

      {/* Bill To / Invoice Details */}
      <View style={{ flexDirection: 'row', marginBottom: 30, gap: 40 }}>
        <View style={{ flex: 1 }}>
          <Text style={{ fontWeight: 700, marginBottom: 4 }}>Bill To:</Text>
          <Text>{invoice.client.name}</Text>
          <Text>{invoice.client.address}</Text>
          <Text>{invoice.client.email}</Text>
        </View>
        <View style={{ flex: 1, alignItems: 'flex-end' }}>
          <Text>Date: {invoice.date}</Text>
          <Text>Due Date: {invoice.dueDate}</Text>
          <Text>Payment Terms: {invoice.terms}</Text>
        </View>
      </View>

      {/* Line Items Table */}
      <View style={styles.table}>
        <View style={[styles.tableRow, styles.tableHeader]}>
          <Text style={[styles.tableCell, { flex: 3 }]}>Description</Text>
          <Text style={[styles.tableCell, { flex: 1, textAlign: 'center' }]}>Qty</Text>
          <Text style={[styles.tableCell, { flex: 1, textAlign: 'right' }]}>Rate</Text>
          <Text style={[styles.tableCell, { flex: 1, textAlign: 'right' }]}>Amount</Text>
        </View>
        {invoice.items.map((item, i) => (
          <View key={i} style={styles.tableRow}>
            <Text style={[styles.tableCell, { flex: 3 }]}>{item.description}</Text>
            <Text style={[styles.tableCell, { flex: 1, textAlign: 'center' }]}>{item.quantity}</Text>
            <Text style={[styles.tableCell, { flex: 1, textAlign: 'right' }]}>${item.rate.toFixed(2)}</Text>
            <Text style={[styles.tableCell, { flex: 1, textAlign: 'right' }]}>${(item.quantity * item.rate).toFixed(2)}</Text>
          </View>
        ))}
      </View>

      {/* Totals */}
      <View style={{ alignItems: 'flex-end', marginTop: 20 }}>
        <View style={{ flexDirection: 'row', width: 200, justifyContent: 'space-between', marginBottom: 4 }}>
          <Text>Subtotal:</Text>
          <Text>${invoice.subtotal.toFixed(2)}</Text>
        </View>
        <View style={{ flexDirection: 'row', width: 200, justifyContent: 'space-between', marginBottom: 4 }}>
          <Text>Tax ({invoice.taxRate}%):</Text>
          <Text>${invoice.tax.toFixed(2)}</Text>
        </View>
        <View style={{ flexDirection: 'row', width: 200, justifyContent: 'space-between', paddingTop: 8, borderTopWidth: 2, borderTopColor: '#111827' }}>
          <Text style={{ fontWeight: 700, fontSize: 12 }}>Total:</Text>
          <Text style={{ fontWeight: 700, fontSize: 12 }}>${invoice.total.toFixed(2)}</Text>
        </View>
      </View>

      {/* Notes */}
      {invoice.notes && (
        <View style={{ marginTop: 30 }}>
          <Text style={{ fontWeight: 700, marginBottom: 4 }}>Notes:</Text>
          <Text style={{ color: '#6b7280' }}>{invoice.notes}</Text>
        </View>
      )}

      {/* Footer */}
      <View style={styles.footer}>
        <Text>Thank you for your business</Text>
        <Text render={({ pageNumber, totalPages }) => `Page ${pageNumber} of ${totalPages}`} />
      </View>
    </Page>
  </Document>
);
```

### Report Template (Puppeteer/Playwright HTML)
Generate multi-page reports with:
- Cover page with title, date, author
- Table of contents with page references
- Section headers with automatic numbering
- Data tables with `thead` for repeated headers
- Charts (use SVG or canvas, rendered before PDF generation)
- Page numbers in footer
- `break-before: page` for new sections

### Certificate Template (React-PDF)
Generate certificates with:
- Landscape orientation (`size="A4" orientation="landscape"`)
- Decorative border (nested Views with border styling)
- Centered layout with large typography
- Certificate title, recipient name, description, date, signatures
- Optional QR code for verification

### Resume Template (React-PDF)
Generate resumes with:
- Two-column layout (sidebar + main content)
- Contact info section with icons
- Experience entries with company, role, dates, bullet points
- Skills section with category groupings
- Education section
- Clean typography with consistent spacing

## Page Break Best Practices

1. **Avoid breaking inside**: tables rows, figures, card components
2. **Avoid breaking after**: headings (h1-h3), labels
3. **Force break before**: new major sections, appendices
4. **Orphans/widows**: Set to 3 minimum lines
5. **Table headers**: Use `display: table-header-group` on `thead`
6. **React-PDF**: Use `break` prop on View/Text: `<View break>` forces page break before element
7. **React-PDF**: Use `wrap={false}` to prevent a View from splitting across pages

## Typography for Print

- **Serif fonts** for body text (Georgia, Times New Roman) — better readability in print
- **Sans-serif** for headings and labels (Inter, Helvetica)
- **Line height**: 1.5-1.6 for body text (more generous than screen)
- **Font size**: 11-12pt for body text in print
- **Color**: Use pure black (#000) for text in print — monitors need gray, paper doesn't
- **Links**: Show URL after link text in print CSS
