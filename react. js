// frontend-utils.js - Lightweight DOI metadata fetcher
async function fetchDOIMetadata(doi) {
  try {
    // Use Content-Negotiation to get JSON-LD from doi.org
    const response = await fetch(`https://doi.org/${doi}`, {
      headers: { 'Accept': 'application/vnd.citationstyles.csl+json' }
    });
    
    if (!response.ok) throw new Error('DOI not found');
    
    const metadata = await response.json();
    
    return {
      title: metadata.title,
      author: metadata.author?.[0]?.family ? 
        `${metadata.author[0].family}, ${metadata.author[0].given || ''}` : 'Unknown',
      published: metadata.issued?.['date-parts']?.[0]?.join('-') || 'n.d.',
      publisher: metadata.publisher || 'Unknown Repository',
      type: metadata.type || 'dataset',
      url: `https://doi.org/${doi}`
    };
  } catch (error) {
    console.warn(`Failed to fetch metadata for ${doi}:`, error);
    return null; // Fallback to static display
  }
}

// Usage: Enhance presentation cards on page load
document.addEventListener('DOMContentLoaded', () => {
  document.querySelectorAll('.doi-link').forEach(link => {
    const doi = link.textContent.trim();
    const card = link.closest('.card');
    
    // Show loading state
    const citeBtn = card.querySelector('.cite-btn');
    const originalBtnText = citeBtn.innerHTML;
    citeBtn.innerHTML = '<span>⏳</span> Loading...';
    citeBtn.disabled = true;
    
    fetchDOIMetadata(doi).then(metadata => {
      if (metadata) {
        // Update card with live data (optional enhancement)
        const titleEl = card.querySelector('h3');
        if (titleEl && metadata.title) {
          titleEl.textContent = metadata.title;
        }
        
        // Re-enable cite button with enriched citation
        citeBtn.innerHTML = '<span>📋</span> Cite This';
        citeBtn.disabled = false;
        citeBtn.onclick = () => {
          const citation = `${metadata.author} (${metadata.published}). ${metadata.title}. IPR-CAD Conference. https://doi.org/${doi}`;
          navigator.clipboard.writeText(citation);
          // Show feedback (as in original code)
        };
      } else {
        // Fallback to static behavior
        citeBtn.innerHTML = originalBtnText;
        citeBtn.disabled = false;
      }
    });
  });
});
